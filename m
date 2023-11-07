Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87502C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 15:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AA310E611;
	Tue,  7 Nov 2023 15:49:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3FC10E611
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699372161; x=1730908161;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=U1uEmneQHyXsb2CkOutnZ9c+jy/92VWOuNoV/J6kIeU=;
 b=dCHa9fPGlLChch0H9q43ZJr8/LOkuz2uAIC/ecKcQCdQkm1SFy3ZSEXe
 NqmITKEj6eqHr1ks88+hnlgpQcTAX8HyKqRbp34By54/BCm2mZMRSEcIn
 e7SaRUJW2irlMZOgIcWKi1tVgFRvhqPq1KfC97fJmlNHy9cqG9MdPAjN8
 /zG6UA9PFSugr3UhY6aI+VdpUCwm5/MVoq8rEzsxNvIE69KwG5bPLUfTZ
 P2+ah/hDhYuAWtJr/WGdwhyYmj+pj/5/ESScgj5K68qipSLFw88Z7P/Ve
 JFAcUB2C+mf1pO7bA1oa1x+3x0NxxCjCSaMAMh4qz7LJbAu9BE6HV+qga g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="392409019"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="392409019"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 07:49:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="797702387"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="797702387"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 07:49:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 07:49:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 07:49:20 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 07:49:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTvcc8bUg4r6QYA4GAiBC206pRNSd66hCDB0zb51k5YTdeMH/eSx9PhC7pBi6UrJubDwvUURYfSDjzpR029MGaqfQRo1tJNFne2ejiY2ZOB6iEZTMRxH2lU3KYFQAnGq50Zi1w3Q46hTy7sjcdjATE5u3sKFMwRpihJMFCAcxMn4GPWDQDg4SJItkbFMXseAwNvgTykUjqBrhKyS67A9TsnRZdTJr/EHKcO+Y+MsITm4J7yJQr21qukf67GcKSD521rOLN51JfYyO7zTfsxRtv2IVZDRRUgSQfPBVHKW3wrinDRBR7RXfb9I9ZIM+Jh1+vuCUlTcaEqwa/BgItS0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvw3k3eBq7/w9CQtJn7j7AqsNedxMyXWoYX7upfOXzo=;
 b=CiObplSaEjMovKnvhI9RdQUkjYAkLifC/XsUXgDpAub/dUBwnhjpROgAF/CgJ4c3UXj4MlNnQimD0eEAnU/AKPGjzsTfjEIQej1zNQjlm5HG4j3T23z8udKrLtNNq4OyhSj0LSq6Dt6z2ioLiQUR4+i8RbRVUScoO9VHA6K26YZ9xVSOrcvLxGTMcnO/eJiFY6g3ExVF4Q+XgDC/lsnSkqB9IopE6h1A4p+4NAjKnRNaWOJ0jG/5BdnmsncNyGr42C6K6TUgD+ThNqIk0enCBNv1idsxWAcHZ47MxT7Z1ximPomuYGeLBKoDgyl1MDempwaEWDGwDy8tZ6Ro4DsZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by BN9PR11MB5353.namprd11.prod.outlook.com (2603:10b6:408:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 15:49:18 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 15:49:18 +0000
Date: Tue, 7 Nov 2023 16:49:12 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZUpceL-am9A9PgZN@fdugast-desk.home>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-8-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231103143456.7-8-francois.dugast@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|BN9PR11MB5353:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a45ac1b-a160-4647-35d9-08dbdfa919d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtsJ4AILcdAhDc1LjhbCXUQalWF+rurz7R+QZAwetQ/gJIfjJw9/NtodJdTMI+a5Jo+WkgHKaLoQW6fDETg1E+vEtxAWbnS9rkf2sYowX3B4rCuizzWgIX0TIl7gU9dnRNFFjuSkl+0pnGNk0rqVyjxXPViBjb0TjQ2yHCxoHGO87gGS0JAJlPmuuY3JgQNKJyONIog0qImd7wG5qa8xPc4sggV34zWiRNbnKR8zPD4+c6dJ8gA5GHfe4axxvoE5Bd7jTllgdKiMsJG92Y7aB0tDZyIKW7IK//uOhbnPF4rkUbwfhb15b6ask66TFOv59+GjUNAVyG70I953jw0hTv9+nI/xmNpMj94HAV7WZYOVASc42GBkjJIGDZs/PtoKN91GQH55aZHdRF/DCZGca9bOrL+w0Rjkb9jZDLF19kwZz4hIL1Gvd9/TA4PSUV//lTr840t8VvweELxiPhUpUmiTzs/acVQab9yzBF/esQ0q5Hxqs3trqbTWOPf9D46e61tDuo6behijoAafMlFY1NjKPMKDf7Gkz28SVUXELiAUapBj2vBNQdArTSpIN97C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(396003)(376002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6486002)(36916002)(6666004)(9686003)(6512007)(478600001)(6506007)(83380400001)(26005)(66556008)(5660300002)(41300700001)(2906002)(66476007)(6916009)(316002)(66946007)(8936002)(8676002)(44832011)(36756003)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h7XKk6u7GZAI5XYDIIZbUKCUgZB/q1B/BytJU2ftn/GkcTneLo4uY+I+lM9w?=
 =?us-ascii?Q?CSrNRA7b5mI01R9HsZlh/xqweE5C1sPEQ9MiH/Ms5NoSABVmWCrkmjkVchGI?=
 =?us-ascii?Q?2Aepv2RYvNVO65QJwjddLYxtRosDGYXxy8exacHltv59bSBILYFE2XpErbMS?=
 =?us-ascii?Q?NcpBrms/eNVbYbVu7WYrPX4pn54Bolv7YIxl3zsZ2nliWF5JpHL6pzcO5MGo?=
 =?us-ascii?Q?VoFAUXXdl9ybr5NuVbkHZH0teMIcPd3zh8AEIrDGSxK5Nn+HhkSFpoh/eRdA?=
 =?us-ascii?Q?zvcSG4w5r3LahOgDqdxiFcNR+LAbkPloKw49kI1s0EE18sqf2FmyVxE7IfhJ?=
 =?us-ascii?Q?tDBOG7vsXtyRopkV9e9bq3FO+A2AbqC70ueIbkdsW37VGrMwHxgcBiOGcBCL?=
 =?us-ascii?Q?7QE5zppxZR54Zug0SddRXQ8U4A45KNqSPnWd2gVFSMTVAVxuAci5U2Tvk/L1?=
 =?us-ascii?Q?lFU10dwBHbtBx6pwCiEXAvmhxmXGqS32LOdjNrqkx9Idij49vLAhrFZLpM0h?=
 =?us-ascii?Q?hrsJiWn1qo8VTupugQSGZn/g6I7GN5X3TeMgymymsP8aFcv0cALaxtj3Y9Ea?=
 =?us-ascii?Q?9dz4jIPwTu83GIsp2f7HNRsZo1CWYJnCIMWLynN4ouNMZ3ENLLMxsWb2FO7b?=
 =?us-ascii?Q?qFUxdb4tIbKpeI3QYk9ALH217enSEQd0clR3+EKYkzSIXLZMowirbU9GQDRX?=
 =?us-ascii?Q?c6AGHlGKnrq8Wnif5QsLddOdM9fSfFl0gKQJpyL3thaUA8k78af619egvB7D?=
 =?us-ascii?Q?uzdY43K5h1CqOm2PIiJuh2fne6eHKbTAorn9ZGpsE8ei8hR3PSbwZ1H9/Yml?=
 =?us-ascii?Q?ZFeiJXv3RAVOMvNZBPjLsEVMwFObSr4leYSbRkSji3qlBrx6Aja8GYg0VMIn?=
 =?us-ascii?Q?UJDwgkokgG7FU3u4GvQ+7nHvNRFp7M1X+2yCY9TTqAPyLINYdDNCq6H9TtVc?=
 =?us-ascii?Q?GvxS+R+t92bIh/ukWb3Az0rifZXlG8iwPCzjiy6uzIMoWlHL6z/8xohcPKuP?=
 =?us-ascii?Q?xs40r15NXWWN1FYbUlWsS8vh6NR297ByJBGpkzIlKFJgnlSvGEMByxpcpleK?=
 =?us-ascii?Q?MhCoHSgb/te1MfC8pTeaCoZ/SN2e+gY7U+6Lo5Ap9nd9hyCxqQid6Kn3L+eI?=
 =?us-ascii?Q?IT326I6jAFRPQB558c5dLWP+1Up3B6m8ft/TLkqKjfTcrI8faSHEFTdZwDQZ?=
 =?us-ascii?Q?jia7OY37Bs5gmE+VxfuyRxXiEx6IV0YbB8Dpzms7kyC2WJyzpttIWiMN7s9X?=
 =?us-ascii?Q?Bo5pzCLAgD9JR/WUVG5/MFYhiToH6Bw93bZuXb+bEN/veS+JbmQ3dKqb66jY?=
 =?us-ascii?Q?k3ZX5Ly6Egcvg5jsi+LrlnTFp4nz3DWJNHQ/E9lnbMtOptSFU4gIHJkufAoz?=
 =?us-ascii?Q?FB8EJjY3xIz3bPjIMOnGR6nFhIBA7a9ltDDt9lnG4y2eZjOPRL22kLzCtMjU?=
 =?us-ascii?Q?d2kSIQpijPFtG+wy5QuMTA4CX5crbm6+2jMLkJ6jaSjzGOiddIKqzBxh+uX0?=
 =?us-ascii?Q?dSU++ejKuGmMilO4mxAbPcW/bz2Rj6rEKvtGe/Wa8mEb3v6MMTvks1iyVfPo?=
 =?us-ascii?Q?lGGjpjrZVUQwX/Nm6B1H8z7FnXZgccGP4hH5W84vt0Uglqz52LrM6MesFmgl?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a45ac1b-a160-4647-35d9-08dbdfa919d9
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 15:49:18.0545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WslM/BDpnIUx73H3cdP0eD+24+ST9S4JoPULoxNZPTAIC8Lb12Bsw1K+SAbMawDx2yJoYaYJWPNnpZwhcdox2SMhD4dLgX887ThVejhmw9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5353
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/50] drm/xe: Remove useless query config
 num_params
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

