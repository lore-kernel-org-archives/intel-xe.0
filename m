Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276ECC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 20:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB91310EA6E;
	Thu,  3 Apr 2025 20:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRXH+6W4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477BE10EA6E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 20:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743713884; x=1775249884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cAWWXPMpU6T2Vhy1Wopr8sxkUZhy6yax24ZSqKnQxM8=;
 b=DRXH+6W497jTHz315uu2Qt5xkPP1zWHKsPp6q35IIK0KfVr9W0dS4CbT
 SXgYecN+xSeLAgwjH9oOdyGrlPM0D8MNNz0li/XRoA7Xof9QdTRFrppqB
 I9x6wDilOvD8bGaaubbihXbLNBBmq+jmfPdaKylR1dySQwJd2Kd0nQvh5
 6x9HfN9T51yrTxtxNvU588UuGbPQxxOq/0RFWiXiXHRnM33OiX80bMSBg
 SEznxBHDbfU/S8jQsSxERvI3reww+sS8WbTpFblwmhCOV3+w7LvxdGswU
 Nhl7cv+L5F2z+0ecxKgGAxMwu9adSMzhaS1zEmkFqn5jYvWX++Rmr3tYb w==;
X-CSE-ConnectionGUID: qt/HKfmNT6GLU/X1wc+asw==
X-CSE-MsgGUID: 2t1PU4TMQgGSnQMGH91cqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45323071"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="45323071"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:58:03 -0700
X-CSE-ConnectionGUID: QDL30dUiTTG1FN8fK7SbKw==
X-CSE-MsgGUID: D5nlgT9oTVqfIYeDtjGVYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="128052939"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 13:58:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 13:58:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 13:58:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 13:58:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWXrSxUR9U0PxYOAFGKcu21Nt2HykqxwG8EHt5lZfcHtjBGWsQhs8mcl6f2fwL8MIjpxgtg6DODAPvkT4Lu4hw2AKGVY75swFvSyZ9cvFjmVhejAqjDNtsN8WkaO7f/vk66vALaTJUkpqZkI4ajX3luZHIQV7h1sScS6QDlqnwtA79ljywOHp9PQT3ljA4EmB+ZDNmlENVg4BUWn15O0mzNHb7VJ15v8zsb4PP13N5ZYJIePncv1xwVplJuxeFPNtX9rBRPsDrSHO8xBML5WNSc+OL5T8r+KFfQl6TDKTVaPSaZM0X4EElIHrnNARJ2zvTzAl1mVj+l+UqlGL6JChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3t2INWJxavkDg0ibHl7gUvoEH65Qi8YQDEsass7yS2k=;
 b=FVW0uOeNyvKjQOhOXhOxq1Xkw4MFyLMefYCr+O/zLxnYkJgWdE7X7/UezA1UgEgQVOctExrIbN5hOYXQMQmMiZ36syX3Et5stok1Ee0g5IV7vVtmCSRpvCrbXA31EnJ07xfyQNlkd2YUn3gSiQPGlr/6zkWEWw6PYqeV/uuZ/9Xay03/em3k0xJpbO2JnlkGtMP2m8Gqab9J175opvoC9qxpxJzf/3Vk80teJ/sVEWHWxd36nj+P5HudIlSfvSzCgLpAfbaN5WycpmzFwqct2pHXe4fD3VzdWl6xHj4j9OI4kjmB3PHClcd7M8HSANqcr6NF7dShFl5444q5eWvI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6833.namprd11.prod.outlook.com (2603:10b6:510:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Thu, 3 Apr
 2025 20:57:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 20:57:55 +0000
Date: Thu, 3 Apr 2025 13:59:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 01/29] drm/xe: Introduce xe_vma_op_prefetch_range struct
 for prefetch of ranges
