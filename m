Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB20CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 18:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869151133DE;
	Thu,  4 Apr 2024 18:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQ00ZHM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05561133E2
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Apr 2024 18:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712255167; x=1743791167;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g8qrEYVxmnYH3NsuZt7tbYyWdEXtphlqWfpWfe3PItk=;
 b=BQ00ZHM0VzhXdyLeAkxDPpZmphbki2MFtf3iJ4VI0PRfYq28tMR8HIxW
 egAgPNLKMlSrLsanNCzchRbkHz+LEdKHBi3B46N8sYipwHwsnulDb7m3E
 /qywRyIXF+cSpScV+jO0aOO5zRqj58YOmUMgm3t4DyRbdsEk0ohJ8qRfd
 dFHO0vH9iSjXahJ+05PZK+iJhmcfdybjeHyC7MR0rfrSYh82a11O1MG7B
 4BIG7jnAyCdsAq4kch834JHA8ScEal4Wu0tRxu+4U4rG7eRyeQie7bh1E
 OLo7qJlEntZlPbqHjm44cemeXd1QdydH687Hzix62g+FjIYmcw8PV7OCv A==;
X-CSE-ConnectionGUID: nrneOS4FRaaURS+pwVkAkw==
X-CSE-MsgGUID: KWuxjVb1To+KSz5Vle2CLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="32960567"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="32960567"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:26:05 -0700
X-CSE-ConnectionGUID: gGovHhbxQaCSSyqLNd7cGQ==
X-CSE-MsgGUID: mlbHwaTKR+SDneWij+ktlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18812390"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 11:26:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 11:26:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 11:26:03 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 11:26:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7UQ7VFmQa9TtPk8vRNZkr2VIunk8hgTEPREiEZ3i5mC40Lrpw2j0xEb3KudLc81wAbKzXS0BmWbKFWhOasC+Uh7YY2RdGqqvypJ+33aRqMcyxKitkZGCqZXzypDj3y+kSQJQYEGB2xkh/jO9F1AkuHETT/++ZnqrHN0B4bEJJTPdYQWFhpdlaGiQ0lI3mZVTVbMfysbv3fFnX1ytwwgif5mzyPsMEwUtJldI74b8ZVKvjmTf2KZQIblSBZe1ieGO3/DZAUwgAy7EdgXxGJVVE2VrogVA17+hzQEcuEy+qtTQP4/HSn6RZS7MePZlIfaiYHi+BRah20u5MbztdN3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsQKD7rPP21Kf6zx5zEL2wvjyEE4s7OntN8dbIOj7Rk=;
 b=OhewGt2tkzpf0avPTdPwASf8liYjdjlM3/69ft+OCyHOzM8VuY74v9+jignGgAvGyUaE0OdmzIBwSLPY1B/e4wubEQzGhF6I8k8xtqzSab39IeOlFyW/sg9E8mBRXd2gkZw07SK0wSHsLXyy2C/RibLMrxCA2DJB2f9XREHBtXHUM9J/6R51isxyIf9Hivjpmtkfy+U2+xHdrJfcKLyLnfwBxP9IJgKLofWn/dKGBAL+5M+vCjWgOgblvnSTfvSxaJH6FDD29Asugt2OiS+qyUmtNNrur6rVHlA/IqGKKx1vjKyw8gSi6t1Snaxybgv596rTYByH6uTIkVpZf6dLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5308.namprd11.prod.outlook.com (2603:10b6:408:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 18:26:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 18:26:00 +0000
Date: Thu, 4 Apr 2024 13:25:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 0/2] Support/debug for slow GuC loads
Message-ID: <eyb6pt53jy4biywn7rgipk7lgajkz2wxvaul53wzbrpe6a2pvf@afsiviwaf4ix>
X-Patchwork-Hint: comment
References: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5308:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7XCMRKMMaV8QO26CJhmobKC19bQZU5/nEOybJzCj+prohfRtJSMu0azhlxq+AWS5HE4NbDDGAIJBry23ZGVhZgY8JoAXS6TknGG90IYBXR0QkMwQZGcSoNe70bIAzVpQ7pO8srnttlFATgWq6nGAIm7Yh4uyxmWNB1TODA2XDLVtaBWbsW7aF+52w/fbOLzN2qw1vgeAvkqzNHOwVECluoM7YPX8U7n0uRZ2KuFjdnuO4ztRVMshmKwvVo0HwD8DudcCiDlsNDR6ZIHK0+eRMmgja1KRQtd+nXvBNU13GhKMi2E5QMIpc2RLM7FFZ+plib0EQxrWvnxqueP52YUejEd7jrVbbLm6SJTyM0PmbY3YkJGFodLQ31NaeTBU/8QGwJjloW5fYjKYI3qLqn5BQgLz5X3Gt+lbafWpgnxX7E5dXBZyRjH2+eal7YKocWOmZwkWyyEJmdhPSDqqsI9kA4s7RzYebPO19MZXT9jyNAJsZ3PKgbs+VX3hyvbjC5HY/ATFJPKj3fCu/v9VBf9ehPJNDdQOtVKkDSzcZ7BCuXUdd0pMBLxs+hJyHptUlZ0eXDcx9ynCABX6qVY+m5Qwo7mgEr0iFvxvVRxMnOeN0pU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4iVu2ZgPwyrBurRtBZ4RAnWg6R0vL4r2/cRFHZ/QBAVGKJvXguu5BTT9o/jG?=
 =?us-ascii?Q?e/hn0RZF3v0nN6IHtJtmpTt+Cd47KrlBWts3hBJaViubWXr5ya7r00RDH7Y4?=
 =?us-ascii?Q?ePKaQ+8u3zE+EE/egHE1IrYuGbJI1jz8QtoP6MQzXMwuUOTCXkK4oxddvkVg?=
 =?us-ascii?Q?Poy5qubi+1JrbdM7OAU8OQ8zXT+3UXFNnAxNQv9tq0i8go5Cjs7s61tDxS7F?=
 =?us-ascii?Q?/VFS9dlg5emG00H5Qhn9IkM63iyuHZ83CEiiWoiSQLpTxzgr9CHdQMwPPcip?=
 =?us-ascii?Q?V39DCwHHHVe7kK8NFOd8SJ1Wv6g66/M2FCdPcsJebm4l9K7PQJWv0/22Puqt?=
 =?us-ascii?Q?31/RbDbktufQHhV0DHMSRc3B0XmKehlvsu416y4LwbgrooBlWiJQ4IiifD/G?=
 =?us-ascii?Q?lDiJrrFWgvQHDKpVHTexgQ9ciNa84PH1bMqq9EizQeTsOc/plUaEPEcFDzBQ?=
 =?us-ascii?Q?d9OYL+X8aDUS9UUYKl2temjis/IfY2c4FhhSh9rfUAF/cAqX9WLiJAwmfR07?=
 =?us-ascii?Q?TTDNxnhIvA3BGZYlP76Sy5qjMY2CkBFa5rHzb2g4yXp1X3BiilKxB6ACm1a0?=
 =?us-ascii?Q?J4fGtjA+SldwjIBygr3Idq+Hp/LFOD+fVD9fgAfdmQj4wbR2fqT3Ss/gWvga?=
 =?us-ascii?Q?/YhzCAgGf0MJwK9Rd67b2MGzyk+JwBHzjsjGRAjP8Nk9qA0v0bnecKjyJH5x?=
 =?us-ascii?Q?tzN39c8BqWEAycN39NPzymWwhOzXmvQAAJBXF0E+7c0iV2SwYs0yPG57fFhF?=
 =?us-ascii?Q?crLZ9W+HnxVZCbtOlUdQIUg5lM9Q+21Lyx7RgTbuBc1Hx8KXym/3UomJFbpb?=
 =?us-ascii?Q?EY6oPN619WVE0zUA92EA4hcHa+moZwHdN/dYqohXprktnPoezitIT4Z3ALXh?=
 =?us-ascii?Q?2tbxdxBuVsu/pqq9FbjfncJHmLWMAlNDq219lZKxODsS0e1aM8TH9YbrB+gS?=
 =?us-ascii?Q?w5xv12b4b+8L6Fke/yWG/zJlz98c9JNMmS52AcaHcb32dcLHDAhAr7QI/h/Q?=
 =?us-ascii?Q?gJVmhjZQIkWWGo+2GfPpOTs7cGIoiolw9nGgjuPvhMebTjsl74Q9qgfHFPhi?=
 =?us-ascii?Q?y7JSPqUNSMBT1vcRd0k/Y9qiKl9VU1TpOHa4dt1pn/W0MZzWriZVPx1aAmoP?=
 =?us-ascii?Q?E9nT2kErGRUgNHiFDNOUo+itQc1ZoUYSK64X229nknB61F2DZGVcFQSpAdb+?=
 =?us-ascii?Q?FOdnPTPvLIo6FBLDvxQR4ghWuZVVUpQrrKO+X2n51LS3Nw0vAC6ijgABVvh9?=
 =?us-ascii?Q?/l/HlElb9x/UeWBCuiONVHWjiZTPRP8tjHiPfV1XuKMMioyI/3EYH/zxTfJi?=
 =?us-ascii?Q?I2w0rzEfYiLY4ickm6gkV1MqEqBGA0Kw7MPyqs+aTEQdYnbZ9HVwysto+oMv?=
 =?us-ascii?Q?vf9T8ELQOVN5xv1HCtSEAQQvHtnNMyPOXMfprsKeBGOOF5QW8NOZQRgYcWtg?=
 =?us-ascii?Q?FV7DwbZPexPu6hi0rEBCaet3gvHLcG1l7jQbpl0GeUCTfbi+mzSLuZ52s06q?=
 =?us-ascii?Q?f4Ghch59hCEYmr+5dEgpOl/0lzD+bnASUa0nfYQGYNRk2Bky42W0fREDnHvS?=
 =?us-ascii?Q?JODe8/7F7P4hLt0vfTp0jDfvlUntECMDORVZ0YF1AIkn/UJzwBc5hwX80rUe?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeba9b33-de5a-434c-36ce-08dc54d4ad9f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 18:26:00.4581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6h7DVbyue1pwwiEqF4RmDfwGe1DLgsTuyAPb5ovO+curdWZBgNoItRxWv6i3kaS7MU5YBlCe+LaWjL9g1QAFIQRqfQi4Vzp+W1EySeLKo58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5308
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

