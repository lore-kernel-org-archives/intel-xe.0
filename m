Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548A5C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 14:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2097910E077;
	Fri,  8 Mar 2024 14:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ej88D+vY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAC710E64A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709906617; x=1741442617;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=4duwp7zX2q3MQ2hF2gPspF8ATEjblO2nshbhdQzQNYI=;
 b=ej88D+vY1oKdABDCTVuciLas3f8UDRZ8igdfvg0ePcYwT1d1W6EQbbE1
 TffNjSUY0k5SXF2HMKvKrNeL9ZjOJAIDV/TeADqljinb7r8/3GNy5kw9r
 FHtSg4jao/FQbs7LfqVn00NS/FVet3gQTKqyqEQ4Qc2RGZ/sN+Rbz7nMt
 kl22y+vBuVf2KENbtlWIlVvocrNy6ZHj3XQl8zuztPj9t5DlMA2HGk/k6
 u8JFWHqGDfLHi3f6PH8pq3+NHMIy7eWpXGFJWYJzKkrZsvCSkrWkT69xF
 kj1pL7ht3o647vO9Zjhgck13n0O0EzVs+sdUOsec3bjhTnteoojPj6Xp2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22077432"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="22077432"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 06:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10916597"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 06:02:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 06:02:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 06:02:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 06:02:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvkwcQuL4iT2sj4ldv4lE4RIHUu0Ljf9p63/5D6wLQv5x8QN4zCo5xFelT2ghpdcYNDdv3cX7QE5mZbHBG7tezsxBOmf4BmKYBNoSXZvRsWngw2wz8+p/C5iv2tFwsaLPxuYFlH5Bs2WxkowZwsXARm4sERDh5c8zdRWseZlAJL14oaaaNG77+kSvg4X0ZuVxre7vloIZlsFHSgIpmBhOHPAqgTvOK3nr4Sj4Q69VlqKxWJVxSRoH/Z4EZ1jEE65mrTauXOEsqi2f4fgg+x4sKCx6xgN46d4SGc9dWyuECgatBVngtf4NLS8IKKglCooGKRqeyNI89kp+F6gHxXQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lR9K0Z2Ai6ApF+Z+XO2RFFSEDpEen+n1gaOLCBQ1oCE=;
 b=PYnHojCooU+p8PCYENUx6KooG/OvdDxxKWONntJjF923tWF4dKqkuGSbaBYH/ZswbucaTrJWVR+exLsLbEq56iTIna+tAhCLHFRNPw3JEUff1WquA94WQvXrrFTQKuzkn+HIVoHrg7YdB2J46dh2RRT0KnTVS2p9kEDZdozofCFNzRfk3uMA6C42g2Fm1ogsgrScpzQPpm9+o6wf53ggkJ8hyS7taF5NJu5omHuGCUjAFFxN7IUvAn0kAyQtc75Qveby44zGlI+i1cWHO47Kn+SXxgvkS+OCzIzaturSqQ7AHH0jQVOqZvQDBWUqi40WNPp2ffY4kDyhqdSFQOn7aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB5069.namprd11.prod.outlook.com (2603:10b6:a03:2ad::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 14:02:48 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::2823:ea18:552f:fb09]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::2823:ea18:552f:fb09%7]) with mapi id 15.20.7386.009; Fri, 8 Mar 2024
 14:02:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240308134202.901394-1-daniele.ceraolospurio@intel.com>
