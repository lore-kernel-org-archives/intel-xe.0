Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6308ECDB47E
	for <intel-xe@archiver.kernel.org>; Sat, 14 Oct 2023 00:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060DB10E07A;
	Sat, 14 Oct 2023 00:58:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E8510E034
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Oct 2023 00:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697245108; x=1728781108;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kJfWU9kIx1plBBmHfLUqeqw+8zGOUgxdnNxteic9cCE=;
 b=Sq3OcPAY+3QDU2PlyXSD1+n1+OJ01gRJk9YsO0A3UEJWRwG4e55BZvqa
 NGFi6iXdWRI2NlHvIyFi77ThYvddoZgZLjK2bySMo8rBpCtLsKrZ+epre
 3auwdwRTzCFQirmLbPsk8oqKy1Qs+qxZgPxIgNcjPOkISiowcemRln1yE
 9S8gNV8t0izyDg993NI1TZYRHVSUD9sHJTaq7REARoYSxqi/fygxM1A4u
 fntqNrZ2ags3R28PRJ2jpyj8Z2Y3yF3e84ldv1SL/zUyIyyPUWkwBpztf
 nPWMZGO3L7ACSUHXlmf/MnC1JIzkBAeEo5HDF9OdRAcaqgHQkgpnwh01p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364656542"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="364656542"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 17:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748553550"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="748553550"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 17:58:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 17:58:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 17:58:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 17:58:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 17:58:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6MTaAxcliDBLCulS8dsoqO+gX5sWX8Q16xpBZKDePx3fW1E+J2HU0HlkrbFDijcZGIDwMe95AhCDP+d9yEcrr8HopuQ87z06n5a5rB2ysG7UjrjtYaBQLYoLHsGdlGGST1mDSf1KB4+9syMcnfWton2erOZCdKusmqFxJLrAostwnZ2AbCTrlqrVAfEsz2qnLFb6KMqK9WEwIhJB05fiNlVvNcy8zcS7j19jXbwfkXK1LgqdQ+dCifXv1OgtWAE8rtX5+iVhd58DV4OEE7b7QJpLDNM1BsOMHh+5vQUUxmTnZymsL3dAMln3Vp2gKZ6Mv+5us1q4Pty1d4zmc58Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BohIsss4/DNamCYO2PYjjj5F/4l7SoTcswT5nXdncyc=;
 b=SvovqDm9HnihE5YtL4XikgypEAfRCikJwNcvYdmooQ4CiW38TGv43w13DA64AavUuP0zoY3UhVgOTdXug/2Hc4AJlPVw2T30LOKfZfy8uKkYjl2vh7EamRe4AOznXyWU+Y/O/zUxiTU2jt4ctu513AWOhWEP2Hy9rKMXEiqkbMd+sdtDYyyTmpgHhwEOLqhR8ejjfPpRZUKk2MDitJGNpQQ/9vyHXc8tK22+BJSO1bCIi+c6H3JsyesmNVEOdFrpm8kMxJwetyzUUw4D36dcEutwK3XZkw3lGnOgEPiZt8Wt0nwO2seBZxrpiYxpuZ7VDhKjhI4EdYNAcjuCQerFuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 BN9PR11MB5417.namprd11.prod.outlook.com (2603:10b6:408:11e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Sat, 14 Oct 2023 00:58:20 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.046; Sat, 14 Oct 2023
 00:58:20 +0000
Date: Fri, 13 Oct 2023 17:58:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZSnnqnKntvJ7xEeL@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-11-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-11-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:334::6) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|BN9PR11MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: 4966efc0-02ac-4f78-aa5d-08dbcc50a89a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FL8kOSObwlTwaRpA/5T4D9Mx9hRe9BfLHFhNK7dpGBszdSAeSsqnKOBKr48NrOa++WH07NQASTeRUqkrMW2nDHBUTvociohuM6E95i/MbWequB7da/kcCjFP6dAPab99kmy5izesgC+qiZylETvgDql4d8m85wBibP5NV5ZrQg8GKuyeJkaai7lP67wLrL5PwfX/XBIr4u7uZUuVjlnV6buJi7VhKx76o7j9txprdWt7rTx1eWR3kNfuNSr+RJT2nkVRoyrkAM6YdT2xi8CTq8NFSLwS+RKhizdRSLCKVPIcg4xkgwdx94hHlev4v/dA/iZDhy4P87+s2vQFQiaS24LlTUf3DR1QQyRESrs+6oqWRoE6c4UZ+6nJGeIe0FBzHXU2q93DKSxfsrkEd2evKSDy5pJEkwXZ1xJEH0FmuYAmlPwvH0HAWWzWx+CrakAMMyMietGKk1EHpqnL/3Y709KNxhBJXm8VHFlLmJK27fbRWWzrneVDRdNJB/JIdSbBxjpkifFND6g/TRZMmB/+PmJtFe+437SRFLRxJUjTvl0ymxfmfWLPvckPo00tzFoA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(346002)(376002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(82960400001)(26005)(6506007)(66476007)(66946007)(316002)(6636002)(83380400001)(66556008)(38100700002)(86362001)(6512007)(9686003)(478600001)(33716001)(6486002)(2906002)(5660300002)(8676002)(4326008)(8936002)(6862004)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVJXREN6bytObE1nUlhzSkN4elNVdjdRZzRiNDhZODZ1MXQvTmpjc3lvQ3BY?=
 =?utf-8?B?M3JSUmlkTC92TXNzR3lNd2czWlhJZzgyVGhZanlXaG4vMW9BUWpMblBDb0ts?=
 =?utf-8?B?RGY0U1VvQVJzTEtBM3RPdmtwdktaMG5XRzdETkt5TzQ1bHNCcDdOYi85dSs4?=
 =?utf-8?B?Z0czcXMvYlBYaXJXeHJoc2c3Wkg5MTUwSWQvbFRQVVV1Zy9CTTBKbnQwbUtm?=
 =?utf-8?B?OEtuTnJQdmJQbkQ5bFpaYXF0UlJFeEdMOWJWS2x3akFEQjF6NXM2T2lNaUJ0?=
 =?utf-8?B?NjlWZElpU0p6RFBrSWIzVHRIdEljOElKRjd0TklWenZwSlk3alFCZlM0RmxO?=
 =?utf-8?B?d0lmcndEWU1rbzViYUhSbzNSQWxYbzdZVDVhaDZEM1RxWk9rOGtIU01rZDVK?=
 =?utf-8?B?bVNhSDIreGdMOUVVY09hRnQrUTZGbWJhMTl4a2d2VVBVOTJGcHg4dnkrY1JU?=
 =?utf-8?B?U2lCWXNja3NPcGNUcVdIZTJ3a2JFR25iTjRGV0FueVZvb2psdFBZT0krYk5B?=
 =?utf-8?B?bTgvQjVQNmFlVE9kbHJoaXR3aG1VbUFSRWw4bVFPOUNNM0o3Q1RPc2FhQnRu?=
 =?utf-8?B?aEkxbmNmYjJsdzE2UzA4cDd3YWlTSW1wdWFseUsrQzJPcndidm8vZ3hoeWN1?=
 =?utf-8?B?cmhQZUdkNEIxSmUyUlpFbytTbFl5dm04ZVhDdjdDemNjUjB0THRMUUVNTEVX?=
 =?utf-8?B?aFpzU3o5RUVXQm16VGFXNVgxOEtHalZWVU9UaVdRbXpCS3pmQ0NSckRSbzQv?=
 =?utf-8?B?UEVMb1c0OHRrUjZsTUJlRUxkdGhvRDRIS1QxNXBDdkpnUlpCWG5zU0Zvenoy?=
 =?utf-8?B?V1VORng2OVBWZjgydThNTk9tOFlKRmtkcldGTGkvd0Eyc2lSTTBIUnNWZXBr?=
 =?utf-8?B?L3dZRnlPMnExWldCdnNsL1EyaGthNitUbGFrcjVXZTNSdlI4aFJBN0pPWUYw?=
 =?utf-8?B?Rjc3bC9Tcm5MUHhhV2RxR0NwajhNNmkvL053bFBqUmVNaWpBbktlaWdudzRy?=
 =?utf-8?B?clhmdW9xYkhsYlZGUDlVY1JUSk10R2pQSXVXWFE4aGJOV3duN0kraDZpSGYx?=
 =?utf-8?B?UXFadUR6VVlzdUkzK3l3dHNIMFpscjEwUG5OU3NlSXdaMDVtd0FpRU56akc5?=
 =?utf-8?B?b0Y1cW5HUjhPejlLaE1DbmZueFdkWjFhblVqczFSWE15NjV3NzZFMUs4VTJ1?=
 =?utf-8?B?Q2w2VmQ1aCt2eHhPR0tpSHpadFZOSTFwdEp4VlhjYTdHczhtcVNyMHo0RXFk?=
 =?utf-8?B?Y2Zvdi9NSmIwM3R5WFkvQ2pBMkJLWDZpSFNrUW00c0lSMlVPSkRXcDRwcEM3?=
 =?utf-8?B?Z2EvTVFqM2FaMlB0Zng4Q3pDU0orcjNhVWYyU3BVQjMwNmdpRG5LVU53bENn?=
 =?utf-8?B?Tk9hVXNwc0haUzJxa2l6d2pTWDFaOUxTTkgzQmNTRDdDMUJNOVZBZHcwMWxJ?=
 =?utf-8?B?S3hHdlFZa090UVhDRTFMVVpCbGZVRVZraW9SUWp1VklsQlFqWVdDWjAvRkhW?=
 =?utf-8?B?SEZuN1NJNGVjdmVuUG1xNTNHUWtRVERsaGh6SU5YakEwMFBRVUF5R1k1c2R5?=
 =?utf-8?B?aFJjQk1xMzdkL3hSY1hWMDlTazFaOGN6QjZKVzJxcWJTUHFlZDY0YnNKcWVM?=
 =?utf-8?B?V1BadjJlZ3pIZXdtRVFvKzNWTUIxb3ZJQy9IQkpmU3gwWTE5SFc0WjduaU5s?=
 =?utf-8?B?TGJxMFRkR3dneTMxalRVcXcrV0o4dm8zR2xvdVpNUHJ4bk9Vckp5Z3Nxb1Ns?=
 =?utf-8?B?NTdieDN6YUlMQUlJbFpJd1FRSzFUbXpMa040blZQM282cTRJT2JIazVvU1RQ?=
 =?utf-8?B?c0N4TXdjc21BZHRYU2taSXFCZS9TZXBEWk90aGdmazBMOU5Na29Ed0sxbHpr?=
 =?utf-8?B?Rm1pVUNmbmRwdHN5dUFHNUV4TzFuaUVSQzU1cG0xT0dMUkN3SXJYa0YvVVZF?=
 =?utf-8?B?TWtFa1lkRmJydExnODZPNEwxL2lhMWEvNEJRNFZVRFkyTVI1WGxaczJOeGRt?=
 =?utf-8?B?bWRCeGJ2UFpDZHo0NUt4SW9wZWVaTEVnSUtiLzJFMFEvenR3bEs2bUcydE5i?=
 =?utf-8?B?TlFkR014RnZqTnp0TGNTdnk2Z21wV1dodXN0YVYycE1DcmtyN2tYNEwrNDlV?=
 =?utf-8?B?c04wbk9JdlBXTG9rTHZuamtublh0QTlYaDAybWJBZlVsblZ5U08rSWVXMStL?=
 =?utf-8?Q?cNXZ7AeKdwJJ4kl70xpS78g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4966efc0-02ac-4f78-aa5d-08dbcc50a89a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 00:58:20.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPSYKDyQr6qMF/q8GCZA1XmMtEzaLocG6dwXjKt3/g9gZ+6j5jnvKagbfZNNuAotK8M73U00QifdL3T6WF/L5kbqQkBwqz7gygnbTF8FQa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5417
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 10/21] drm/xe/oa: Implement queries
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

