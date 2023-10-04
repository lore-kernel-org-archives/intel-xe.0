Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8782EE8FDC6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 02:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5AF10E331;
	Wed,  4 Oct 2023 02:26:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBB210E331
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 02:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696386383; x=1727922383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UKijA9nvmniajtNHzKkHiemfTc9B3y/5jcg/DBULW8g=;
 b=HS75niutpTfCONYMVuwqHxpqNU0GHAqzegUKaXSFfXLj2HhxkcT7QAlP
 tW4TxoFECJ/iu6YjchYlO+zV+jGCUNIwnV4unN8y6v3uKHiRtkWUhmLLt
 PkOm6uI764B99hWwL3wBpOTB8VrbgwqDxT42fpQloHbE2CChV4KBiBT2k
 PCVREdiao1rPy/s/CxJTbdwuyBpxj6F0lHzNRoe1Q6gCmwLFG6jwslIcw
 rWaOPwe5UmsMLcikb9WNjjU4FpTAyvJBMD2mSH0gwSZ2hK0tN7nZ6HO0s
 8JWPqWDw0WVnsa1U8Rpeti3X6e5jen7Jdn4hAzEwqtEJvLQKk2NbOWsgc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="381898454"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="381898454"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 19:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="924871725"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="924871725"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 19:26:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 19:26:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 19:26:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 19:26:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlJ5Zh3WGmlCBfZr7T/Euv62loyowEIzQzEyI6QCa2QbSzoKkYVctuhMz+XLwnA1cikg4TB3XXak9cvLbDkth3R5r6Ng9/QgXxO+8vKpNCwRdXNfPlypi9QNImSiMON11F9PXG0KdFl9npSAzeEhkMGIDeo4BPvdPNMU9FhdiQ65YX341qeS7Hu8Ey3FWt5Wh53+xeV9busg6C8dW5NjhRabpVBGyXou3M3WlclhMaq/2Atq8eto0HPqQAUcrbuR9eVj4CP86okb57Yk3ZoQ0EYCOU2tcx3Xcy+w5AMjIwYPoX/pd0SX0w2otfiGGq38EwXHTWiNlX8AuOcZp1ZUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7rGCOWTZVPNsSDixztYd1EIbNs1ooMUsQwGT/ylxa8=;
 b=LI7kD6AlaJ2mmfQe3gzsgDk9RAzztjJWfiHM8X2e/71az8fuIotF++o4yj706JlLFLpDU7Mm3xZPwQox52lXai4MWkMpQheHSX9eeyofb3Aw9Vwv6X75YZ7O73LMolfwyOobuuJZQN4KHlAPFy5Tin02sM7Y9rPKMEh3auoBYjVlZ1nQCgLVr7WstQS/RWxU/07tKstMQiPIG1cPXAk03iaq8UwsDFCK7MsUX4WFevrKM6d4W8z3WIj5EtB5bKjjwtEjtWlsvfQ6UuzdI+7rKfNi2kANPsIydDFXRnOJnIw920UbqBO/VstNiS4w+tnS6gRGq+RPjz0vN05GBX8spQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.34; Wed, 4 Oct 2023 02:26:19 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 02:26:19 +0000