References: <20240308134202.901394-1-daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH xe-for-ci] drm/xe/pvc: fix CI GuC FW path
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, John Harrison <John.C.Harrison@Intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 8 Mar 2024 11:02:43 -0300
Message-ID: <170990656325.47565.11180699829412876725@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:a03:333::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b21ae1a-e53b-4f09-b297-08dc3f786f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZcfxgJWlZ8RE0/CA1X/U5DLqbFko+F2bMXjOHPbomh4io19Fw/QRhCrKhOL6pI7dmtWuFv2gKoMCM1WSfcg9Xn1rarn08NI5G5O20lJBWIUabsw9faJPaTd0jY1tMMd8D+TfwO+ypq87l2WE0yWPAUxv0n0fy1pdQxGIcTMnniM2Y4E2tzrDH7uZiKf82Hd6KhocaB17olDvSr+kt8K+D7KXkJdqzWfnc42xNP5WarCCY9WaeF/93k+U8xHT2j+768+W0qUNEWVHHki2moUYwcuFowUiNoZcxZuI9CsxcN9SBZA7bXlkflw1yMIFmx7qW+9JVbUQFJsRP+FGrrfUQWvV7xC+gp3BAcaMRFZ3qPEWMB1k/GYe+9w2bPQZEbPKHu6MmHa4mI30rzx5xePjlmOqQJC4ox+N/42GjsV1xWAz5NmSBdB89ifi16AugSqcLu2A4vOs0s3IWgK9A6fD90CbKZEfpQrIwFvWIvQdXhl4EcQgvRFO9sgablgFnKPJ+VvEYcp6XCQlWhnTTOB0gDpvUGgmmG52s7HSwLnn7e45nMWt1mNLbn1HOftY94kbnkz1ncgnJWM5Nlb6To32qhxoEK1X6AsJ4lfADE2rTbb9ModCRY/q35DSiOGGRDK7hCZyNRjE7drOEewUMFQy/e/CQp9HjSar1Q9BIaRxI4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXRjeW1HYmpxSTVDdTQ3VWgzVzJ3ZVBQTHRTeEM3a0J4VDltaEtmOVlicThY?=
 =?utf-8?B?STJ4WTZjT0xyaGJucDNwOW4xUDBOenMzS080aXozNDVrNi9QQWtPVEdJYlNB?=
 =?utf-8?B?UDFEaTNGSmxFWmJHdVNqckJPRFRobWVJbm45Y2psRUhNNDcwSExmcm80NWhY?=
 =?utf-8?B?MEwwYmNST1Exbmk5TFpBY1pSZDRlRDRtMEs4MEgvRFRYOTh6V2YxQ0x6b0lh?=
 =?utf-8?B?T1NDMzhuNVVKV1BMam1oaU9zcDNuaWROck1QWmVEcDREOWxRS3hJZ0NSRjFh?=
 =?utf-8?B?OE9nZCtvcFk5bVFLQjN6U3lUeGZINUJDR1FDUUdIVUxBOXVGS3ZDa2c2NUlH?=
 =?utf-8?B?Z3pkTVVpeWVHUENYU1JkeGVSZ2tVMngxYStXZTFlem5BMlJxQnV5TmFZK0w2?=
 =?utf-8?B?RlFzVnRzdUxGQTIwN3JzY3pBekNBeUNJODNnRjk3L0tuN01mNkR1c1U1dW9Y?=
 =?utf-8?B?d0h3eCtyeGgyVlJKSHI5OW96NDJ6Q3dOWi9mTGFVempzL2o3TVMrTHVvNUxS?=
 =?utf-8?B?RHpULzlsVG1QVTBidm9oalN3OVo1dngvdW5CUjZFbkxRUElZU3JhbVpzQjF5?=
 =?utf-8?B?dzhSUUdUbXdRbGNjc3V0NWxLNytVSlJrZGFvb3F3Q2orN2hhTU5kRFVoTVFY?=
 =?utf-8?B?Z2JvbVFJM25URHgwRDkzK3dtRWxQbTVaVXRYV211ZlZPa1RZOCswTTJkZGV4?=
 =?utf-8?B?MGdKTCtCV2FBZU1uc0xValA0MEw2czhNdDdySElhUVhKSFp5TmxpTVp4UmQw?=
 =?utf-8?B?N1ptT1I5azgvaTJoQ3kxazNnbi9Gcm4yQ0xBUTQ3UkIzWlp5RElvTmh6cTM5?=
 =?utf-8?B?T1VQYUZ0eWc4bXB5MmZPelAxYVNHaFozRjY1SlordzJ3RUtXZSs1Ylk5Nzho?=
 =?utf-8?B?aFl3a3JRS1JBeFZ6R1hUQVE4NFkySlltTEFubjlzdGltOTdZRkxsOHdSajF0?=
 =?utf-8?B?ZjJUK0xQQWJKTVN6dnVVZjlEekE1aEV2L3NuTkMxTjJYcjljN1RGMm9oR2M5?=
 =?utf-8?B?WEFNdmdFN3ROUkdpckNZUTVjSWgrQ3RSVkdKalpHTlU5TFliWFp2Q0R6L3ly?=
 =?utf-8?B?M2Z6VXBVbGNVOEFaS2dKcS80aXllVXlZcEF0cHBLUFNBSGl2MTVVblFLcXZK?=
 =?utf-8?B?RHd3RncxU1BQcnJZZ0FzU1dtcGl0UWhkVXkyWURxdytKTnV2dUxSME0ydHJS?=
 =?utf-8?B?QUNiZUt0c2NaaEM3RW1WUDV6Q01UQWRJMmFRLzQwbHo3WmU3WGxFRDlrUmxo?=
 =?utf-8?B?RDN0OE5aU296THdzMFg4ZVFvUk1TcGxiNzhwdCs4dkkvOFRqZDUyTS9GbWtQ?=
 =?utf-8?B?WGNRRlAwaDhhcXBWKzQ3MGJwNGNleUR0VlJiS09KL01NWWFFdTNmZTJKamdu?=
 =?utf-8?B?M1FCOHlWZzNFbVlKNWVGcDZ5M0twK1llMFBNZ0NCUldKNVJJMmZhUWpIS0oy?=
 =?utf-8?B?ckdoaHlqcDhkeWhNRzJCMGkyS204cHUzMEYrdkwyZXZTUk94d2dhM25mTU0v?=
 =?utf-8?B?cUJjaUd2STBTRnY2cWJPeGc0aE1tUFRUejBrUE4vQXNUV0o0QWJvaW4wUzFt?=
 =?utf-8?B?UTlOK2xoRWh3VEdRQ3FEVmlOVFpNeFRZdllFWkpEdXB0QU5TWUpvWnBKcHh1?=
 =?utf-8?B?cDBWK2ZrclMzd0Npd041T29QUG5tUkJvZUdla2twODhnZEJYNGFUVUluSkh2?=
 =?utf-8?B?RDVBZzdybjdCVFNFdkxpOFlzWWdaOEJOQUNET3hSWUJUZENsUURwZ0t5TXVr?=
 =?utf-8?B?cm1Ed1Fwd3VrVzZyUUUxT2lXV09HM2pMY1FpOTZmNWxNVnpwaCsxSmg1SXBy?=
 =?utf-8?B?OHdIWDNSQXJnam1FS3Nhd2drYjVTeldqL0FlY0lJWDBkRC9hNVVSMkd0b1B5?=
 =?utf-8?B?YnJuZ0JwTytYTDVUZU5CUlNTOENPNS9DaTRRazNqTGwzaUlLMlJ6bnNlenlr?=
 =?utf-8?B?bkhXZGpMalhFU09TTTdTZzNrTXFPL3ZETkhHK2dJMFNYY01UaFdDajY5dlUv?=
 =?utf-8?B?dVF1YVRhc25PMm5uYVhEZU1MY2JhNjc1M05vaENvVUZzaythWnlWNmdnd2tJ?=
 =?utf-8?B?NjRjY1ZWNkZMOTBNL3plWnZ2cnQzblVPTEFjNFoyYStFL2VKWmJpWDZ6UDJF?=
 =?utf-8?B?OHYrOVRZVThmaUhYRDNYc00xNWIwTnJuazYvd0JrK2k5MkcxL1lJc3lCU3R0?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b21ae1a-e53b-4f09-b297-08dc3f786f90
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 14:02:48.1391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qizH/LjUxLCNxRaDVB98Vto1QDShPybnS8/Hw75wq0Yw1kuAFAV7nU+I5Mk+kPVpVXCqnRCo7yWX8xaCZNoSyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5069
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

