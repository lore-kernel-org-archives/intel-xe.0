Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4E8C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 21:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AAD10E3AE;
	Mon, 19 Aug 2024 21:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I40c5kvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F226210E3AE
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 21:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724104330; x=1755640330;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lmx9GE3Q7U2/FWfTxy2qUPngzpFRjc0lyxTKBY918OU=;
 b=I40c5kvk9oLVwPNy0WzzB8EGhZUKKyjuv5Gd3C58XeHx8IT9BiFtnkSy
 EDZ443Sfj/ikq3YO1KuNJPTnSw204yJ9f/g2efLILGWHQcWs29cC3Be2W
 ODLetSGLXSSWJ5t6xQhyh9/iLs9Z1mjfHNCoG2QSASqIf2n04flG6Chjo
 WCkM8ONkcpLivCEb2kgPCFL34BE0BU2txt2wK2heeLP+M2dgjyh88GAko
 2UaSkJGDG8vwRF10bUgqEQ5ylsMNgPJcU4x6tJbYmMDj+iznvpB5A/O03
 XtlSqHH73aj5KhBFf1sY8nIY/cfVrDXrBayX7yqtrJRwODi78CyPfoOIS Q==;
X-CSE-ConnectionGUID: CbbzRL4+QjaHxnRtoyNjbA==
X-CSE-MsgGUID: tzlqTaHJQjyJ/z3jxSoEmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26240126"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="26240126"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 14:52:08 -0700
X-CSE-ConnectionGUID: M90V00krQPmyx67EEsOCEw==
X-CSE-MsgGUID: Lw23Y3hASe+/OWh9tonDUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="91243324"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 14:52:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 14:52:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 14:52:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 14:52:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQ2xlp6luh24TCOJEL7KMA+OzAcJdYIcnZZ63YxsbgnaStZ+hFb6qgaRs8A3szXl2uTnz4MOphrKZIin5YHfuxJedGIxwij//fIC8gQMGlNTvdOx4YvuBCP1bN+tPam8QJEceV9puam42FHhQDmnYJ918eYoy8VD5BxebvbTab3t8tce4hEJcHg9t7T+ZZfBlozlHRlLAKYbUhwEuI3pJJAzPTgJ8a90fkrufVBrW2DvkOlT7STzFR/GPsuFcd4n8tRHv+O/4yBvaMOB0c0TlwZjSGjUabIgWlvEwZYbVPSLw/GusEn+vZgh+zeEdfwed4IRNzhygnxnTaekbL04iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JhkyEeZa6v9sNkHByz2MNShb03NEzchbzMRHGD3T/A=;
 b=wDVrxQ9zqBGsuBHYudWi+JuT/owolLLwONXkzAKAUdrupNi1S+M/HheDO3/G3E19KW2tvfJSAKEZKOKHQ7UfzvA4cpZ6MYf+vbkRxLrfeVWxw3dWSw39P5HIiJ8dPINSNLLoa4DHc15imuDVb0ChU/mil2bSazmT5eDZ2HaFaoAiaMzWhXnwd50e3/pCVNHPFNtsuZQ7miDru33e3xOWuBbLSuKDx32et77KlP/1dY2MgNvVvjOBnqbRgRb5vS/zdrbw4HGKuakyjcn8tfGLS6kdmBbXpsJF2Bs7vdS/GBq+8nV/GmjCKac3zFp1zGLWOciWNubBWPTfRo1aQgRMUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5826.namprd11.prod.outlook.com (2603:10b6:806:235::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 21:52:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 21:52:06 +0000
Date: Mon, 19 Aug 2024 16:52:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/12] drm/xe/tests: Add helpers to call stubs out of
 KUnit context
