Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394DBC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 20:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE08110E924;
	Mon, 13 May 2024 20:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/4eFYnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B83910E924
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 20:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715630617; x=1747166617;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=g7Cu3CH1dGOIPAv6oor8sK+mwsDR8maY0uf5P3zqOyc=;
 b=b/4eFYnBOFb0mkvyHF8oKvl24kucAShc8lRd40DdxWz6rjkSzr3XZRZr
 SqRqJ81uTuYG1xRnNSk37UZW9IrjR+RVBNqVvtknkIpw3xXD/rVQwSHm6
 0PHkUinkC6HBDEg+jvYCcaOwyPNHZ8tcOQmDduPtWN0f1phrMmBTI6KHR
 145xeQXZg4BdThTBycc0GJT0agm/qNYAx7of4q0LR1QZjgrUGsjYGElgp
 WwdnqD+6KAlgXcA5NMSgg5lj06ScFpStxF33TSN4jtsJgnG14IrNC7gID
 z/XlSpaGWTJZGfxphhq8Ga6jxLgkqDi6BiPaIfZ9qBvKkM14tlIQaV9iL Q==;
X-CSE-ConnectionGUID: qEi53Q+lRTOCQXMr8Tba6Q==
X-CSE-MsgGUID: +jeSy25UQZu2/vJawUsZeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="29075999"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="29075999"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 13:03:36 -0700
X-CSE-ConnectionGUID: IY/NQGBXSgOprSuh1LoeTQ==
X-CSE-MsgGUID: tmso1hyaSYWoDwCVrHbCRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="67915027"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 13:03:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 13:03:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 13:03:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 13:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPtdz3a3DfoqKAkFgkcSz7A10GWxKj6M6nx/3XirdcFkY48DdfrwWFxDU1BrvPPeeUqxpIZvDXK+gjcqOgJAB9bgIhFTOKfGAJIBGxGl8sT7mg8pS31RV3XkgoDzUJgFVkgINv8rM+WI29w+N9lGTzXkO5ATO4zriVd8f9idpRrj9MlOlm8heeXlMdAZw+irc5YzL1jt1OUe7oUvnvu6qTgmSFDgiqIEGfRp1tZUBLdhEdbe2rFv8jSXU3A1PzYgbUOHw0+gvSO52j+jQry8qQoYnRnP6weUprxNZxlxBgvqHGmlRQht0YXuOz76mE4ctsffLPHcORJ0aNPfvwgfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68uHldcDKQvbAH07fsT/BldVFUI7rinK4jiDpmtcN4A=;
 b=IczKjg0UdxV/JSibeju+It/YWaPFEN2PrCbpV0PfzRwErb8bGtTpyz9kH43SzduhoQBbD4fLLydbm5/82KnbvbpneWQOurMykFe1KDe73B1zVo2hzVuUKrFCqqNxSvb43VcCl5OtYU9B/3Lwk7NbOgnRnJwUrzZApYMBY6Tf6VtaTu1JBD3wumT206b7Sc97eW8hPlEydGwl2j8I/Ua9MZ0HiANnuh3ejvwO2O4wxqyOIxsFhpaU7qePEPPzg2RzgrKSGfUVPvKnRzEguVRf0g/FYoDMuPPbrReWrntHXifuvN3oIpSl2sYxCIvvfqqt12fLmPtnfB+7EcOiS87YoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6567.namprd11.prod.outlook.com (2603:10b6:806:252::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 20:03:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 20:03:26 +0000
Date: Mon, 13 May 2024 16:03:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLlBhdGNoX2FwcGxpZWQ6?=
 =?utf-8?Q?_failure_for_series_starting_wit?= =?utf-8?Q?h?= [i-g-t,1/5]
 tests/intel/xe_pm: Update runtime pm conditions
Message-ID: <ZkJyCsAqvaZRKAGA@intel.com>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
 <171562690261.2095830.4760834802357791232@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171562690261.2095830.4760834802357791232@8e613ede5ea5>
X-ClientProxiedBy: MW4PR04CA0311.namprd04.prod.outlook.com
 (2603:10b6:303:82::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b79438-9e08-4839-6044-08dc7387c001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AaDNNOIT3ZrC5BaoOQyXGBd5xTCBSr4SGx6DF8FebVT5F8gATFIKO64me2ZQ?=
 =?us-ascii?Q?IFFmrQ9/gwP/v097uXLm2E+psfZ6SOHHyIvFMNH18CoQyVmvnGW32FdXidhH?=
 =?us-ascii?Q?9LClbaNqpNOCk6PbtWZmUNiJ56jvSb6ljBYoZJVlxlOK5W5150jCK+oAReiH?=
 =?us-ascii?Q?bInEkd/IEaSY8VPw3XnR/tDgkNuO7FrAlFAXQOIKF/MykVw3PXRsuwIpNu+F?=
 =?us-ascii?Q?CIKT7GP2SVKmOEffvdtqnEBjNFz0onQtsCuIKdCTZlQ3n0q/8su3Jd54PpXc?=
 =?us-ascii?Q?dvAahR9uZ2sCGrULWEryW97v2GIwiZCOT9sIfaweNreUfFOWJNVa/z8Q8teI?=
 =?us-ascii?Q?bCSmwVU1KCP0xjOjxeRqlgo946G2ch0fyWTbF6Bru59o7KiXc5VVBWgXzgMh?=
 =?us-ascii?Q?6Ep+6KoEm0t8tkh2ZxZrm5btTyjuainjvjzrOhTYqhGhwZ8kzCQ4DGmLWqul?=
 =?us-ascii?Q?b8c7kPBKFf+ZADadHkU/6qZsaA0cSUdF0DdvLzP24nFXeokO2fxvDR60wcou?=
 =?us-ascii?Q?ERwOIX9dsZhIgz1tSZ01zIE+2+ocZ5cgOoAI7bNd4k27gspJd/jX7r077foe?=
 =?us-ascii?Q?DC1A/xZRvJDWmJvVgNAU6OvYzAOBihUi4i9PBzSycpjLg5fqUqZYB2tFMDr2?=
 =?us-ascii?Q?mjZl3wtSxE99bbc7e1cK/v/B2GWM5XR2yhsL4DD5FAgIZ+XwoH8oRQH/IRJ8?=
 =?us-ascii?Q?rZ/+U2WP8y27aMhHMGYUFrBAt0U4pL6CWV2eamkH0Z/IBW9k9F+XKo7hIE6j?=
 =?us-ascii?Q?RntbHiKHhYrjogxK7LPYH7WhGD04l6RYv65BNtPySHNu3BK80ZlfNoKZj6pT?=
 =?us-ascii?Q?B4BN+J5yQb2h80c5pYECRDCGQ4Rcpo/thfsZKkpsW+U5PGPfZU2IXs4gbmVn?=
 =?us-ascii?Q?sStYLOoj3HoA/TX89gUcmDiRFebtjjmjoehrGTV1oeS0Irczp8fy18kaBXXJ?=
 =?us-ascii?Q?gtriRTofLCyf9x12lPDXbacxSWP2s3j3JWhaVmCgyfINpNuAgWWUFi+UcV5B?=
 =?us-ascii?Q?5DrreM5xDQGAan6omPQjoGDt+XPkuElvHpTPNfCx39dpF4lYQRInTo+nOgWZ?=
 =?us-ascii?Q?5UncXuBse+3ygl1/J64PDERis/btse9u+pLQiG3XZpRKLvSEURaNyM8KF+6R?=
 =?us-ascii?Q?VNiqWScJawCKSw53Gz3D2MuZlYRWReQhsclZwENNi1DuEIC9yk0KxI1yBpk4?=
 =?us-ascii?Q?85/IpVIvW5l4VWOS8A7jqkNz6edYtKLxFTlHtc5LcMegxTeuhUrba5184Xk?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QHlYy+Nt+BV8suUOxYhuiPQGVDaKaD08MauMt+WOmtX+ZQOD1hheASput8YV?=
 =?us-ascii?Q?In3pyS/KnwHpclOfTk4D4kjamdvsyL0Gts3TB/kEMGrUFnvsFJqqLHGXIfFe?=
 =?us-ascii?Q?k+K/T5SlJHUo5yT7n6GbiLVobfpAsZqp4jwXJVFcaSXk0iijk0Lzt01QDZ7t?=
 =?us-ascii?Q?BmoyqmhQecA7o2f0/isDsPxRBe0l89/TfJfhGpwcCBpJcn7I2Dzcvwh4wk7H?=
 =?us-ascii?Q?grIhJl4myWW6rQo7UBC32VFZmNrnVzDggnBBluzurxGq7RnhjzZr/MrQ8Agi?=
 =?us-ascii?Q?Z96b8DHtFV3ojHAlXwuFLvYaO/VU6I/gm8hgTW+8zRYlsVHii2TouvfpLPj+?=
 =?us-ascii?Q?RbU1m4caIbfjLxVCLY6vXUzSaANrkoW9XldMkOuIwA+SkJHxuEAO7X9jubFY?=
 =?us-ascii?Q?KxgoT1wY5muZ3nxBbAZo0ney81umZ3U4LyKhNYB2B72xbQJElBf5MN2MqYRi?=
 =?us-ascii?Q?S6/L2dHfkjCAJD+9JGdQsm3SdflrmOpovsJjhpQJldwRnc+fRHo1SHLscZuz?=
 =?us-ascii?Q?4WQt3digyM9iukeEXxuZvlm0DXm2qaLV0byAamHrtV7Y5rU3pd/KHd7h7Zqr?=
 =?us-ascii?Q?vh3ta0801xAyzaoI3+nmeCUGXwmSZQlnCdv/UuMfDwlzsXjMHCN0zvR3uC48?=
 =?us-ascii?Q?cF0r6yknAol85vPHFJ1d1kw09X6KIWWuJxQZvhHW6aeFxjdEhLTpyeNj12Tz?=
 =?us-ascii?Q?Cus+7Vv5xjtKhX+nUQGcdp/xEBW/BGz7os4cOkUbZ7OAjO4pK5g372raUJqr?=
 =?us-ascii?Q?pj1Qca382G5XdoCcZtqLDvRjGvagxYbCQLHVUKKtn5Y+XPbg/5LVmJgtORCA?=
 =?us-ascii?Q?FKp8QXsVQ+mpbYzXuJJHXgzH98Ug7GoL9zF475yAdg0KSOEzbEDqKvDhdjG1?=
 =?us-ascii?Q?qMZmG19Aw8iu7yUj1iINq7DSXBvEeum2z7dnhDsY8/+rh45Z86StLjQkacqP?=
 =?us-ascii?Q?IyUN30shifLRvsJZocFN7H8Yqwg2MIVs2z+WZ/SgiTwOIi8JVT5EHGby5fee?=
 =?us-ascii?Q?wHi03fqOInrgigk52TCsLICUzkV2ck0tcynTjsLBkV1pSYAT+mMtjzb0Lsew?=
 =?us-ascii?Q?ghRgWOTrnrf71rOCu2O/KTufGBfqLMCZaJduSHw06frKRId876fuq96H9JHB?=
 =?us-ascii?Q?LEcAlMjUyjSsHHCJBVmOzcbivpWi6/BZ3mXdaf2F7mMCb1twS2tt89RevDIT?=
 =?us-ascii?Q?ofqJveU2J4gzD6QPZPjr6gshEYmKNith2MFDwKhizmZuZlPBvkPc9OsXC7e4?=
 =?us-ascii?Q?qHXzfY+4qRN0mnIb2v8Gx7w192zYGO+doj5CJdyGnLj9/0S8SImHQYK+NgSa?=
 =?us-ascii?Q?Xuxp9bI1RSMVeyjQU5h1HsX6+Vbstgkmls3uHnIa6CQr+SjtRU7zbF1wOXYY?=
 =?us-ascii?Q?tipq66nX/ASTWAS6AW/i9QaNNIS7lNXzMPwo7+kuJXZOieUNsbNUxqTxlD8m?=
 =?us-ascii?Q?qATHZVlsAqcrV9fg7uXmdEGonou5o6lPl3gy757CEHG70PXojWsPmP3r2czL?=
 =?us-ascii?Q?d9LUv8r7ACLCF7tZKoYhfkFvbABjpQd56NaJT6/PSnLlEu7s6x8faFiYcwbS?=
 =?us-ascii?Q?CL9/YqvSH38gU5W1UbfK3f8KsO2tI0heTlB4oZHi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b79438-9e08-4839-6044-08dc7387c001
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 20:03:26.1936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnN9eQoRk5aqWSadrhBnQrRSDr9B9u4ULHa1tVmCgJwPUwiW3qxhE0MxKCRiReIwhZ4+SM3hD04md1cmoi4Ryg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6567
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

On Mon, May 13, 2024 at 07:01:42PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/5] tests/intel/xe_pm: Update runtime pm conditions
> URL   : https://patchwork.freedesktop.org/series/133566/
> State : failure
> 
> == Summary ==
> 
> === Applying kernel patches on branch 'drm-tip' with base: ===
> Base commit: 3d00e04692d4 drm-tip: 2024y-05m-13d-17h-13m-55s UTC integration manifest

CI should stop trying to apply patches with subject-prefix containing "PATCH i-g-t" on a kernel tree.

> === git am output follows ===
> error: lib/igt_pm.c: does not exist in index
> error: lib/igt_pm.h: does not exist in index
> error: tests/intel/xe_pm.c: does not exist in index
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> Applying: tests/intel/xe_pm: Update runtime pm conditions
> Patch failed at 0001 tests/intel/xe_pm: Update runtime pm conditions
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> 
