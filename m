Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E9DEA7941
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 19:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2D310E744;
	Wed,  4 Feb 2026 19:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="beajU5UV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577DC10E744
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770231690; x=1801767690;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ROiIWWFQT1v1tGjopXdOlC89iuCz8OWh6ZzyRgRf1tw=;
 b=beajU5UVtrzHwlJIDF5iqkgbvehtd4y2fsbXlho+Mqb+AdysPppvCA8V
 c7g1U+Aqn3iEONpZfaWdCQTaETF4EfsUhnvVspJnZwfnm59sXYZHgL3CH
 Xy1In90sc0ZVgn77kCKyaQVKkTG4ZfInPzxb4eMhI0O8nDQCFkZcIgzQr
 +ulQzxNKgJAsuTrrK38Fk6PwrGLZCpv1NZ71ymbkFyH+m3+08P2y7plnp
 MPIAni3i9gi0cxZCZoGsJ9/37iVunH/29/QuzsmPROvW2zMQ32r8olL8f
 rVMXdTcfbvlh7Rql+MAo6tawq+8q64zx1dNraGt5jrFf4YPQxj5lZYFoT Q==;
X-CSE-ConnectionGUID: joOlj6S5RJ+WMkbYP3df4g==
X-CSE-MsgGUID: lzJ99YShRumE2c5BzL6ZRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71521175"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71521175"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:01:29 -0800
X-CSE-ConnectionGUID: 8RwPEy7zTFWpRjHTl50Z/Q==
X-CSE-MsgGUID: mXurizdLQy6zWD/DyK2ilA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="209803416"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:01:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:01:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 11:01:28 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:01:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLyMyH22Z/unc5F9PMWAW2onCGmYVbVemxPD2E0Zzz20Xees+x/9FhQOCfc5HSiytoJo+IjfZUj2B2heU4DxSp+FpksnrrFmZkifGcXRGaTZI1prsl3dqvtsA1znhrLDVy21qRmqHgkAyNvfdc7Ktau+NHruz/XprM8JGx6Cmoubu7KFT/ESljT+FNiHFHstFOO+mCXmgcmF8aVwdOdZO6KWi86OzOtkATAE+bs8RFC5zfK4qP+pWIKCwAseJuyHewsWfebw+zkClxlUZEZ4rU0fhg+4v2QK5pvUVFETK21DXw/XHPTg4xYZg6sYk814/iwUUBa7BQJ9zmjKFqxEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DNy6cfA5QWsQCE7l5flM8dwoOJpzYQXZuWD0/l3jII=;
 b=HRSEmWLXO6iQWYKDrECXnkW03TdlD8+Y9O2QwPLAj6CQS3GuCkUbCEjUJM9Mb5V90ZeyKTsE7YnjtNd/4ovwYOe5rQfarNuAeD23m3dFbugAEpkxh20wgnj1uCJzABizLWJi6u5pyv/xyW1ECQ2zIBqim5m14quXSG0XG9M4k4NEW4jG2S5Ci4MtyFfuaw9X1libHYmGQWav8QmChGF7r1u3LRjvpOOfJJQ3B/a/0djAtw16TE0Ggdwmyt12/fNTxhI8AJZauFqQY4id4hIlvu1t3u46jG5KzzmtBGmmQex0J6qq8ZdU3v01Po1E4eVfb0lsBlsJIAGYbFPUJ2FNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Wed, 4 Feb
 2026 19:01:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 19:01:24 +0000