Message-ID: <ejgtxc727guqh6dl4tfjdqsjlhlbs5nfzvkmsxbtnpaxnu2uvx@rroc2e4sjm7r>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240809165159.662-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0314.namprd03.prod.outlook.com
 (2603:10b6:303:dd::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: 1210ccdd-112d-44d0-e57b-08dcc0992ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fOXicAm9iFRKZrcolulZ3GJKbRHeAoAFGyom7ij1UJtdP/PV3fa0QeD/IE70?=
 =?us-ascii?Q?cNRTygBWTSIT0zL3ko7i3tuzfP5t9PUUM1AhUKkYqVAIHnR/nzXAoCZR55Zr?=
 =?us-ascii?Q?9U/Et3JsA3NUczFIf349L3VzXcfm3+Zetq+XjDvb57l7wx7Va3Az8MgpJrgI?=
 =?us-ascii?Q?Uwd8zLaSaWHM9/CRlkISti1bh5Yd0QdedsBaPfjzvVKHvVXit2mzmn3eHkhL?=
 =?us-ascii?Q?dYt6YFLHc/1Tghr7oIYw1fXh9aLJM144u1sJvss1pt4Uy011vKDaF4+dvSOO?=
 =?us-ascii?Q?Lom7Zh3aRqhZbNBjYtIWMHgJI8nXtvg1mgJOfrHmxg2hV0hQQ09vZc5RPXzp?=
 =?us-ascii?Q?YMKEWrL3s2KX0uWevTAXpJPca8FmiII5ILoZO0eMtdmYQWDZtYqettly8+R4?=
 =?us-ascii?Q?Zza3YhYAhXpt4NrLXFBoHu+FUrH6qqDgXc3NCKtCXLIloaGeisXvz9fTlyX3?=
 =?us-ascii?Q?wVo1Tg0QJFshgZz41T6enqhFtzf+9ULbN6Hx3Abi1JG20Jt1kF0TeDyT58fx?=
 =?us-ascii?Q?OkF3sCThucP/pSmODq0tBNQtqUVdA64ShJ/4fUdQZenjrmdYauQI8e+Fy1ii?=
 =?us-ascii?Q?PSaA/fMZoD+6ngbXijFi7pr51AuQZ09IPwQmTuKMGdaSkJS+EMKFDGaxfAsA?=
 =?us-ascii?Q?D76eeHN/olr6Xr0SJom1WTzfbgOrE6kZcoMctHAMXA4lN46U91xgRH9hIzQA?=
 =?us-ascii?Q?TXBW/xOyd9WoVqODqSbjIIXWPZvSYB0lk3I6Q2uALgm/uT8JozOQ7/j2fTGM?=
 =?us-ascii?Q?JJMX3XLk+k+paFd64wm0T0i68pGZOOs8IKXX5btps1lRzO+euUL0TgrhVBon?=
 =?us-ascii?Q?EeSNXitfnAvIostDP93ycljInlpBG/rffCHrbi8UiNYx90lnfVVY/mlBiTPM?=
 =?us-ascii?Q?xJzA+jrTm/2HZaO7qwOth9WbK86McMhrkvKb6q/UskfwKIONqwbDVGISNeno?=
 =?us-ascii?Q?VVpW1UpkLqf5wabso7eBNXTnu4qWf5PyIQzqoVCGMqHjNQwQNIZ7KFQ9XmY8?=
 =?us-ascii?Q?nUG9w5R31axSYuI+pVY8HKAHcNZaFS8NYhJSnsJkZUG+BAdiBNQT7Yxa5UaV?=
 =?us-ascii?Q?UfUXAPO/DsNNZ1/CBqAbQdMZbhTn2x9bq+quUNathkSchYMJxAKZ4qZUK8BA?=
 =?us-ascii?Q?YSR5TY1zNw28nrmVaeJ8HW75kzn1z5mpjshPHvBGi+GxfOgWWearE2/T2cbz?=
 =?us-ascii?Q?FD5xxhZazyMHNus9DYr3ua7XtF4gW10vPAAzi5iOUEDuuGmkF+yQwMXzqN03?=
 =?us-ascii?Q?muRF9UenjumYbr1PFYWenFXb3jlGquCuPY+x8mXF7nzFS+GuK7ghr4ZqyWUR?=
 =?us-ascii?Q?tAS2C1nFRXTrzLSTQoDwNuO5j4WH14SQrXONwpqjdG/OCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9s6+vmyQKGdVqiCKlHGBogHiuftlfuN/T4OX3p9Ut2oyl+1+GJGHIkuZU7pT?=
 =?us-ascii?Q?ilz+iRKkwCo50XXC261IYhm6vuDLWIfrveHaBXvjpVM+dImmOAZ2vVCo5eb9?=
 =?us-ascii?Q?jYklmPMfk+c69KuJL/HvoF9Xm5qdz1rUBzuPqWZLHH5bNap2bSPQ997+oJoB?=
 =?us-ascii?Q?V5vKbCtHWR7m6rxVFeADiqh7fya1aLTrb/tMIYRbhCrWYJmoqTkHplizjmCZ?=
 =?us-ascii?Q?T8L7Lh4gekUAEGBzgXSzgoFzgV0/IHmc3+41i747O0vgX2ElZx4tNFbjGSOa?=
 =?us-ascii?Q?hMNleeCYP357P9u/nI/+MzV01k8cdI6e2P0DAOfuPTEUc5NcDD4E/Vh7QI9y?=
 =?us-ascii?Q?aH/xDdDmgDd6AsnkqPZefWjXFz44wGkZPYGt82TzUaPpAbjRcWLLyaiBPews?=
 =?us-ascii?Q?Ee88em64FrsCvzI/96U6UC8Baaeio6bab97qCfuBf5cG9PjTo3Olu1lVSBo+?=
 =?us-ascii?Q?1Ks4rNGU1jLz2RMlwVqqNuaZKJ14LusEx7s1ZsW8KVaQUW8fvSK1RXrgpFpH?=
 =?us-ascii?Q?W8c7hOMkIKN7nlrpZDTVRXYJan3X1J6GNsTBmRaszutZkKUBg3JRNIfNe0GR?=
 =?us-ascii?Q?4319Y+zpT6nJHztl7wGSaF/JGP4yI87hPKMHkmGEJDBr0wNCNxkINwSE2PbB?=
 =?us-ascii?Q?QPjjvwzQn7gXsBM0KDbHun33ZQTfyfaRoBnq56LhgofC/gSdKxYfAJZMe3im?=
 =?us-ascii?Q?1pB84LzKtvpxb/fJiKPA2zGmxcZHRgHfOAWOplD3W9TjHEJXraipqWtXUNDC?=
 =?us-ascii?Q?ClVQdqiLowiu9WPFuOBvfBwK5bwHDUOCIjbjGgEbjCQECrVWAKzAKFNANgTa?=
 =?us-ascii?Q?3pAa39LRDLp6LnT1aMH6CIjCAz70LgGU3cH5MHCSkeCSTFREWtuncO9AwnJ9?=
 =?us-ascii?Q?rXIu5dbvuItLOK3SJ5FvSv0YbfairXY2+fWAVefOyFVFViMzIwwkJwM40/hh?=
 =?us-ascii?Q?Yykp7BTuR3OnH0RIBFeeFEGcxXAK7jxSmMm26t0KDVc9iTx0bRwdBdFVRUKu?=
 =?us-ascii?Q?SOjMGFvsMtLSiPBNm23hfVELxRQ8T+ncjELj/tnq3RLqMmFTOftSeuLiST1b?=
 =?us-ascii?Q?AJag6p1gab1E+yeHONg5VqfhwNB9RcKYK69UDW1QmXhgNDeENv3migahRWYk?=
 =?us-ascii?Q?Vub0Zx3N4uW727nbLPkz+GEINmS2QX9a8oe+hrCI+giNH7izyWIZ0Pb9pKLB?=
 =?us-ascii?Q?a0CXM8fpL9YABoiiao3M6UnA1KqmAe6oZpxYay7gWsa3bE8T4ybC7Y76db1F?=
 =?us-ascii?Q?6NFmd1/LWWCAc8AEzy7X/71IyfwCUtXO9BPG64eWHbDT6hqdvUq2qI/CVmT6?=
 =?us-ascii?Q?Zh1Z0iypk+VEJyAMN6dCZ65IdImZYtg9M91f97DjNUDnQaBJazRy7SrBsBP5?=
 =?us-ascii?Q?4bbRkT0VSqZL7XNeA5NaLZfdzTOi2K4/oAnmG5a093j6xpxOhbsPgxS1M02g?=
 =?us-ascii?Q?SBrkdU1PsNCKX25yFK05xHbOOYLKAJvd0zKgjZ1yWVKoHGx+rdTPR+nR/3pU?=
 =?us-ascii?Q?8FR7jiE+J9HjaQydP91ZtaXcqa1v+TfFWOa5uVrw3nC+mTmsOD2807//8gl+?=
 =?us-ascii?Q?3jGdFXnn5PeNXGYEC8VRS+tl3CsE8v5UteBTZKCYuelRdUEN1edx3689g/MG?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1210ccdd-112d-44d0-e57b-08dcc0992ac2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 21:52:06.1767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nPweXiqKgvYGm7YtjYPdDoNWGzTZ2PonAuWyj9YNrlRG2tOyBLx/bk3WCpFOn6l8VYZAPD4i+Kiaq+4hnO3elpzWf74zjVjP5dvNY/hZSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5826
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

On Fri, Aug 09, 2024 at 06:51:54PM GMT, Michal Wajdeczko wrote:
>The KUNIT_STATIC_STUB_REDIRECT() allows to redirect function call but will
>work only if the caller is in a KUnit context. To allow implementation of
>the more complex test cases, add helpers that allow calling stubs also out
>of a KUnit context.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_test.h | 74 ++++++++++++++++++++++++++++++
> 1 file changed, 74 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_test.h b/drivers/gpu/drm/xe/tests/xe_test.h
>index b8fa409ce2b1..ffa8fa6c96f0 100644
>--- a/drivers/gpu/drm/xe/tests/xe_test.h
>+++ b/drivers/gpu/drm/xe/tests/xe_test.h
>@@ -54,11 +54,85 @@ xe_cur_kunit_priv(enum xe_test_priv_id id)
> 	return priv->id == id ? priv : NULL;
> }
>
>+/**
>+ * XE_TEST_REDIRECT() - Call a function stub if one exists.
>+ * @stub: The pointer to the function stub
>+ * @args: All of the arguments passed to this stub
>+ *
>+ * This is a function prologue which is used to allow calls to the current
>+ * function to be redirected if a KUnit is running. If the stub is NULL or
>+ * the KUnit is not running the function will continue execution as normal.
>+ *
>+ * Unlikely the KUNIT_STATIC_STUB_REDIRECT(), this redirection will work
>+ * even if the caller is not in a KUnit context (like a worker thread).
>+ *
>+ * Example:
>+ *
>+ * .. code-block:: c
>+ *
>+ *	int (*stub)(int n);
>+ *
>+ *	int real_func(int n)
>+ *	{
>+ *		XE_TEST_REDIRECT(stub, n);
>+ *		return n + 1;
>+ *	}
>+ *
>+ *	int replacement_func(int n)
>+ *	{
>+ *		return n + 100;
>+ *	}
>+ *
>+ *	void example_test(struct kunit *test)
>+ *	{
>+ *		stub = replacement_func;
>+ *		KUNIT_EXPECT_EQ(test, real_func(1), 101);
>+ *		KUNIT_EXPECT_EQ(test, real_func(1), 101);
>+ *	}
>+ */
>+#define XE_TEST_REDIRECT(stub, args...)							\