This will be updated to remove XE_QUERY_CONFIG_NUM_PARAM from the
uAPI but to keep num_params in order to make it easier for UMDs
to verify info[] index is in range when using an older kernel.

Francois

On Fri, Nov 03, 2023 at 02:34:13PM +0000, Francois Dugast wrote:
> num_params is only used to represent the number of query types.
> Removing it as it is useless and should not be used.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 6 +++---
>  include/uapi/drm/xe_drm.h     | 7 -------
>  2 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index a7f34669bb9a..0dc72668f560 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -305,9 +305,10 @@ static int query_memory_usage(struct xe_device *xe,
>  
>  static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  {
> -	u32 num_params = XE_QUERY_CONFIG_NUM_PARAM;
> +#define XE_QUERY_CONFIG_NUM_PARAM	(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
>  	size_t size =
> -		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
> +		sizeof(struct drm_xe_query_config)
> +		+ XE_QUERY_CONFIG_NUM_PARAM * sizeof(u64);
>  	struct drm_xe_query_config __user *query_ptr =
>  		u64_to_user_ptr(query->data);
>  	struct drm_xe_query_config *config;
> @@ -323,7 +324,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	if (!config)
>  		return -ENOMEM;
>  
> -	config->num_params = num_params;
>  	config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
>  		xe->info.devid | (xe->info.revid << 16);
>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 67f96d44d509..0c106043827c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -315,9 +315,6 @@ struct drm_xe_query_mem_usage {
>   * struct drm_xe_query_config in .data.
>   */
>  struct drm_xe_query_config {
> -	/** @num_params: number of parameters returned in info */
> -	__u32 num_params;
> -
>  	/** @pad: MBZ */
>  	__u32 pad;
>  
> @@ -355,10 +352,6 @@ struct drm_xe_query_config {
>  	 * Value of the highest available exec queue priority
>  	 */
>  #define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
> -	/*
> -	 * Number of elements in the info array
> -	 */
> -#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
>  	/** @info: array of elements containing the config info */
>  	__u64 info[];
>  };
> -- 
> 2.34.1
> 
