Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4EAC5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 18:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220E210E970;
	Fri,  8 Mar 2024 18:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5XBcxRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0336310E970
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 18:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709922127; x=1741458127;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F/vOk9As90xlgnsqKCiWpNfLENPJUlozuU1ZCFe6Ah4=;
 b=H5XBcxRWTcoHoGzUNcpTdRjGKnmxXKQDLqGeaIXWBi5y9cJRsQB/27Mv
 5mRKoj3z8IUEHtlJf0Iwazmosrcxd3Cg+BiQMdffc5uKBXe8WrEW7X/9Y
 FzywKIokpMwHN9GqJw9PQOwfUKj7nAqQ9QSgNI8xuqact31U3fg9lAqHo
 O/vFoiVpX2RReYOAsY8INDkEhtuMAc+Jo0b7ycoV/QzLRE+YDX4w8rFLX
 pMMhpzCTj3YGz8cvwA1g7zlXtHkVraJ4S0637SGDgAZQaTD5jPVAGrtH8
 ET/W+Hc8Z20fZf5ZZ0ilMQT0HPrsZ4IzVZ1leQrKE4ing8IGgdqgu3sxC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4497937"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4497937"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 10:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="41508276"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 10:22:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 10:22:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 10:22:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 10:22:05 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 10:22:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuH19qjYxzx/3IQ3BacRhN49fYzSMsBhTe9dZSRrgLXV048b5xBDs8vbm/mfh+zwB+dBeSZSvweobom7o2359r6UWzz5SU0zhz9jVDaLeet6FYumccNFLaCVejtsxzpg9P8byzG0NE9H3wX45YpHl8WGLb2TT2wq4IerR3QMlwGtZTo1mgwJymNl0I2lgPchCkm9dMkwNNDzMWt25le39U9doUBCK7VAyayn306/WfJ049AeBwR4dqvwtVEsRJaM4SPKOiiseX7P8GQG/z+vTaADZV31HDqI7OrSxWk3ctWTtOUFJJwvd1XV1LnUHwqhFAsgDi6La6Oo1WyiOahMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CPi042zIxBlv/ndFZcR/mwJt/HqJtucEFWSfHywbPA=;
 b=FAYaCSB4yAQ1ObYw4JRWvVG5HTqPD318t8XpJoMuorryQzjUfqw7F2IaaUnF+C6bdbkJzEbTwVVRVzvUp+I1pBBgjnSBs29F1l9K2Z9zyswwYu/Awj+n19BXakM1IH9jAOf31FoCEdtPMtAw+3PmwOMOB93anodbGTYqIQwTrc1b2S+0dFNipg6NgMBHandLaPY0V6R1gpe3n0WS3MdMosAMX7sfBzfv2k0fzuXsVqeVtewkSyHw4wIwr82eU0dcbQRtsB+f6+CiVGL/cQRO0rh+lZEhvo0SPW1JRCU/WBGXmMiGFzZLP42Jyad6ewdWsCuYRFMHmjl6gX1vUnuaDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4837.namprd11.prod.outlook.com (2603:10b6:510:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.11; Fri, 8 Mar
 2024 18:22:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 18:22:03 +0000
Date: Fri, 8 Mar 2024 12:22:01 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/pvc: Fix WA 18020744125
Message-ID: <wl7himtpafnxx4oqkduff7qwsnjo6gefph74v5jcfanwyk43bb@7ejmoprnqlxz>
References: <20240306192128.1895603-1-lucas.demarchi@intel.com>
 <20240306192128.1895603-2-lucas.demarchi@intel.com>
 <20240306230951.GE718896@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240306230951.GE718896@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:40::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4837:EE_
X-MS-Office365-Filtering-Correlation-Id: fc8d5f4a-053b-4d94-03b2-08dc3f9ca73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q+P3pGckQ+KwWECT/iNWbWBOV9f0AuWQv1CnLbjg9fJ5iMOSjBrzxRXwqFrGF9fcdEHD62rSbCWYJdpla7gPTAHOmzaA88reWwkNR6XfhVtnXxiBIm+d2E2Vo6+JNpbCY7e2uqN6ey1Lm1xnU7N6FAfYXSwjucVIDbNGvU1cFjdNv1yd6UbZH7JzRFxAR0zq4EbJrJ2p5U19rdKSqJgIWNYXMkdwZ4pJ66ZKNOVbeMJ17122h5LoEqkjALsxR8PLTUDlfd2/N6XgCSrOOlYyiLtN4txrccdujoWQbIZWNXRxV0uuxnIhg6pQrb56u55Z8idjw/Ehzo0S/akWS0JopCEwUw57KtyG0ZzXGDRbmEkX90z/OiKojPfyWeC9etM48m2c6jaGeEM7yijHr6AmN2km1ccDW3AeAuachGQBvGfVCzsd4hBj6l5j70Lgp/zea/6R8tAuAL9+hiu68tqVsEQXzW48qLWlWVw7bb97V2bRiJKzfJjDxXjOyDT0cEW+QL/VrFQCzoEs3IH3NhAnMKJQ9L0Q1qWvWsC101giKSbs2fdx8KG6m0D0Dg1YCGCTAlLzgsg9Ry45ch9cgLR6Z5ih3jpcZleBo2/1GXgPrgW74I9+OReklejMnR03TtT8keZiQTs9pe9is02f162QT2a3sA7VW2aqPtPzxzycb/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FNYrQw424G1gQY3EQSAeKGi6jSPvfg3zdJHTrdqaZ1Uc82qvkjUmw0wblZ79?=
 =?us-ascii?Q?GeS0CmEv0z4e8SKMcOg+coEjhiTQJbqF0A4NIpl8ZkYU5Uyvg2plcDkbFgl7?=
 =?us-ascii?Q?Gwr8UTLAGOuTdX+a9B2dgghUJ5mOZWk31gjUumnAW5s3EoquH8A2MNVpoA+P?=
 =?us-ascii?Q?LJqC4aefrkwxPWyj1d9ZBmCA2D+dohe6SRJeXkrFg6Avsmh4lJwx5BO7NKn9?=
 =?us-ascii?Q?1IL32QPYjPesVwWV+57AkR1J+SKTS/fhuBa18QLiMjYUDZ/lU1lU6tilZuF1?=
 =?us-ascii?Q?f4UPeIrCNOUJwD7m9bCSLZvAhxDO1oqVva1i8/yDurqvJcVnJGZ2IzvgSMV5?=
 =?us-ascii?Q?L9K3MLddpCjTErc6OYn8H/cRQWWwsGJUVY6W7RUx3xgWmKvvF7KQp+SnLPsD?=
 =?us-ascii?Q?eZjCnO47l4441CbQgnEmDFKmPNAgDsD8X2c6QYH6lEQDhWS7xsEwPcnGk1oh?=
 =?us-ascii?Q?Thit8FblNjw4vZSej9lQiwVwBpe/L9MkiFKD9/JBu0j5PhsRfBlQ7YlnJr2l?=
 =?us-ascii?Q?lnc1+Xu7AqSacXqQwJrho8RABWEerl6x6AZkkX9wkkJISlGc4gnxx4Y1Ciyi?=
 =?us-ascii?Q?XChh2+diTQ/JVetUSNrwH43AgB3nrpy0dUSUUCmbCbOBohNEIY4QYgMXs4H7?=
 =?us-ascii?Q?Lb8hSHgCNvauX/Q3TtTvyhYqXLgzoFLcru5yb8YuRxfGoNus+eJBZ4R/Onpp?=
 =?us-ascii?Q?Wb688F/pIbUmbNhmV3HTZKWEG6zRbJbvfvoducrBLKW5JDw1ptfWo+kT3Wmc?=
 =?us-ascii?Q?uAlmRbYcgc3Tc0bm3vFvPtuhIlvKEPDw4j7jJKMfivJKkpzvFh3AFpwKGrdd?=
 =?us-ascii?Q?ZYHYywdEeifCsEWETf9nWG/mYiqa+dsk3G+l3jysspQU/4l/fA7EF4TX1CMm?=
 =?us-ascii?Q?TGn1sZBiTc+jsivGo4OGOIP63s7qNTt6HdXF9PJUciRcKvrqDv3rN0x1WqQm?=
 =?us-ascii?Q?QoSFq2e8TZdn/cEesMUqXjdxbDQR2EfyvuY9ZBHtifs7SwbelMgWJm8bwV/u?=
 =?us-ascii?Q?HKJuxVmS2Rr7ECfMRb3MSfcdYSwxfrgZIv7CH2gN2HKR9YsOohMkrfY60vVi?=
 =?us-ascii?Q?E8vxoWxxmWvyquGhoHTkb5wCrwQ/s+ISrXUeAP+vXfpyG9Ct0B1ZQZT1DcgH?=
 =?us-ascii?Q?oyVkjzCrmhV9Jj4E5VYxeVcTduW3h05Y8WjW7wjr7JK8cXdWUdM8evEcD3Pj?=
 =?us-ascii?Q?jCvQjMy0QiSp5UDitFTJQCq0pSmfkKXZkoHI8KJRRINv5QF32Mv59I/k9UYW?=
 =?us-ascii?Q?Qm/usNhiePnX5l9NSmvu9+bKKMDpS6KddittyaKhnrG1CNflOvBksA8bbAV4?=
 =?us-ascii?Q?evZz4MPu39ff7nI85hETpMWCnyuAMZ4tSwDmDU1hRkH79J0EBSwnArnz5+wq?=
 =?us-ascii?Q?EtmbmnTHZ2rOBXRQYgItPMXdq1IBxcNcLSafyAQvUn/o+VkKyOkkgssy8bzH?=
 =?us-ascii?Q?VDE+SiwCy0swieiJj8X2kqPBE50t2A5B0KN+CrnLMrBdpeiy5jQMiFcRn9XN?=
 =?us-ascii?Q?QBrvh8xLdBvJj5d38nvovCYbeIf1reAE9qr8Z8C+DRErnK1L4u3LCodCaREe?=
 =?us-ascii?Q?w0fqOG8IADgtj3vHqoisD+yTXRtrNr6VFNh+iUwhQiUnHe7AEO+YVhFwISmM?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8d5f4a-053b-4d94-03b2-08dc3f9ca73d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 18:22:03.4893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFS1y4O928DLuNeSvie3pmif1bPecJXTIly/UILNC6hVrChQdXOs/kYyFjlDuOt3lIhISs29pcks7s+ZTlaD55eGNaoMaKsuaaLRHtUKbHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4837
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 06, 2024 at 03:09:51PM -0800, Matt Roper wrote:
>On Wed, Mar 06, 2024 at 11:21:28AM -0800, Lucas De Marchi wrote:
>> With the current state GUC_WA_RCS_REGS_IN_CCS_REGS_LIST could in theory
>> be removed since there is no render register being added to the list of
>> compute WAs. However the real issue is that 18020744125 is incomplete
>> and not setting the RING_HWSTAM on render as it should.
>>
>> Writing this in RTP is a little more tricky as we want to write to
>> another's engine base when the match happens: first compute engine and
>> no render present. So use RING_HWSTAM(RENDER_RING_BASE) instead of the
>> usual XE_RTP_ACTION_FLAG(ENGINE_BASE).
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


now that PVC is back to life, confirmed that this works as intended.
Diff from /sys/kernel/debug/dri/1/gt0/register-save-restore:

  bcs8
         REG[0x3ee0c4] clr=0x00003f7e set=0x00000102 masked=yes mcr=no
  ccs0
+       REG[0x2098] clr=0xffffffff set=0xffffffff masked=no mcr=no
         REG[0xe48c] clr=0x00000800 set=0x00000800 masked=yes mcr=yes
         REG[0xe7c8] clr=0x40000000 set=0x40000000 masked=no mcr=yes
         REG[0x1a0c4] clr=0x00003f7e set=0x00000104 masked=yes mcr=no


Applied to drm-xe-next. Thanks

Lucas De Marchi

>
>> ---
>>  drivers/gpu/drm/xe/xe_wa.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 2460c570e628..54740d246310 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -377,6 +377,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
>>  	},
>> +	{ XE_RTP_NAME("18020744125"),
>> +	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute),
>> +		       ENGINE_CLASS(COMPUTE)),
>> +	  XE_RTP_ACTIONS(SET(RING_HWSTAM(RENDER_RING_BASE), ~0))
>> +	},
>>  	{ XE_RTP_NAME("14014999345"),
>>  	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
>>  		       GRAPHICS_STEP(B0, C0)),
>> --
>> 2.43.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