Quoting Daniele Ceraolo Spurio (2024-03-08 10:42:02-03:00)
>The new repo flow has the CI firmwares located under the intel-ci/
>folder, so we need to update the path in the driver. This messes a bit
>with the formatting, but since this is a CI-only patch it doesn't really
>matter.

I'm not opposed to have our CI pipelines also grabing stuff from the xe/
and i915/ directories from the intel-for-ci branch if that makes things
easier on the GuC side.

For DMC, I'll keep using intel-ci/{i915,xe} to keep an explicit
separation :-)

>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>

Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
>
>This patch can be squashed in the existing fw definition patch
>
> drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 7751d6ba6ce0..44b8c5f58fd8 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -105,7 +105,7 @@ struct fw_blobs_by_type {
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)                 =
       \
>         fw_def(LUNARLAKE,        major_ver(xe,        guc,        lnl,   =
     70, 19, 2))        \
>         fw_def(METEORLAKE,        major_ver(i915,        guc,        mtl,=
        70, 19, 2))        \
>-        fw_def(PVC,                mmp_ver(xe,        guc,        pvc,   =
     70, 20, 0))        \
>+        fw_def(PVC,                mmp_ver(intel-ci/xe, guc, pvc,        =
70, 20, 0))        \
>         fw_def(DG2,                major_ver(i915,        guc,        dg2=
,        70, 19, 2))        \
>         fw_def(DG1,                major_ver(i915,        guc,        dg1=
,        70, 19, 2))        \
>         fw_def(ALDERLAKE_N,        major_ver(i915,        guc,        tgl=
,        70, 19, 2))        \
>--=20
>2.43.0
>
