Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04B2CA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 22:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8968D10EA3B;
	Thu, 21 Aug 2025 22:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2rI0wie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB11110EA3B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 22:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755814099; x=1787350099;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uNXKlrmtR3p0QAzWkYVMCb8MAeps9hbjDzq1VldOCfA=;
 b=j2rI0wieU03BRQA4VfxLC0FM7LLwT/fhaET9VnQwz5/ssQMn2kEmmOVo
 8s3QrBGaNJQ2iXRNKhPMNEDO+yYE64rf3gj1q+DgXrGVqN6gnznZJ+LRJ
 XiBGrebsnLCfEAGZUu9/wRYlOKd8K9vX/AYv3g/dZsBSdghJd6SpsH5ur
 uI5a21Rs7qf5vbgFR8sUvxG64ERQ+uzrJP4A8itCxyJUqT8iCRhQ6yHao
 Qm6LjUJhFOku3plf6rJiKGW3PiItVA2ZBf2sdMmSpXToYloZLWhBhvu9X
 sGAPS1fquniywPsrQP7JaR+Iw8XGtBZ08HQfVHwjZcLmbXjz/RI9YdxCX g==;
X-CSE-ConnectionGUID: h6aThuMDR92wx3AEU91s1w==
X-CSE-MsgGUID: Cw1X5ZxdQ7elv0sVu3V2cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68824327"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68824327"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 15:08:18 -0700
X-CSE-ConnectionGUID: EDtFsZfYSlGYlNcLmxMKkg==
X-CSE-MsgGUID: VJeaVtWvT+KNJ12SvOM5qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="172939710"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 15:08:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 15:08:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 15:08:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 15:08:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUni2kXJWQc8DMbW3TvbCSZ4Hl7YU1qucLVzAx59EyEpIWrhLgUt7/X9zuUsX+spNKHyUi05/VFBo0wGUiURg0CeddzjaP9mXygZ7yuN4jH/yrUl7EXZEKDXFpQ1QeuazTHlEDjoUpvpiV+jYQ93O0kPRASDnfHLnipOT97p5qQvcR3rek/DbOqxsid0LXAMZStY7yOMog9a0lN3LSdC5P6l74CKZLPhSzA9ynZKXnvuyNjKsVWq1xz+46IhZfT3aYpgI22YaYKEY3n0OZ+VcuJRrt9lbAc/T0xLhipB/SeQWym6bGlFssfJPV0d/DrrVUMgcdMHXK3LbhgWV1kDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8fy/EQIVy9soMPg+unsf+8m2MVWULVCXQAHlfeOpL4=;
 b=wv3Vi9ciF1xhFFtmx62Ds35V53kv1Q/T9UMikTCExYj1tibX9sgiuekkoyN+JUEMnjYTEuUkXWqqR8JDPEUj3GTk/KHG9eo/5Xc05BWcsV8gLw35b2KkH60knvf03u3bYQkiu1IE4bW3CiTqCuX6JrQ0ADH159TueKIQpifLOmWw+7UnsequKxENMY97uYerbKwBo8J5rUBZpdjEZq9saQPeQ7b26OOuAWaikTXijGQDgm3+JOL5q0rVFQMBXcPucVKW8EiglFjMnSYYIengDiNrJw+GOosfl7XZXrG98XttxZxuDyVLRhpzJ9qtTNRupl0cLfEZu9YBou5WGNEMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 22:08:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Thu, 21 Aug 2025
 22:08:08 +0000