Date: Tue, 3 Oct 2023 19:26:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZRzNSRPlZ7mJRCTB@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-15-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-15-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::28) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA0PR11MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: 352d3bf8-092a-4a17-5fe1-08dbc4814b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oc+i0RTFQH9DTiRyy6hpNesGR/tS5FOHil37QSqd20icx4i+oRXaQYNKp6o7JGxgqbTXBxqUakyOao02KzV9/JqE17vC9P7oBIqkYqJjKpAkzJ/bwxe1aUfqaElmQfmSSRjgsN6AnbnBoVrg1n2peEEFA4vBAUUvfNZIq36gDjwQcztsk/EHZFeMrcE/tKLbePzK5xV1T//F8MhZ+EBFNU8ObBGL4A8BlR9XMY719/Uzs8uPNBfzZncwmiujHbdjGpADmdB0/kYzcELIw1nBi5SPjy2TTJHxBkUXkGo8oWa+MGSD7mQcr/WULDoFVAY2Q9rA+rirXvoDOTLKVyxMg54j3OS+x+v6N7NFglFQIl+JBV8VfJhTfeDyZZ6nth9Ka7aRre++qFXaothvdKZ0+lFVrCldkx5+g143mg5KHthUGtTqetSV/ZnVpqGXW6q628jfzuxf+aFiykMUKVA2RM+xEx9beyQq0C+ybz0OWILFLqMn/hqGcbmfUflA8wemA8l12EBSvjc2PPES+eqsEC9/yKx2W9GO0S+BnCR2xVrhWDd18dw1AUfjLTJpmCAK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(396003)(346002)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(83380400001)(5660300002)(2906002)(38100700002)(6506007)(9686003)(6512007)(82960400001)(478600001)(86362001)(6486002)(33716001)(26005)(8676002)(6862004)(8936002)(4326008)(66946007)(316002)(6636002)(66556008)(66476007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2s0VmxaRTdwbWtTd2I4eXA3UERBZXJVV0dBYjRmdzEzQWlXUnROK1RQY0o0?=
 =?utf-8?B?K1JUODJoRDV3NFB1cnlTeHVWazBJdXgzTDBpZUIxUFdGemdxcEV2WEFYUlg5?=
 =?utf-8?B?QmtzSkhld09WWDFPOFc0VmtzeGFuYkdjNDNpZHpKSTFaRVhIQVBVOEJOM3Jo?=
 =?utf-8?B?L05wSk5INzFqZHliSlRBSHcxSGQwdVRYcEtFMW5UT2NrVElxODVQSkJsa0pP?=
 =?utf-8?B?U09PS1dXZXp2TlB3a3JxOVNkSzJ6bXFzUEpBcHo3dlJWRG0wc3FvcHlveC94?=
 =?utf-8?B?T0JhV2lrTmVVcHA5bFFvRnlxNStQb3M2TEl0SkpTdnNzaFpzMWdNR1lCb2Ix?=
 =?utf-8?B?empKT0NDYjA5OU5EYTJmdTZyR2RzNkptc1pEQXo2clZlVzNOVGl4dk1XMWpH?=
 =?utf-8?B?Z29FTExvMWgyMnl5Z0lvZi9rNjlYVWNNTnRQZkJEZXkyc1MvTjdDSWQ2ZTJX?=
 =?utf-8?B?ZDlXT0NWdlpiZVo0QkNEMG1ZM0xRZFg3Y0h6b2g3UHgxaXBZcEc5SXFvVWFF?=
 =?utf-8?B?VExPelMxZWFlKy9waHBWQzh5ZXdCQkViVm5ubnphd3UzM0NNQWFEVmVoRGhu?=
 =?utf-8?B?Qnd4L0FWTVdFZExqYWsxZDM3dHNydXcyanBscTI0K21ZYXV3Ni9mbEowK0pM?=
 =?utf-8?B?alhnZWlXL3VQZHlhU1hQT0Y4Q0tNeW5RRlBNbVk0aS9aK2cyTHZjUVFqa0lI?=
 =?utf-8?B?V3BvVmh6WndOMVRNdHZmMzU1Z01kTEZJeDRlWW10RHBpWk1oL2tRZUNGN0F3?=
 =?utf-8?B?cnFiU1RpeHVkSDFoWHF3OHh1dkdaWkVCVTNscURDL2RqTjdCbnZXQ2N6cUlM?=
 =?utf-8?B?MDJBa2lrcXhkMGZ1NEZLYnR3ZVBQUFY2cndaVzF5ZGN1L0VkRFNLKzNqQ01h?=
 =?utf-8?B?cHJIWDVpcldISkpOdDNveHFUYitTZjV5RVRmQmhJNmN1dVd6bzJ1VUduRkR0?=
 =?utf-8?B?VExjNWNqZnVnMGFUSitaQ1ZEaVA4WVpiK2tVQ28wUTVjeERMNlJMRlFHUk5F?=
 =?utf-8?B?eW5ZM0trQzVFYkpYMGFtVmRpZk0rekJGMGhPWEptdE5qWklZOC9pSjFvVUlh?=
 =?utf-8?B?elo3WjlCOXo2cFhsMS9qRnQ1SXNGM3ZVUU03SDhTaGpvRFo5UTU1OTkrbWxO?=
 =?utf-8?B?end2dGMrcWo5dDdGSmZ6SFVDRUh3a2VIcXUxbDdLZDVDdG5wdjdCV21Ka2Js?=
 =?utf-8?B?ZWpZcUJUVUhDTmlwRHc3Mlo3NWFxbm81VEZOUWVKQlZOODlTQ2s1OFpycm1N?=
 =?utf-8?B?YVNmdVd2aUF2QkZJSEYvYWdldlQwRVROSWtzVEcvbGVTcFQyZUFxWXYvSTBS?=
 =?utf-8?B?bTlXdmZTRHMwOVBOeFMwQ0hZT3BMblBReE9IRUNpcncwcWY3amF1a3psZTNJ?=
 =?utf-8?B?Z05jRGxpT2Q3Qlh4K1UxVVVkbUh1V0U1ZXg1OElDcTFJNmJtQ2NBSWw3V3Nw?=
 =?utf-8?B?S2xTbXV5M3dteDZzUWd6TTMyVnNMSXZDQjIwWXFmRVFnQ3ROMWlUL2k0SE9X?=
 =?utf-8?B?ZTlBZHRSd2dza3NGNmtTdDJiTjM4cWpIVHB3WGZuZ04zanJWcXgrdXZTUnVV?=
 =?utf-8?B?VTZKckFWNDFpS2daN2UzSE5hVEdsckt0ZHlpTzFBV0p2aWU2Witub0hPbmF0?=
 =?utf-8?B?cXJCTUpUZm10QkZvczBBekNOTGU5akV1YTJkbzVkcGZFUFk0YVFsNmdLeTQv?=
 =?utf-8?B?QWw5MUtBbGJjTGgrVjEyaGs5dzRwM0JRMm01WkpydG5tdEtDeTF3dFBMSnZv?=
 =?utf-8?B?bHhsNmtnUnpBcTd5b1Q3dXZyY05tUmFWUFM2WUxLb2hNaWtSU29nZGNUOHpn?=
 =?utf-8?B?Q2IxK1dicWtnQnI3cXRweHhSblcwRENlRjcvVDFVbU42Y0ltSyt0YmtnRVpV?=
 =?utf-8?B?bWYzRURzSm1WOFhMNUVpWmU0QUdRVnd1ZExERXVza1NSSDVrOTE2M25ta0U0?=
 =?utf-8?B?OURGakRtZ096Unhsdlk0RGpueHdubXpuRmJhaTVmQmpvNXdFcXJRLy9JY2Zn?=
 =?utf-8?B?a2hNTzg4eFc1VnFka1FEdkk5Qkk5aXdyd0VodDRGbEhyUlZuaGhxcXlEcFps?=
 =?utf-8?B?OGtxdVVtRFlVOERRMldscVhhcWlDV3R2NFRBdTRMRzRENml3cnJwVXNoUnow?=
 =?utf-8?B?R3RZQ2hxV0M1aEFYdzU2bFRnbGZhdXllSFpVTzNHL2lkaThoNktuM0I5NWFW?=
 =?utf-8?Q?JKmxoNvFSYMidza8914NsL8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 352d3bf8-092a-4a17-5fe1-08dbc4814b00
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 02:26:19.2307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZymqCihnDtGOt0ceZ3JRPB+YhEgoBELOZBF+HZSaw6AMeEjY/hKGJsOMPV9msel77HJlAeO8HueDXIxGDQsHv/0It0lF6/RgU270W/v/ckw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 14/21] drm/xe/uapi: Simplify OA configs in
 uapi
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 09:10:42AM -0700, Ashutosh Dixit wrote:
>In OA uapi, there is no reason to have separate mux/boolean/flex registers
>in 'struct drm_xe_oa_config'. The kernel knows ranges of these registers
>and can determine which are which when needed without these being provided
>through the uapi. Therefore combine the three register arrays into a single
>one in the uapi.
>
>Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