On Tue, Feb 27, 2024 at 05:09:54PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Sometimes the GuC load is slower that it should be. For end users,
>that usually means some kind of thermal throttling issue. Internally,
>there can be any number of bugs that cause it. So don't completely
>fail to load, just cope with it and report the problem.
>
>v2: Revert include order (review feedback from Lucas)
>v3: Remove '_sysfs' from throttle file names and keep limit query in
>the same file rather than moving elsewhere (review feedback from
>Rodrigo). Fix the reporting of requested vs granted frequencies
>(review feedback from Badal).
>v4: Manually code the loop timeout/condition checking because helper
>functions are not allowed (review feedback from Lucas/Rodrigo)

wrong reason. It's not that helper functions are not allowed. Rather
*this* particular helper was considered bad and counter productive.

For similar reasons as e.g. Linus commented recently on bcachefs moving
some functions to be shared:

https://lore.kernel.org/all/CAHk-=wg3djFJMeN3L_zx3P-6eN978Y1JTssxy81RhAbxB==L8Q@mail.gmail.com/

We'd need to spend much more time cleaning it up and making it a good
interface rather than copying what we have in i915 and stuffing it in a
*utils.[hc]. In the past it turned out there were not real good reasons
for abstracting it and making it generic for all the contexts the caller
may be on.

Lucas De Marchi

>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>
>
>John Harrison (2):
>  drm/xe: Make read_perf_limit_reasons globally accessible
>  drm/xe/guc: Port over the slow GuC loading support from i915
>
> drivers/gpu/drm/xe/Makefile                   |   2 +-
> drivers/gpu/drm/xe/abi/guc_errors_abi.h       |  26 +-
> drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   2 +
> drivers/gpu/drm/xe/xe_gt_freq.c               |   4 +-
> ...e_gt_throttle_sysfs.c => xe_gt_throttle.c} |  26 +-
> drivers/gpu/drm/xe/xe_gt_throttle.h           |  17 ++
> drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  16 --
> drivers/gpu/drm/xe/xe_guc.c                   | 226 ++++++++++++++----
> drivers/gpu/drm/xe/xe_mmio.c                  |  61 +++++
> drivers/gpu/drm/xe/xe_mmio.h                  |   2 +
> 10 files changed, 307 insertions(+), 75 deletions(-)
> rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => xe_gt_throttle.c} (86%)
> create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
> delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>
>-- 
>2.43.0
>