Date: Thu, 21 Aug 2025 15:08:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/vm: Clear the scratch_pt pointer on error
Message-ID: <aKeYxkMtgn7aNJDr@lstrano-desk.jf.intel.com>
References: <20250821143045.106005-1-thomas.hellstrom@linux.intel.com>
 <20250821143045.106005-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821143045.106005-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f9c051-680b-4012-3428-08dde0ff3613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xz4t24PvFxnSmnntHy9IjyN+a1bQbOL//CM/Dfvjis3LXiKFNtbbDU1uA9?=
 =?iso-8859-1?Q?ZB+75yZOAAiIPAChYy14/SG0sqblb+JWorp7/e8eS76+sGGjQEdBxqO2RK?=
 =?iso-8859-1?Q?1FVYJRYHZawDJzNkrIWUUisoB1chBKYmYoiw5rPgSGoYPkKnsMZvQ4h94f?=
 =?iso-8859-1?Q?4WUHR9w/vc2FqqYcalktkBlvhZiVGvHjDUMnqcrQN7lYzj1iZLsTW/H5eE?=
 =?iso-8859-1?Q?37PfClAImCtL8jKJsObIUkfrkigyL7/KP4HVlu7SZ4nronD2nsBkdjRApO?=
 =?iso-8859-1?Q?OyI5mEploqjtnlIbcAY11RTqyBGvQZCQDMUCG4Yg3Vk/rljpqdpPzh5D+A?=
 =?iso-8859-1?Q?4Kgk35MN/xylKbhC/i2KfjsFm/AxI65RgOmiOlh7wfvaEm+L+jMh1iaQSq?=
 =?iso-8859-1?Q?M/Ybzx+ZGeDSIkJmDa3WALSd0CSQGNJr3KQxRLiVQyHeGqzKXI4RvcmS7W?=
 =?iso-8859-1?Q?mRcQ50pnDNDZ1Scqwk+xkEnMTvWnGey6bHcDqUWj1QL6QycIqcl19Ij/WU?=
 =?iso-8859-1?Q?V6rpWsEaeclRqnJYUT4Eq1SyJm8nxjWmkXS6LaoarYS3yvWSqMqpUtU2xg?=
 =?iso-8859-1?Q?8NR8x3Rp/pgTTK/t8qvXgDKweNniQNE1h9VrYdgbaVsOlQXY1FPDxQmAgw?=
 =?iso-8859-1?Q?fvI84BgM5T5TrRmXJm67bgotf59Pd5xjH5W/lR4MM05f7maKikJeiMXjML?=
 =?iso-8859-1?Q?BMnmnNZnxtqHFbWFW+deA0kkVxuqyOQePWq+WtcjmukBbAlzJtOWp7mONa?=
 =?iso-8859-1?Q?BSgjiOVMVjv3aTyMOVc7euwxaY4hEyO7UH7NSAIleygymgScP65ir7WEGW?=
 =?iso-8859-1?Q?Iq/9Urmigdp2gXAID3dM5ROtgeNkUxM3w8xzHzAwzbN7NQpv1y7uHEpJGm?=
 =?iso-8859-1?Q?1Pq0lZpI48G7lAVJQRyXNAjhFxzj42YKqwPwJGL7mF0jManBs+Goyqmsrj?=
 =?iso-8859-1?Q?lGc79SWJxlL8EMedLLcpbHb4JD2y0P5tac1qQZ62ie2dOeYC9n0WGfR8nC?=
 =?iso-8859-1?Q?WDiHQlQOCC7m1YypmL2m4mfXO7C6WSAR2iw9oQlBaQ3d+fA6cUQedzduhp?=
 =?iso-8859-1?Q?htWqW9YoyZDTg4uSEkucNnkB0NqRXPJyNw4NGzd7f6WLFm1iElS+KsWde5?=
 =?iso-8859-1?Q?5mIhUZ074aqkvJM7fWCBNpcmuVMpeH1Cgcuhwu30SNqyEjwrGKJgipUEoD?=
 =?iso-8859-1?Q?luRm5FqMzegJTTMe4JHzTBZopmnCZKRWvAyOdXeOducfpG54tMO+SoZ0yR?=
 =?iso-8859-1?Q?uiDCm8QMTasbu+qhf/drFuHPwRvwe+bq8Risfdw7GzrW81kNsUwmdVjEHy?=
 =?iso-8859-1?Q?ZJrYdJOfm8LDYylqIROWGQj1bRQz7RNuXXRk0kFCYU330i6fVm9bblKlBy?=
 =?iso-8859-1?Q?C6Vva76132ZpCh3UsLKxKSyDwRiD/mv6LWw6kYn2sMIVPFl2GHQwcAcifs?=
 =?iso-8859-1?Q?vp56bulubRRK6l1fG5rXjX4i8SX7+1gQF2cPr3z3QQqNPxEodztoit9GaM?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tJwc5iQO5lmdntGLHRbMpmzIsZBkQBWBL1aUURBMpNFmdd0C1WrAPSpEmf?=
 =?iso-8859-1?Q?4DycZj/E121F5FRVY0PNJwK0tBrYlOeD1PV6tGSAmhpPZ8XxUxsB9jZRxE?=
 =?iso-8859-1?Q?RRhm1gptlHYEIBh2/ZCoL0sjeupWboM8HlEZvwFF+tRwxjTr+MlLTaJ3qH?=
 =?iso-8859-1?Q?Mn8UELt3qJTrVr3nvyOppOLrLTf/pGA9o9S+FxCQRg5SmGE2lBHaqnlJ2C?=
 =?iso-8859-1?Q?K8XioM+2N0qYIjEnnjVYPGc0kM6OXlwzIttl4VPoQnu91mWPfyQ366Bo99?=
 =?iso-8859-1?Q?ZkjJbJfuI5pxrrZp1Nj28db6NJ51VMAS2uMJGepHwOYtp4Cb//Noqwprw9?=
 =?iso-8859-1?Q?fPiXonz17e7mYJvaOAvMB8dGKKncUGaF2PKe5pobkb3pLjGlB5GLQWR+B+?=
 =?iso-8859-1?Q?C72qvCW8ZLpUom16Gn1qLAnXCQU3GZtR/2ZeZfaNNRquOuuSPJbzp0RQ6d?=
 =?iso-8859-1?Q?5kBEC0sB+mWKG44QfT3Q5SjdOLgoWQ/Rcr2SzBJdFWZo9LFj3vNe9DlgKv?=
 =?iso-8859-1?Q?U/aQjuEcT97tZwqBMPsLI4ZEqP24lQnlsfPw0jaZOsxiv9pWIdDz549X2Z?=
 =?iso-8859-1?Q?+le7GjFvNllHPLVWKCi7ASsrHYghBJ4E48JgAGaYutietIivjla3tDQvSw?=
 =?iso-8859-1?Q?8gCpxe7nidAKAkSfRUSR8Af+y7SAuxiSMT4qoziwAjQcDABf1DYc9KGFbO?=
 =?iso-8859-1?Q?PDUchDa3/ACktMdK0yN6gL3M8mWd5/Z9kmEkHiZ8e1LnTDuUecySaXkfU2?=
 =?iso-8859-1?Q?wwIaJwdD+Cl7g4sidvE2cnA8bvnLgU5k9hv5QJmK7pb8ZTPtv1YaEaSO0b?=
 =?iso-8859-1?Q?3LirTsdtt/ZRTgBoKJ2y2IZxpFmXyQieLiR7zCH3vXATrVH302QPvV7XEE?=
 =?iso-8859-1?Q?0WHc2n0K4hOlB1PJj4HtFBHs93n+lQ76OFdCrXTHk+rvDL8Ov2Bm9zwG9r?=
 =?iso-8859-1?Q?oWE7+q+LvsPOK2tKmOQcjK5pjbukKdbITr9F+Jzv0y/rTCRruPoAZgQK3P?=
 =?iso-8859-1?Q?fz6g08dUl8lb/2skwX6ELCa3ckVg/AVO3yq3X8SCjztrl3hbBHmZyKSWp0?=
 =?iso-8859-1?Q?0wfoVaWu7FsVvma0KQdM81GqAnda5zCLq1Tibu0tdKa1L+6jb5oQjO64by?=
 =?iso-8859-1?Q?0oxcmDdi0k58iF6KbKaPhlHgQhoGvw0VJ8Gy64jc7FH+5rtkp81PSpi56E?=
 =?iso-8859-1?Q?v34UfZTZZr7Do2ds63Wdh1LLzhIvkMo9UJcLcYXSx6Wx3S6v+SZAB4ku6a?=
 =?iso-8859-1?Q?kN/kJl8cQkek/+VbN2pCUzh2lnHMn7Mv6M6rEFORf1h17nwC++94JgFxP4?=
 =?iso-8859-1?Q?qWw81VnsvTP6EfYVMSHhM7ODtCg1C3SVzZssS+kL8fR5MvWRflsWf7QkTg?=
 =?iso-8859-1?Q?Cs4IdAec5UifbykSe5IC2KZXRgRkXp2S6PxVpJkjZU/g1xLvc/2V9pB2tS?=
 =?iso-8859-1?Q?tTRZXZ4AQwpVuYJdQquCkNws1nXSKesUfEIpBlb/XI6I0eYEk5UaE7dj5T?=
 =?iso-8859-1?Q?9XcreiUDoHg4QQa8JiX3CITqL0+XSZdAHczTNrBdFG41NORIGEmd4zmljG?=
 =?iso-8859-1?Q?rdHuSiYmu4EjvJyFK0np7XvYCc1BxMEN6CYEmVcw6aCT7St9VzrAcRlX8q?=
 =?iso-8859-1?Q?fy4ZcH8raLRLsZvqrH/wbH+e4sYwgDWSakyiezjsD8r8H3jfQs+cyDyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f9c051-680b-4012-3428-08dde0ff3613
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 22:08:08.6690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0MIE6tO3Q3wZB+G269NK2mdH65+xFifkOmlFCTNAb67ZBXiM52NnVYtXKPxkB72e9nvIK/cpCRDCCbAMZdweg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
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

On Thu, Aug 21, 2025 at 04:30:45PM +0200, Thomas Hellström wrote:
> Avoid triggering a dereference of an error pointer on cleanup in
> xe_vm_free_scratch() by clearing any scratch_pt error pointer.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 06951c2ee72d ("drm/xe: Use NULL PTEs as scratch PTEs")
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> Cc: Reviewed-by: Matthew Brost <matthew.brost@intel.com>

I think you are looking for:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c86337e08a55..d3f6dc6b1779 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1635,8 +1635,12 @@ static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>  
>  	for (i = MAX_HUGEPTE_LEVEL; i < vm->pt_root[id]->level; i++) {
>  		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
> -		if (IS_ERR(vm->scratch_pt[id][i]))
> -			return PTR_ERR(vm->scratch_pt[id][i]);
> +		if (IS_ERR(vm->scratch_pt[id][i])) {
> +			int err = PTR_ERR(vm->scratch_pt[id][i]);
> +
> +			vm->scratch_pt[id][i] = NULL;
> +			return err;
> +		}
>  
>  		xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
>  	}
> -- 
> 2.50.1
> 