lgtm
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c       | 60 +++++++++-----------------------
> drivers/gpu/drm/xe/xe_oa_types.h |  8 ++---
> include/uapi/drm/xe_drm.h        | 48 +++++--------------------
> 3 files changed, 27 insertions(+), 89 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 63db0969a86b2..19ad23b90e6ad 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -88,9 +88,7 @@ static void xe_oa_config_release(struct kref *ref)
> 	struct xe_oa_config *oa_config =
> 		container_of(ref, typeof(*oa_config), ref);
>
>-	kfree(oa_config->flex_regs);
>-	kfree(oa_config->b_counter_regs);
>-	kfree(oa_config->mux_regs);
>+	kfree(oa_config->regs);
>
> 	kfree_rcu(oa_config, rcu);
> }
>@@ -970,16 +968,14 @@ static struct xe_oa_config_bo *
> __xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_config)
> {
> 	struct xe_oa_config_bo *oa_bo;
>-	size_t config_length = 0;
>+	size_t config_length;
> 	struct xe_bb *bb;
>
> 	oa_bo = kzalloc(sizeof(*oa_bo), GFP_KERNEL);
> 	if (!oa_bo)
> 		return ERR_PTR(-ENOMEM);
>
>-	config_length += num_lri_dwords(oa_config->mux_regs_len);
>-	config_length += num_lri_dwords(oa_config->b_counter_regs_len);
>-	config_length += num_lri_dwords(oa_config->flex_regs_len);
>+	config_length = num_lri_dwords(oa_config->regs_len);
> 	config_length++; /* MI_BATCH_BUFFER_END */
> 	config_length = ALIGN(sizeof(u32) * config_length, XE_PAGE_SIZE) / sizeof(u32);
>
>@@ -987,9 +983,7 @@ __xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa
> 	if (IS_ERR(bb))
> 		goto err_free;
>
>-	write_cs_mi_lri(bb, oa_config->mux_regs, oa_config->mux_regs_len);
>-	write_cs_mi_lri(bb, oa_config->b_counter_regs, oa_config->b_counter_regs_len);
>-	write_cs_mi_lri(bb, oa_config->flex_regs, oa_config->flex_regs_len);
>+	write_cs_mi_lri(bb, oa_config->regs, oa_config->regs_len);
>
> 	oa_bo->bb = bb;
> 	oa_bo->oa_config = xe_oa_config_get(oa_config);
>@@ -1825,6 +1819,13 @@ static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
> 		return xe_oa_reg_in_range_table(addr, gen12_oa_mux_regs);
> }
>
>+static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
>+{
>+	return xe_oa_is_valid_flex_addr(oa, addr) ||
>+		xe_oa_is_valid_b_counter_addr(oa, addr) ||
>+		xe_oa_is_valid_mux_addr(oa, addr);
>+}
>+
> static u32 mask_reg_value(u32 reg, u32 val)
> {
> 	/*
>@@ -1852,9 +1853,6 @@ xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
> 	int err;
> 	u32 i;
>
>-	if (!n_regs || WARN_ON(!is_valid))
>-		return NULL;
>-
> 	oa_regs = kmalloc_array(n_regs, sizeof(*oa_regs), GFP_KERNEL);
> 	if (!oa_regs)
> 		return ERR_PTR(-ENOMEM);
>@@ -1941,9 +1939,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
> 	if (XE_IOCTL_DBG(oa->xe, err))
> 		return -EFAULT;
>
>-	if ((!arg->mux_regs_ptr || !arg->n_mux_regs) &&
>-	    (!arg->boolean_regs_ptr || !arg->n_boolean_regs) &&
>-	    (!arg->flex_regs_ptr || !arg->n_flex_regs)) {
>+	if (!arg->regs_ptr || !arg->n_regs) {
> 		drm_dbg(&oa->xe->drm, "No OA registers given\n");
> 		return -EINVAL;
> 	}
>@@ -1964,38 +1960,16 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
> 	/* Last character in oa_config->uuid will be 0 because oa_config is kzalloc */
> 	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
>
>-	oa_config->mux_regs_len = arg->n_mux_regs;
>-	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_mux_addr,
>-				u64_to_user_ptr(arg->mux_regs_ptr),
>-				arg->n_mux_regs);
>+	oa_config->regs_len = arg->n_regs;
>+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
>+				u64_to_user_ptr(arg->regs_ptr),
>+				arg->n_regs);
> 	if (IS_ERR(regs)) {
> 		drm_dbg(&oa->xe->drm, "Failed to create OA config for mux_regs\n");
> 		err = PTR_ERR(regs);
> 		goto reg_err;
> 	}
>-	oa_config->mux_regs = regs;
>-
>-	oa_config->b_counter_regs_len = arg->n_boolean_regs;
>-	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_b_counter_addr,
>-				u64_to_user_ptr(arg->boolean_regs_ptr),
>-				arg->n_boolean_regs);
>-	if (IS_ERR(regs)) {
>-		drm_dbg(&oa->xe->drm, "Failed to create OA config for b_counter_regs\n");
>-		err = PTR_ERR(regs);
>-		goto reg_err;
>-	}
>-	oa_config->b_counter_regs = regs;
>-
>-	oa_config->flex_regs_len = arg->n_flex_regs;
>-	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_flex_addr,
>-				u64_to_user_ptr(arg->flex_regs_ptr),
>-				arg->n_flex_regs);
>-	if (IS_ERR(regs)) {
>-		drm_dbg(&oa->xe->drm, "Failed to create OA config for flex_regs\n");
>-		err = PTR_ERR(regs);
>-		goto reg_err;
>-	}
>-	oa_config->flex_regs = regs;
>+	oa_config->regs = regs;
>
> 	err = mutex_lock_interruptible(&oa->metrics_lock);
> 	if (err)
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 126692718c888..ac8b23695cc6e 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -52,12 +52,8 @@ struct xe_oa_config {
> 	char uuid[UUID_STRING_LEN + 1];
> 	int id;
>
>-	const struct xe_oa_reg *mux_regs;
>-	u32 mux_regs_len;
>-	const struct xe_oa_reg *b_counter_regs;
>-	u32 b_counter_regs_len;
>-	const struct xe_oa_reg *flex_regs;
>-	u32 flex_regs_len;
>+	const struct xe_oa_reg *regs;
>+	u32 regs_len;
>
> 	struct attribute_group sysfs_metric;
> 	struct attribute *attrs[2];
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index bf0af9474e7ee..fe873dc63fc5a 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1292,52 +1292,20 @@ struct drm_xe_oa_config {
> 	char uuid[36];
>
> 	/**
>-	 * @n_mux_regs:
>+	 * @n_regs:
> 	 *
>-	 * Number of mux regs in &mux_regs_ptr.
>+	 * Number of regs in @regs_ptr.
> 	 */
>-	__u32 n_mux_regs;
>+	__u32 n_regs;
>
> 	/**
>-	 * @n_boolean_regs:
>+	 * @regs_ptr:
> 	 *
>-	 * Number of boolean regs in &boolean_regs_ptr.
>+	 * Pointer to tuples of u32 values (register address, value) for OA
>+	 * config registers. Expected length of buffer is (2 * sizeof(u32) *
>+	 * @n_regs).
> 	 */
>-	__u32 n_boolean_regs;
>-
>-	/**
>-	 * @n_flex_regs:
>-	 *
>-	 * Number of flex regs in &flex_regs_ptr.
>-	 */
>-	__u32 n_flex_regs;
>-
>-	/**
>-	 * @mux_regs_ptr:
>-	 *
>-	 * Pointer to tuples of u32 values (register address, value) for mux
>-	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
>-	 * &n_mux_regs).
>-	 */
>-	__u64 mux_regs_ptr;
>-
>-	/**
>-	 * @boolean_regs_ptr:
>-	 *
>-	 * Pointer to tuples of u32 values (register address, value) for mux
>-	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
>-	 * &n_boolean_regs).
>-	 */
>-	__u64 boolean_regs_ptr;
>-
>-	/**
>-	 * @flex_regs_ptr:
>-	 *
>-	 * Pointer to tuples of u32 values (register address, value) for mux
>-	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
>-	 * &n_flex_regs).
>-	 */
>-	__u64 flex_regs_ptr;
>+	__u64 regs_ptr;
> };
>
> /*
>-- 
>2.41.0
>