this seems another one that should rather be in the kunit layer, not in
xe

>+do {											\
>+	typeof(stub) replacement = (stub);						\
>+	if (XE_TEST_RUNNING()) {							\
>+		if (unlikely(replacement)) {						\
>+			pr_info(KUNIT_SUBTEST_INDENT "# %s: calling stub %ps\n",	\
>+				__func__, replacement);					\

KUNIT_STATIC_STUB_REDIRECT() silently calls the stub without pr_info().
Why does this version need to be extra-verbose?

Lucas De Marchi


>+			return replacement(args);					\
>+		}									\
>+	}										\
>+} while (0)
>+
>+static inline void __nullify_pointer(void *data)
>+{
>+	void **ptr = data;
>+
>+	*ptr = NULL;
>+}
>+
>+/**
>+ * XE_TEST_ACTIVATE_STUB() - Setup a function stub.
>+ * @test: Test case that wants to setup a function stub
>+ * @stub: The function stub pointer
>+ * @replacement: The replacement function
>+ *
>+ * This helper setups a function stub with the replacement function.
>+ * It will also automatically restore stub to NULL at the test end.
>+ */
>+#define XE_TEST_ACTIVATE_STUB(test, stub, replacement)	({					\
>+	typeof(test) __test = (test);								\
>+	typeof(stub) *__ptr = &(stub);								\
>+	typecheck_pointer(*__ptr);								\
>+	*__ptr = (replacement);									\
>+	kunit_info(__test, "activated stub %s with %ps\n", __stringify(stub), *__ptr);		\
>+	kunit_add_action_or_reset(__test, __nullify_pointer, __ptr);				\
>+})
>+
> #else /* if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST) */
>
> #define XE_TEST_DECLARE(x)
> #define XE_TEST_ONLY(x) 0
> #define XE_TEST_RUNNING() false
>+#define XE_TEST_REDIRECT(...) do { } while (0)
>
> #define xe_cur_kunit_priv(_id) NULL
>
>-- 
>2.43.0
>