Message-ID: <Z+72nrampBsYUWWm@lstrano-desk.jf.intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0221.namprd04.prod.outlook.com
 (2603:10b6:303:87::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 101a4b2e-cea2-44ba-e23a-08dd72f234c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iGaOUTCPYg+rwtHfDZzFlCPVHl6AOga2/0F6UPc7HD/LIGWocj0R9CVfkY2a?=
 =?us-ascii?Q?5A7ttyDA4P2kHSv9PWx7nP4B2ZSR61yJhEgoDSRaSffRVAjXLcB28djr5zQo?=
 =?us-ascii?Q?VSfWiD3Z19vnagPKKC4rMJH3NTJShjTT991xcZ1RMU/zPPSA1web4lWh1QVM?=
 =?us-ascii?Q?A4v7Pu5JRAkGCDyrem4Gyqt21v7+ZgW9Oxz2oZmV14I3z/kXsBp8eKEQIz6T?=
 =?us-ascii?Q?zPeZ54qoLlAtQc29vS5J2M9aoHe/rSfwnlkLFa5xw5Ky3xM3UIbQdh7TYMeF?=
 =?us-ascii?Q?eIQvr4OxtcihoVPgjE27RRR60/qAMaLoelmCjQ0cnhNMex3RkmwUCIIECGFS?=
 =?us-ascii?Q?u6hMdXIMKjAMERouukl3G2/Q71/3cj3zqourSh0HmsGyjQGLBvTJVA68ldHd?=
 =?us-ascii?Q?Ll/FLBcFx++P3VTrq8AKaXObclcKIbN8VJQmaOlZlErSbUkC2DwNyud0UHAn?=
 =?us-ascii?Q?HoX5puX9ty90P63HlWKkMUh2bi4QqbAfmbV/JmPzlSkc65+UHTHTSsiDSB2n?=
 =?us-ascii?Q?fj0bBsyYAxbwXOK6Vg2+9iBHNVRjfw3BDVIJmL6FquAYgS6srguncEZr+a7k?=
 =?us-ascii?Q?CdZRWxRMABnNQJ/DmRr0St0VktGPewXJ2pwDezlHxsYPBLwRw7nOrrET4gKt?=
 =?us-ascii?Q?3hceVd7TkgIUYwcaAV/nILLxnu8rrUoddIOO81phW9si3IDPfkVyZ0r+j0ls?=
 =?us-ascii?Q?cGU4VUG4Xb0uj4Tho2O6TypGTNU4h/5T36HSqyippqn4BO/kv/Q9zOFql+GX?=
 =?us-ascii?Q?ZW1sELmcy92HAISVKtq/OaKegGGqiyXddfj/YDFDIUN8130yz5uw7wLl+dSP?=
 =?us-ascii?Q?oJJvDsEw9fSfx6Yh2if/LfFXXQ+ytcCeO/4H7xeNqXigXBodFZdExEmmMJXt?=
 =?us-ascii?Q?vafix2/JMiHcR1GuFekDteBJz/vSSHhYFUt+gYI4d8TofFPhQeYIzReBT6as?=
 =?us-ascii?Q?wwGx7bsyy8PZmTjk78isGGwvsxNVXLaKUladByHOQwj143PaHQNDGhQEtIxj?=
 =?us-ascii?Q?5zePXyCup+85X2eM8Z7l/4DHxD5qrO4IpwtsiTinAqqwFdvJVDIxbEE2DIgj?=
 =?us-ascii?Q?YNSJwLSmemn/qCM6k8aBLsplp23Pl9bJrSYGGlXQpTje6sO9gpvx4y/mrz2G?=
 =?us-ascii?Q?76qjYQZWcIpf7dENVqIm3LWWKoD/KwxmsgFl6HDsbeyPTHEASaeq5410oyIl?=
 =?us-ascii?Q?lKBjLsNhzBACRE6WenxePhVc43Kkbzz9qbVJlqI56iMK0Ur2KnEGkfrF3HLO?=
 =?us-ascii?Q?srZ1exgG5d6NHQvk1amNPDyWT49iLdYeP9HNocOJmEBD7xPqGdcL6fjSxPUB?=
 =?us-ascii?Q?aL5kpjIVZgpCxa1EQG8Tr2JB3DiOBDQCnzFkfn8GO4xHzPMJb4Me81kfGiEi?=
 =?us-ascii?Q?gmvetbNZtcQ5zO3idOOu1Njt4j5Nf+N/4s3eaE2oQom3P2hqCEz2pA6KF225?=
 =?us-ascii?Q?mWi9P4vrk9o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TkjmYJAczIGvcZHqnVRfujvf1U0pki+AkAeZ9v/WzDO5lp5G5/hRmLgNJUVk?=
 =?us-ascii?Q?FlArXUsHMrvZjuW/BKwP5nLppVYEbmxESd1lIVviRixmW11C0fMc6VYgpwFB?=
 =?us-ascii?Q?HS6vqFOgjPadzmGMU8uGprn0Le6bMGZxe+UYJo53PuOlaQ+X4E/SB+3wpuX8?=
 =?us-ascii?Q?FsV8Xo3TwtVsdqjPeJuwAdxhznmhg4ixj+O2Tq3ro143pvjFou74DEcB1NdP?=
 =?us-ascii?Q?61uSUQse6ZFn9DnTdXg3VXBavMR0aoNTZEsmW+uMBPzSj1+qR+wlkuR79nDh?=
 =?us-ascii?Q?z18CisRZHaf3Z6vhD4XuFLTiSHFmSO+i9vPAXNJB5iwaBU6j8Wfa5QSuocP0?=
 =?us-ascii?Q?cAkkKfwC0bSr16vuWkBmMWI6HH+uxx1JGbpbo0oBJGCFXA1ooG54MbOzdh68?=
 =?us-ascii?Q?S85z3D/ZSblP0PvV8p5rKqWi3NF5wz5F0PqNLDRZ5N54uDNWSvpZj5KpOKcz?=
 =?us-ascii?Q?gZDa2ZMzrIoWcOW4I2Dk8WAWPyLSv+EMkvfGlJ9FWkS3GvJxSwoXKa8Yi0AA?=
 =?us-ascii?Q?NXfctf836sSsiki2WnKdptGkeU5GcigNWb3Pc5nCehzNgUO2niov3Jm58elt?=
 =?us-ascii?Q?LXt4ruoBLmKWqZ5cMd3d5gL0LJsvGxq2Z9fnP1D6h5HmF9ZANOSwmbdH1425?=
 =?us-ascii?Q?lBFKZCjsf+wIw16OyPTAlk2OY53b0WDmX4/HfAi41hP3gIN6HDIEFcsLhoor?=
 =?us-ascii?Q?e+N1b8tphpzfoSEh207OmQzZ5PpVQVs2a2nPqXZhmEDXvfjfJ8RHi1bYYg1w?=
 =?us-ascii?Q?qe8rdmNtjliUz6AY5AlfOZ4nXBFdei4nPwJCFKQ5KdR0Mju6AcBuqLQYYKkX?=
 =?us-ascii?Q?Nms/67TmqDGV4Sn68GEyX0eubtkVNdrqFHsRpGQWztvMOaUlhl8sD1sRP1YE?=
 =?us-ascii?Q?mcwNhG4EvnoW4jUhLLEUYeE203lTSQfxwKPGglugyIMc9qBsImz9SyAQZr76?=
 =?us-ascii?Q?Ojc7p80L5pWkAnMak0wGIGhvhW4ZgI3CWJ646x/iRCyqVnoGCL9048izbxnw?=
 =?us-ascii?Q?Ekksf7Gmg+wLR4oqBAKuVUSqjldnqnYT0AbokGorWR97Nf+VthrDmci/2fPo?=
 =?us-ascii?Q?hVQUT0WMlHawNphpdRRJteNnu79b7w5uekTDOBR1ZkhL4KTkCB4lpQfruOYY?=
 =?us-ascii?Q?W+8pSt76qdnZFCYcUblCop2AFLGnN8sVlEAEV1zbFP9fSG4AkVfAqX6jp3o1?=
 =?us-ascii?Q?CdI6BNPSPQVAxiFvYnofZO4PHYGTpIejklc505q/yNX4ylPdyeobnuKHAk6c?=
 =?us-ascii?Q?Hm64/R6iQlyEGxEN8M++eGGIFpkKDuh7fbu11AuyERuTQXMaePfAmzpIrL7B?=
 =?us-ascii?Q?x+BhZ5uJiFh9p506JFZ+3ve6KzHgzKEtjpVrsBlUGkF5ThcSh5DhZ6V8sfRd?=
 =?us-ascii?Q?0WPhHOljHUlpHcnVKFJnREdUMIaKeU+W5Qcc7v/gbv/Y6q8NWPSO3OBiGFL4?=
 =?us-ascii?Q?SpP6u4CP037PTmZP9L1qiDC5YkMf6QOqNOxoSsrRGegEPBCoDEtH4FJQUX0r?=
 =?us-ascii?Q?WAR7vZhNw3sFeBaBqwiDcDQQdOiXTMjgzwm2InqHZ1Xh1XoAk5xBiwLcAHPX?=
 =?us-ascii?Q?k61BHK1WShb1cjDRCJOxteOsI+o+pEce0fwtVv5NcuNks69LIRMJQwVKNUbP?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 101a4b2e-cea2-44ba-e23a-08dd72f234c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 20:57:55.1378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRx+Em5vr4806K9dvkzj/RhuazxWLZDUhJ2RAovAxtBvtn3hPq7QU+kmI4Lo0go1BIH/1qqux6HtPyWdFEMJPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6833
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

On Fri, Mar 14, 2025 at 01:31:58PM +0530, Himal Prasad Ghimiray wrote:
> Add xe_vma_op_prefetch_range struct for svm ranges prefetching, including
> an xarray of SVM range pointers, range count, and target memory region.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 84fa41b9fa20..93224a87ab03 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -372,6 +372,16 @@ struct xe_vma_op_unmap_range {
>  	struct xe_svm_range *range;
>  };
>  
> +/** struct xe_vma_op_prefetch_range - VMA prefetch range operation */
> +struct xe_vma_op_prefetch_range {
> +	/** @range: xarray for SVM ranges data */
> +	struct xarray range;
> +	/** @ranges_count: number of svm ranges to map */
> +	u32 ranges_count;
> +	/** @region: memory region to prefetch to */
> +	u32 region;
> +};
> +
>  /** enum xe_vma_op_flags - flags for VMA operation */
>  enum xe_vma_op_flags {
>  	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> @@ -414,6 +424,8 @@ struct xe_vma_op {
>  		struct xe_vma_op_map_range map_range;
>  		/** @unmap_range: VMA unmap range operation specific data */
>  		struct xe_vma_op_unmap_range unmap_range;
> +		/** @prefetch: VMA prefetch range operation specific data */
> +		struct xe_vma_op_prefetch_range prefetch_range;
>  	};
>  };
>  
> -- 
> 2.34.1
> 
