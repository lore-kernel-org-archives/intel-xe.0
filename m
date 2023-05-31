Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6E2C7EE2E
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 13:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8561410E4BB;
	Wed, 31 May 2023 13:00:37 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D14210E4BB
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685538035; x=1717074035;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=aBadcnDZfLSncTZtJ9PIThJFtKIrZgqlD9a9cp5bMa4=;
 b=idzXkaH5w7KRlX5tv41SYZmnS/FBg0nnbsLX4++GTjmzdFJcX0km+ttU
 UXQKyjyOrm/cgpxzcHp3Y0tk3Sth2mGnYCcmU0GaS0aHYGcgmaO5HdvHe
 ZMhP+2/y4cwxnuHhVM3B+ltdQ3+ms0reuFDHLP441m2uTgUrtaH+6E8Gs
 dCPjEVZTBGS46H1XCdBVXQch/HHE046uJYNB1UvZ18PweDf4Y6Ls+VUNK
 WB6nsUGPYA3FTwpl2C2WUWPgBAz6j90+uLhYQGMfz9OgvTs4afrk5CEK8
 e7dO3Zsoq5RRPjDyGw7fTAWWdWpRcDL3aqC+bWbBZuHr6R6rutKtcThdA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="352724385"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="352724385"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 06:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="684385454"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="684385454"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 31 May 2023 06:00:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 06:00:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 06:00:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 06:00:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I55pRpCBu0ejo9ztETz3QlIYOjTK1glL6CXe7LKZ8hoh1EcCBpSBc3hNlzxoU2BHOpFvlJ4Olul+xQzj8vjFRt3zsy4U21vH+Y1rB81TXyyMzHVqQEXUthDcLiZ3LOAZkftGH8Nbvt67hJqw08XUAloT7dsx1DOvKpWMaQuaTFsifhuz64aUaGs0fHjs8raEalq+hYQp8cpxeXrw+Wakk8ryIE7FCdSh+RJRmOCSefDsNUiO7HgmFywZWjausZ8SZujN2GWxSoTIvVBEzfcHAa7KRDMQvdb22EkUFsNCKEAY0TjTSZ9Mrv0l+Pb7UxDyrGfWIUAtGIBbkDwaXMVqgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73SKAcheKfTbm1xrq9aUQafPCUlCeuQCKHecaymDnlA=;
 b=gw8/qhJNTAPQFxSpVqhu+fNPOKtZeSRdEBTU69hBS7eh8mW0HR9yYRz/XG1GkhEZgz7PzPHT3LBRcJ+1WFojzZqJ6yEvoCDPWySWFiW42m8bMSgLyxxMWpu7jAu8WSeYDjZNkhcJdSKbQVtNI0udvIzdovI422Y4+6ItH864MSS85OhKSoGHJmtwRVi3K2bUIOk2Q6KxBFo2ZaEU9FYzKPRRm/SGnoynIGmWo5Wv03sATzBuKebi3+0PBltPyuQ4O8LXpYH+/7TlFoJbNhDxgdc08ssG902OpmecMZPF56rHEwGpD1DsPWYum05GsRRMJ8+RjKZvQcJq2mFukT+GDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SN7PR11MB6560.namprd11.prod.outlook.com (2603:10b6:806:26c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 13:00:31 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 13:00:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230531061902.389333-1-lucas.demarchi@intel.com>
References: <20230531061902.389333-1-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Wed, 31 May 2023 10:00:25 -0300
Message-ID: <168553802546.51912.6652036170881588518@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR17CA0002.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::15) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SN7PR11MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de09092-1d0f-4bfd-83ec-08db61d703d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SXePldqjEFCZYRqF7UHRP5GzlMIZvyUmYxMDH5uupxP6557hOAtWYxBmmStwWJftwggZe7387rjC84pguWhazUeXBpF/68req70GR8++jSUFRYIGBAKw5hthfrKyXw7Jh0cbwp7PXWO5MeTazmVQaB4ngglXhen6wr4Mlai4fSWoNR33VSrStJ+NbJdtKvkuanU2Iuhi9GIHzR57egwaCeRi5nN7Xr01vYAFBl2/fu9hXaMmmg+xDKdT1CeECMX2tzA4PuxH0nf26XcRehrAYZKNBOmWmy7BpL9d7a4gaGKBTc3XWSo35lWDOTITSok1dtoKfE6Gge1o8S/cEE+nRlXQIXGzLhKZOB1HL+6l/8aIFctWOJyPOqyFzLwNTKpqYAH+zE926LtA6bLe5NqhrVgCn5QEiiHVC5nP92i4CNk6yfYWeotS0eaZurCzjWlMbsAgVb+xpKIjR3nNFDoiqb6tPWb0OG9L8b25TOsGWc/2WTjoFKHrIc2M9X0TzThR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199021)(966005)(6666004)(478600001)(6486002)(26005)(83380400001)(33716001)(186003)(9686003)(86362001)(38100700002)(6506007)(6512007)(82960400001)(107886003)(316002)(41300700001)(66556008)(66946007)(4326008)(66476007)(44832011)(5660300002)(8936002)(8676002)(2906002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHN2U3dEWjRGYXJlYkd1SWU4NnhPR2Z3dTBXRlRhZ0FLMzA0MlhCOWRNMlhl?=
 =?utf-8?B?ekcwK2puRnljMVFob1VZTVZXem5LWlYyT3JqV2xsNWtTakwzN0xZTms3L2Yx?=
 =?utf-8?B?bm8vS0lRSUdIY012alp0NWxhM2g1b0hmOStvRGlJeEhQYTlZd0Nuekh6QzU4?=
 =?utf-8?B?aGE5SDdwMHFFYlB3NHVmb3A4eVBnUkxDbG9jWlJMSHplNTdOQ2NNTGVSa0xK?=
 =?utf-8?B?dHcydnlsT1dtZ2pYSlZRZ2RWUWxMTUt2d1NDeXhxK25xUGpYcXRyaEthU0Ft?=
 =?utf-8?B?dVg3NUZCOVRqRjRpMlV6eE9pU3NlQWMxTjRQZWk0OUllakxFMzAzdVlYQTQ0?=
 =?utf-8?B?SkJKdHdIK3NHVUVwSnBubVBpbmphK0R1OENoUTlCNStOOVZCTjNiSElmZ2x4?=
 =?utf-8?B?eEpGRnRLM1VwNERSWmdVUEZsUkdPNFBpMnpIVWxaRDBpMmFvM296dmRMa1Np?=
 =?utf-8?B?WU84SXBidnJEZHJhNGx3MkpRNWdOUVQ3TmlsSkU3cVRjV3NCdUp2MDdLOFVh?=
 =?utf-8?B?NTAwUWlQWTlweG04UHZ5cmF1NDlpT0NaZ1MyeFVSYWNtZFdZcDl2M2tKTzN0?=
 =?utf-8?B?NzI0bmlrNENvZi9DUEJnMzhPNDNUb1FRTFIrQmZwTXdqSDJic3MwelpZR0NL?=
 =?utf-8?B?S2VwcCtNdmt5UlVpN09NS0lpc1gzcVRkUUpaRkFxK0ViTFpiVFRJc0plc2R0?=
 =?utf-8?B?R0lXaFJ0QUhZbm5NNTRhL0NVSXNvWUhWczFCU2lYa0tpT3huN3VTNWxnTWwr?=
 =?utf-8?B?bkczdEFoYkxOU0VzVUVuZURieG01dlIyejVCeERQNWFENWlya2t5RzVyb2dX?=
 =?utf-8?B?ZDVDVm85VWhPM01YTCtDeVFJT2lrVnUyZytXY2NaN3B3emM3OGZ1OUdZRCt3?=
 =?utf-8?B?WUttMDB2YSsxeFZ4WnM2aEJEVXhTcHFaMWpaNHpSVHBQTVU1NE15NGtwUURw?=
 =?utf-8?B?WnBvTVhlVklHRWdCUGtOMWJ0UEhtblR3a0VhOERRNS8wanZWcWd1TWVyUzhF?=
 =?utf-8?B?Vks0bzRQazAvMFNRY3RzeHRpODNiMyt2cFZrRW92ck5UWTlLcXMxL1VQem1K?=
 =?utf-8?B?S1BGcm9POUNuV2RUaW5wY3VPakFTUnUrQ2hkUlR2bm0xc09hMmFtMnVhUE9Y?=
 =?utf-8?B?dXArcC9YOGZ0aDhsL0owWTZ2VXVIK1Fyb2RMQ09IYXNlem5Bck44TzZtV2xi?=
 =?utf-8?B?YndUNVkxUTlYQ2xSdW90aWxTRGxnaFc2V2gwSDh1WWpCbEJITDlBSHYxWit6?=
 =?utf-8?B?V0V2SEZlREJkeml1azgwak5YdEp6VlZTYWxaUVI1YnFUOHdWelk4UjVtYVR6?=
 =?utf-8?B?VU85cDU3RkJiWTN6cUFTVDE0amxBVGVVQTRKYk9IVmEzSlUyUFhoZzRsVUhO?=
 =?utf-8?B?eExpNmlWRWMyYTNXWHdMdWRSTmdlNTg5WGtHT2svNGwxREVQOE8yd2pnbUl4?=
 =?utf-8?B?QmJsWkx0cUc3dnhaQWMxcE5OcmJpUDd4R2RNWDIwNGFoL3BIL1JDU1VCbCtQ?=
 =?utf-8?B?bXpEUVp1aWxxTjlRUnB4OGNFZXFyZjdBVnZ1dUVmUEhEQTBoSWo5b2FIM1Fv?=
 =?utf-8?B?OVBWRHBaOVV4Sjg4Ti9sVWF5U1NQaUI1NGFVR2tyWHZndUxMcGxDMU1WaEZq?=
 =?utf-8?B?RkZSWjlNRmZ2ZTdyVlBXcDFUa21rN0d1SVQ4VDdyMnVmeFdNZ3R0N1dBL2xw?=
 =?utf-8?B?S2xYemRqaWQ1dHRhdEhaOHZjcDFVcUFnVE5OM0NQZkJSSG5PL2xEZU5DblE2?=
 =?utf-8?B?NUljNTFOU2dka0J4S1UweXNHRGRFamQrSzgwRDY4WEV3d2lEaHE4dHA4dTI2?=
 =?utf-8?B?ZmRqeHBYek9CREdXK0UwTkhEZ3VQTVl3VExIaG1td3E4aHVGWFlteGFxamdC?=
 =?utf-8?B?eXo4bHg3SndIcUhrREdjMmZlM0FIdFYzbDVHR0NYRzJJMUsvbm8vSzdQQjhn?=
 =?utf-8?B?R1ZBazV4VkNtVkZuaUsxR0o3cXpHU1plcnhENVpEdDJQMXdvVjJsQW1BMG1Y?=
 =?utf-8?B?Mm56UU5GTXVtL3VGVmlJTURDY1lXYll4eVFFRHZlaEd0Q2w5aG9Ed2g2TFQ2?=
 =?utf-8?B?eXFsZUlFZzMvczNJOFJDeW42cWVobHdUa0pzSkJvV3pJYkNnTk85UEFUR3ZF?=
 =?utf-8?B?UmQzVVllVXo1b2tSc1BpejZFZUYyV2ZuZ2ViOGthM2RzSkhRRlFYc1cvK3hr?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de09092-1d0f-4bfd-83ec-08db61d703d1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 13:00:31.5230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWYrjY9CuVm65yRGFUUuZrohbqinlicXHrG0wqdwH6dx4ZWKU70Y9O5+APzNLz0rIRyU1jUSGFFPxQBUdQRUkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6560
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-05-31 03:19:02-03:00)
>drm/xe/sr: Fix too many kfree() on reallocation
>
>When re-allocating the array, the previous location shouldn't be freed.
>The issue can be more easily reproduced by reducing
>XE_REG_SR_GROW_STEP_DEFAULT. This was crashing kunit during cleanup
>on semi-random places depending on the number of save-restore entries.
>
>Jointly debugged with Matt Roper.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Checked and krealloc does free the old pointer if a new one is created,
so:

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

By the way, I would suggest to send single-patch fixup with a cover
letter, just so Patchwork doesn't think this is a new revision of an
existing series. For example, this patch was included as a new revision
of [1].

[1] https://patchwork.freedesktop.org/series/115290/

--
Gustavo Sousa

>---
> drivers/gpu/drm/xe/xe_reg_sr.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr=
.c
>index 24d9c73ef279..434133444d74 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -57,7 +57,6 @@ static struct xe_reg_sr_entry *alloc_entry(struct xe_reg=
_sr *sr)
>                 if (!arr)
>                         return NULL;
>=20
>-                kfree(sr->pool.arr);
>                 sr->pool.arr =3D arr;
>                 sr->pool.allocated +=3D sr->pool.grow_step;
>         }
>--=20
>2.40.1
>