Date: Wed, 4 Feb 2026 11:01:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v2] drm/xe/reg_sr: Fix leak on xa_store failure
Message-ID: <20260204190120.GZ458797@mdroper-desk1.amr.corp.intel.com>
References: <20260204172810.1486719-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260204172810.1486719-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 39badd59-95df-46ea-5f29-08de641fca05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rp8f02ojIXr2bIrnxgqMYPVs/nExWg65OKcEKRTShcL92qDtbxQ7v5WBQ4yv?=
 =?us-ascii?Q?0QqipQVGE8pI35AkDuhPgD8mzY6ixAXFcL5ZIyfUrsa+HkvV32JoLKnSBqCc?=
 =?us-ascii?Q?ISqVxvzCz4kQ6uvxMd88VepgaS+rxzflf1BhPnEiwEOhMr9Xlab1m9/5XEPB?=
 =?us-ascii?Q?TZAP75nP2L9p3kwBQkuTnjd1nnei4fzXDxrgWq9EFBXjV6h8z/XwnTI04TXj?=
 =?us-ascii?Q?ub89khdPQRqTumC5LAh9SRoYoGy6blOP9tXuaSUZ7uWlW3xB3tz6Z2JFKoJZ?=
 =?us-ascii?Q?3aCyFaPqUbH3L8PXxECRwa6vfH+2I1gEwzp6an9ToXaQAOx+g7OW2w7hUs7Z?=
 =?us-ascii?Q?iLuQchbINpVx1saTBQpbtlI/vsBaeW4JqwE1Vs8jLtqVZncVFgBmFuGsDdgb?=
 =?us-ascii?Q?PjKBevFxIRRKDjCd811VOxgK8Dh6+oCKIGO3r7BfJQXC28a5IgzXp/v/Blvi?=
 =?us-ascii?Q?HneJyVDxhiZ+7OS+JsAiIZ+ptUPMIIuthGpfGHDOuOvrlkgSMklNo/AM2Jo/?=
 =?us-ascii?Q?Rj4sKSACttJLLhsYs2wfDv6WICwURB4STQbDV6oI/i4rbY26ubjzSTl7OTrE?=
 =?us-ascii?Q?2r5R2KimlBhZ1u6CBf/2Q55J53D6pgLg2RIpoAKa9V0K17LAtCzOvxZWGPPv?=
 =?us-ascii?Q?rvE0E+7bl2mprPRMRrxJezinwIJxpemE3lvu1D3fQ3AMh9kYxTQ4mOz7wvwN?=
 =?us-ascii?Q?yc7/YBTm5Pg/H/q6RIgOfm/RALO7DowfbhJtiQqHw8zyNtlNn8jk1qYQ1adL?=
 =?us-ascii?Q?l3vWY8TlFwd+68FdxzodbAwTwKLRloon86gx60uHtWFeIyKk1zOweMRurgMB?=
 =?us-ascii?Q?J8JSYdPFMhtErIuNClnYvgyLhx3L5PYh1QVJlgPWHNNg4hZxACG8kLQUOnYo?=
 =?us-ascii?Q?tHWcqc9gV7A4oyQ1iu9PL6PuGHCpTXKxqawQ4FCFbBBzYsN8E/YOE9aKUQWG?=
 =?us-ascii?Q?elPjUmIz61YevmXIdIqEqpnGsFkdEG5fWTCKfxBuqJygIa50Rdu17+NsYngS?=
 =?us-ascii?Q?ah0oxfKo8lhdhgIIQoHvZSn7BkDCGJyNJYMt46R/Hfjg1N7z+Fhx9fEVCUlC?=
 =?us-ascii?Q?zDqymNpSEWfJqZPEdaUM63hssweYNDTLEeo+y3fv/eS4ORjHUmqqfuj24pNF?=
 =?us-ascii?Q?5i3EP9ya+qMBFkx0jTyv0/S517hJroKdI/34If8xUTQkGvvuoel87lH+OsmL?=
 =?us-ascii?Q?MUjVg40gANqS3d4ZOwx7Vo/6mRzWfWkAaW8vaFoxFfmXTX1S0peH//e1Sd0d?=
 =?us-ascii?Q?9y17zr2sa/1D3lXONOdoK0Hxnme86VS09vbmEzVT9mLw4IHjnogGZS7DYKiW?=
 =?us-ascii?Q?/czplSI8iDbmJpS/a4C3MFWoP7z0yL+kmrR56cftYXvsbeUH5zROrXJlUX4U?=
 =?us-ascii?Q?yT5avwVcnFF+SeOVTzpYit6v20vIWwe2W7bmXAd1rYVkraK30i8MPPOsvXbQ?=
 =?us-ascii?Q?4oaCLw49XWrVAXU81CUyL6q94UXmLrRT7DXcRnVbQnGRpPWgSehmHfFski8e?=
 =?us-ascii?Q?aKxVjlN11AVAvHL5hP4jHTHmgsZ042l+O/D49NVp/L5DuQdwvieLSPyY8m1F?=
 =?us-ascii?Q?XJ/zHbqgAxjaC0u7D88=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F3B4DHR6dPXsaVb4EVhl2v1C8VGknhR8Rw7o5jMS9AyneKxw+JHBOgnoaVoq?=
 =?us-ascii?Q?q5PJU/Z7UhfXH4a9htAam4e5FlpoSCTRiHekcODfo/FGwKZrEEw5A8s6zF4J?=
 =?us-ascii?Q?Bu1IpFD96+xlZ/FnBv8O47OHfZ0IvTzbihda5yI2QviIGmGJvw+1Hlf9Eqy4?=
 =?us-ascii?Q?PN2Dio3FndJjXQoHme7q8p+2SacCJOHSS6DdyQ9eRXlHjp+ziSuobc7kGDSH?=
 =?us-ascii?Q?YSMmyongiHJ3LgJC0fbtNPDOBxh9dTRy06ahF/mpIY7e9ClFRJ4CSQ//0BEN?=
 =?us-ascii?Q?keDax/iAgucKJ8rVZAh/w+2DKqSy2iyOmCg4uTXxFtesAvzsmuU1bM+yfCNi?=
 =?us-ascii?Q?b9w55doTII9qf15Jzm7YDH6cRUqABZxI8JEEwcjpSSyocnNDBzs1BggC2hiQ?=
 =?us-ascii?Q?TutXtUviazYLF9AVc3kmLsui6LkxyUo/PM94ujtMI05GIoPu67v+F72t43Ld?=
 =?us-ascii?Q?AzvsL8Pd+RPXSI8DI4m8fn9zaIQ7RvwDa7VVZoGMTqDJJGFdMnWKmjEP0RPx?=
 =?us-ascii?Q?nsxvy40K8IpJvcUp+ssaQbpDRt1jN3OgzpJfVWk37P/demMc3qEpOsayrjAZ?=
 =?us-ascii?Q?efctZjBXEG4UXjjxfqXV+BGFYXTxF8ynRBikMV1onzomD6pceQHiIgIYyXkf?=
 =?us-ascii?Q?GkhdelnBMbbwsi1Hzi9KVQ4xHCIby6ChGb2vbxX6h2ZDO/D4cVuP8Su8Hnq4?=
 =?us-ascii?Q?rmwFatvCtvqdIPfG8M8Rt06FgitsCCYBytr3nUNo3GAGJYTGDx7tv7yQpbOj?=
 =?us-ascii?Q?6wYPXBMvqcizZOqqOa2m+Ft4eC94MUiw2TAq21JQxY3AxId2r7WCBYEjx0SE?=
 =?us-ascii?Q?283gfiXhKIiVDJb13JtMIxcrUIHzNZV093LIECbjMkz4ORX3KSPS0kkUdoWM?=
 =?us-ascii?Q?MmEz1YoiouORvaIZXrmB6kV6BLoDFMVFL8RM7eqc/lD62h8NvIQ9BBe7BnLH?=
 =?us-ascii?Q?1De9wVEFBnM2wlEG3gG+r+SShfH590FZ9zyeyAxfQbL/YGuItx0H9LIK2tbd?=
 =?us-ascii?Q?lmU8KhPWuk/fvWr/8aCXHD5KdjcmnspTwxjArG8kwZk75MFa3SOh5YmVYauu?=
 =?us-ascii?Q?tyumK2PYoAaNVfN7MX0ThkLq2U/sdqikoj+VFnEJ7sJPp+SfvkAW6LlaWwzw?=
 =?us-ascii?Q?BMYYs3n77On5FF2JZcFGsIdIXqoJtfCIlHdjFOX+WQXv3JwiGHKd726LBGpU?=
 =?us-ascii?Q?TeTdTJgJ/SHrtajc6bNf7cDTMgtKKU/5HmOyeHNcT8SvtRZX1dbjDCf/J56H?=
 =?us-ascii?Q?ofXdJMcu6Nkxzp26FzqoQ0RmvF0UgOhxmJhrIroMqszc4z03xTdCaIVd+00S?=
 =?us-ascii?Q?9fm9kkgX8sxdHYdDNrFgLH5iW42/18ktwoCCopd96xccIhU6nDntQf+o8ZTO?=
 =?us-ascii?Q?Rt0BATODNqp2LO+n1y47ZuNyofswzgGr/V8r4kQCSuAUUxceUh2zwx10KRx2?=
 =?us-ascii?Q?fnw6i1gl3NJYsJtVX01L1PUSteyFuCNr5yTzTTnZn8Vns2k2M40fVXKsVU4n?=
 =?us-ascii?Q?TYRU58csQiTtDHfPLA3LCKMAypkY2EMTYTDXSNT0E5MKz06sqlaMDCSiztRf?=
 =?us-ascii?Q?01EcpPDZS8uSsU7hQwS0a0TtvB1wvREAUfPkCBEY9T73zYjfTqeiWxNqlMYL?=
 =?us-ascii?Q?h82QP4bFz7OttCWTCpgFEe1+cXOZhQglqQ/g/l3x6nKFzrqUw/rpo4Fc4bUC?=
 =?us-ascii?Q?YbUvcTQJdhJB3UEgtslLqudfLyJA2942ssDJq7JndukydgzutRhGWqOTB4zz?=
 =?us-ascii?Q?x8mI40o8mMfsMxhW21hh1qro8Bi6LKs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39badd59-95df-46ea-5f29-08de641fca05
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 19:01:23.2097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAvGjY2BfP/qWf1gOlZMRnsRHmT1KmoGf2WU1IJ5n8FUPQRqcwlSPJ/4lBaJtoAvSV2Ay8d778D/YSTHJd+sKT5KYSw8JPxiAzssBeOxJeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
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

On Wed, Feb 04, 2026 at 05:28:11PM +0000, Shuicheng Lin wrote:
> Free the newly allocated entry when xa_store() fails to avoid a memory
> leak on the error path.
> 
> v2: use goto fail_free. (Bala)
> 
> Fixes: e5283bd4dfec ("drm/xe/reg_sr: Remove register pool")
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index d3e13ea33123..8efb2c352a6c 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -98,10 +98,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  	*pentry = *e;
>  	ret = xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL));
>  	if (ret)
> -		goto fail;
> +		goto fail_free;
>  
>  	return 0;
>  
> +fail_free:
> +	kfree(pentry);
>  fail:
>  	xe_gt_err(gt,
>  		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