On Tue, Sep 19, 2023 at 09:10:38AM -0700, Ashutosh Dixit wrote:
>Implement queries to query OA unit ID's for HW engines, OA timestamp freq
>and OA ioctl version.
>
>v2: Convert oa_unit_id to u16 (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

I guess this will change in the next revision, so will review that.

Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c    | 11 +++++++++++
> drivers/gpu/drm/xe/xe_oa.h    |  3 +++
> drivers/gpu/drm/xe/xe_query.c |  6 +++++-
> 3 files changed, 19 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index d6d9dcc5c0bda..fc0159543dc74 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -2212,6 +2212,12 @@ static int xe_oa_init_engine_groups(struct xe_oa *oa)
> 	return 0;
> }
>
>+u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
>+{
>+	return hwe->oa_group && hwe->oa_group->num_engines ?
>+		hwe->oa_group->oa_unit_id : U16_MAX;
>+}
>+
> static void oa_format_add(struct xe_oa *oa, enum drm_xe_oa_format format)
> {
> 	__set_bit(format, oa->format_mask);
>@@ -2325,6 +2331,11 @@ static struct ctl_table oa_ctl_table[] = {
> 	{}
> };
>
>+int xe_oa_ioctl_version(struct xe_device *xe)
>+{
>+	return 1;
>+}
>+
> int xe_oa_sysctl_register(void)
> {
> 	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>index fd6caf652047a..1f3d05067f19d 100644
>--- a/drivers/gpu/drm/xe/xe_oa.h
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -22,4 +22,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
> 			   struct drm_file *file);
> int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
> 			      struct drm_file *file);
>+u32 xe_oa_timestamp_frequency(struct xe_device *xe);
>+u16 xe_oa_unit_id(struct xe_hw_engine *hwe);
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index a951205100fea..4a3a9c11e8cc4 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -78,7 +78,9 @@ static int query_engines(struct xe_device *xe,
> 				xe_to_user_engine_class[hwe->class];
> 			hw_engine_info[i].engine_instance =
> 				hwe->logical_instance;
>-			hw_engine_info[i++].gt_id = gt->info.id;
>+			hw_engine_info[i].gt_id = gt->info.id;
>+			hw_engine_info[i].oa_unit_id = xe_oa_unit_id(hwe);
>+			i++;
> 		}
>
> 	if (copy_to_user(query_ptr, hw_engine_info, size)) {
>@@ -200,6 +202,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> 		hweight_long(xe->info.mem_region_mask);
> 	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
> 		xe_exec_queue_device_get_max_priority(xe);
>+	config->info[XE_QUERY_OA_IOCTL_VERSION] = xe_oa_ioctl_version(xe);
>
> 	if (copy_to_user(query_ptr, config, size)) {
> 		kfree(config);
>@@ -241,6 +244,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
> 			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
> 		gts->gts[id].instance = id;
> 		gts->gts[id].clock_freq = gt->info.clock_freq;
>+		gts->gts[id].oa_timestamp_freq = xe_oa_timestamp_frequency(xe);
> 		if (!IS_DGFX(xe))
> 			gts->gts[id].native_mem_regions = 0x1;
> 		else
>-- 
>2.41.0
>
