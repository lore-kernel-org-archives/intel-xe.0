Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1700ED3A679
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 17:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC4310E392;
	Tue, 29 Oct 2024 17:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPOaQU2d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2903610E392
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730224725; x=1761760725;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=++lz2DMfAIeRp+MX711b4TQ/X/pPq1035lX30CGCSOE=;
 b=QPOaQU2dpND2fdP6kAvgy1Z4AeJJYyvm3NyHouxcy63WTsxgWVGchwMT
 brBz55MEj+iYuDgpiUGyJMTnfaXRGsl/WbJF+xNJY21LjOaTjIiGEzXdu
 epDixRiAox2rxt96ptNm8D3rdwXhiLXlGhOB1IHY5beHE0X1J7Axq7A6R
 9dP2LJL2TqnfHerc8/UvXyRT7OXNdmMpOjQwCB7QOu4cUwnXtlW+cVZ6a
 8Xb1fD1aVLSNl1RZKN5hPhbEnbx/LHFB0/4eft8SEHC0iEOnQo06KvE72
 IdGjCdNH+MORELdxaxaKIslDfRvoQRTQ17Xmz3s+9BzFwZXySX5PMstLb g==;
X-CSE-ConnectionGUID: XtZej3nRRM2eDqTdNyNatw==
X-CSE-MsgGUID: 9WHTRqqxS4issU/1dhYqCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="55292851"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="55292851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 10:58:44 -0700
X-CSE-ConnectionGUID: iUUBJznpSZ+e8/dSCckk3w==
X-CSE-MsgGUID: ySDvW5/RTSiBd2dtLgOA2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="81598377"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 10:58:44 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 10:58:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 10:58:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 10:58:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJmRQcr8KLT9iCLJiTDhIY3M6DWX5YOilnpRYbpSbIbgGW+rjW1j7PnC+Y6i12UdnOyRHdohNEP8eOYhsoH/VOgm9ORTmfy6c+8zblgxlyNcRA5/VpzZqQU2ifBV05aWc9PahuXpmSVIsr3eTvIl3l7ATvupaFXpou+Gz3pKjclwvhnqPUm+UE1mXiVOf4paNsEjrenCTa+KY76yDW+XKJ1d5t8PfXemLp18vizQSpRxHXTplqJbNQeVkALMZzCHwU21Kk7BME1cCx4Flz2h3D3OSwmMSnICrA79aKkoKu8y+UNxi1EUzQVd4/9ZRJHzS8JRHeFYVcnvPMUCHyTCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1puNnGoULWfRE93Kye8txPqh8J5OfTtmWfBgO4LoRD4=;
 b=OUftIieddY9Yzsr2i1YvzQ3sLkxIys1DN9+X6cWqcTM9Bzm43lJYwk73AyUGrgOasNJyDPm01FaGfRG5I1l2epIulmIakS6lOWHkMR87gUsELJgW3C0qQ5GsEWQgh/OnStb+PAx7EXS2cp2VrJl9GBg/tdSvwWr0pRDB5YpQQozN+AkBvgdLN/Bq5a3DCWQcQYMsZj1yVIn4E0r9eu/jFjoQN4yXq9HcOPZPLLotkKbOHrUwjdBY3ZKTCmKXe6OBtC/SoNG4u0ZGTYXME7ACi3AzCVnjZ2g+jWwE6V7YsPMX+atm+kJVodzaTbzR9foapwjVm37CGrgQAzg/kv2J3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Tue, 29 Oct
 2024 17:58:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 17:58:40 +0000
Date: Tue, 29 Oct 2024 12:58:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Message-ID: <miao7b7igj35dgaaqea2li7vc722gxwjslnqklwqf34zavtsb6@dhj4cxfpmyoo>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
 <Zx/1BZ93nLSC1pFs@orsosgc001>
 <zdjmy5xxglhenvw72jto4oajnkuczyuetp2nnrgkfat77vhmnx@xq6fthganhf7>
 <ZyEbAH60kKHDyA/m@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZyEbAH60kKHDyA/m@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:303:8e::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: c84ef4f9-9182-4d22-f5b3-08dcf843523e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ROFsUfYklWvPqVGuB59uXpmT3Uztjd1rNkMYXdMmSrrpPpVPM+iZE5zMSgGn?=
 =?us-ascii?Q?OkLy0RMxr4iLxrbNDD35tAPxVyNE5maX/SP/Rkew4h5WCyGEvcszpe4L/MaV?=
 =?us-ascii?Q?8ElTwQJ37/0bOscCbSVstzXhXy2hPPHqtYojA8y5i9Q6JfIxvx6o6rRGYNiu?=
 =?us-ascii?Q?hzUZouUJ05BX5Z5RloAUgE7dvHDPTSirdDUCxUuRq1sAzXIIl+RuFw7zemHk?=
 =?us-ascii?Q?N6KXUiIzHo4nJDDI1ZlyMSceKxyzI+leFtlwa06bsB1UDq9No5+hSMtJDNXT?=
 =?us-ascii?Q?RyQDaahNqoZpyJeE+YioPhQSFHIPdIWUj3FdYoH/zWJVNr8t6GF+iU5wkWDh?=
 =?us-ascii?Q?PVZssk6MCqwvZPEBIqCGaVTWWQHti00RZH5kG8O/7bhdPq9R36LgLwjJxGa2?=
 =?us-ascii?Q?squRWe1elLpfhKfqP0pDYgFyhEqW+U9fC7EOAJOCcg6ls7oyr767xy8I/zjV?=
 =?us-ascii?Q?FXy4nuINIEANLBeHZ5IqlKReoNmysSFnOarBZowPznIHDbrJQRXOCMdDOx+L?=
 =?us-ascii?Q?zAToV2c1bG1ujNn35ZauqJlEriCbUJDZ9aNE2WO1ZTAnldmf415YFvPlF/EU?=
 =?us-ascii?Q?YkXBTB0baHRBkGQMooCAJmsgRvlkQ3sDyTirxyHZf5/t5fiNZE29mKM9pCN2?=
 =?us-ascii?Q?JmhJ9qG0lPOKC34ySrLTwEnHF8Vp6c7Gv78AttNUl6qvrusDEQC/2uK0/l98?=
 =?us-ascii?Q?d+k38zHlSpmPmFDnKcvqjKhd+P7rxLrJ5sicrG9BmZxXQGLaol6tsRgRrOtG?=
 =?us-ascii?Q?MTTpbjt4DYJu+5AnUZEcukPNCwGFhjP4hxDqcMxQz4VvX9r/7HNmn8P/p+W7?=
 =?us-ascii?Q?/6j4KYDwh9lwtJlx2Va7anjd7YTGOIO87zshL1K4L9EHHErKQx7QipgV9eBw?=
 =?us-ascii?Q?I/8VDu5Cijd/L5zhHlpAPleTmherthTnICJxnG5z2Chl4Igo+cxQ3XnsMUOZ?=
 =?us-ascii?Q?cv8K1GGfs/tUQEurjkiafuL8rASXBTLbXG/QB+r/i6X0RmYmziUBfvz5fnnO?=
 =?us-ascii?Q?SIb8e36jmpNDzYEvfFlMDvxa0dGzrIy+/YG93KRWGB3VFn30RXNE2U54CGAV?=
 =?us-ascii?Q?nFJzSmj4jhur9qIE8nBfGmINIn0D/ehSIcU0OQUnrOp0H/ebsW++nXWgX2Pv?=
 =?us-ascii?Q?HAQMQz8XhK530GAzKpLPY8S04hFSyrq93bFTqye27GJOMaDxXcAZ+9Xil/yk?=
 =?us-ascii?Q?BT6S4K8AH9NYkn0LKAzlZaB76vsiLvOsj2xeJoceGAMEJLSwJycs0MOiMwqr?=
 =?us-ascii?Q?B2IWKCmM49xKQJnWO9fx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H7AkWupPMlc4CwmwUf0nn8dD2+NCVOxDXA5rn5CIP5pJIPCVNfcwHcmDU7Tt?=
 =?us-ascii?Q?Tl89CD7eW1u2xG4TL60z2aPHS+NL5WA63zsdQRP6gkeLXMDo6PE+LsjlMMN0?=
 =?us-ascii?Q?+WJp1y7V6cDlKGXmsda0oAIY5kWMu3jf6mkl2iaJZi+E++sVIKNyMm75EMLW?=
 =?us-ascii?Q?kt0Rvc2i+qt0ZYReiV0LwrlCX1tsGYsdW6G9C0cROdwk6/sES1DNCneSmKKb?=
 =?us-ascii?Q?NuV3U2HYus6ukfE5FzIfwBQiQ9Z8OOIioUkYL0SyEaEbJoJ6rrv9ZKTVK5Xz?=
 =?us-ascii?Q?RS5LHoTyfWfDXD3/pzd2bqF7HUIydb8Tm3ZMBbLk/Po8KG8EYFQU3D7c6Gzg?=
 =?us-ascii?Q?gSPqngvcbkqJQEb8TU69Owmz/TNM72jxwK3hTtt6f+pC9Zm0j1uCIvZqpViv?=
 =?us-ascii?Q?qxyK1SYep+3ldfDMTjqanudm0F+RFRNeuTazEU6nuMmooFchZEqcm8SqnGG2?=
 =?us-ascii?Q?6aCRRYGhb3EXIxuJJZ/0MOUdjk3rIfNBF7cdE6BtM8gyjxjV2UgiPHzNnKpg?=
 =?us-ascii?Q?gk8AESWq/1Rw4j/uQ0UNkLlfLNyp/ANOTKjYSq1yALJMjNgKtefQfaT4V7CI?=
 =?us-ascii?Q?6BNeU+pZc9fJ55csHFhYL5wOXTGQkf6m4f3GkHj7LsZyVtYMfSUP+om6Gs2m?=
 =?us-ascii?Q?YJlk/b7T8d/pByjoiQEPZ9Nh+3oAa6T/bVa2yq98oxaL0nQXPPDkWslC1dMi?=
 =?us-ascii?Q?HUb+h5zD5AoKoKl3+yLpNjm5AOTiTgTrOwDnqTe8x75CT1D7vrr3mvH+MXqS?=
 =?us-ascii?Q?sy492TKA1Gxtr5Q2zFb8f9VObtLCTwsF5821suAENvCdO/Ssr39z5rLRLoM9?=
 =?us-ascii?Q?VOj5h5XsagNW4SmGIDA6mD6aFxw6bOG5zrRpQdyKN0foISPw9L7Ug8Xd5JuD?=
 =?us-ascii?Q?O4hkzt/GWUO6pimqu4kkFc8eulAPOABa1b+VvEDxEWJHgkJcVbOJvppsCgVP?=
 =?us-ascii?Q?A8vd1NZu6I8XO5Slg8Huw/My8enwi/tP1eEtehNtXoGxBQJkApU/SDq+UqzJ?=
 =?us-ascii?Q?EDIwDI+1p5BPcQ1qM/Ya2f12uc67a3+v5psMzXarU138HCELdYuDjVO6btv1?=
 =?us-ascii?Q?MEsNJJWr2unIIWB4QF6xoTy2iElai9UYKksg5/gVCH15Fbc1jZEcAq/lUqjX?=
 =?us-ascii?Q?fxpIAzEir+SVqvgARSGHWPcbE0VA8xGcxJuABCiSWOwdhShUFAhbR/ZRM/hd?=
 =?us-ascii?Q?DpWZwhEnOJJY0HguVdpSatCft7HRFirkxPqbz/mndkgcyC4F6rQJe9srM7lR?=
 =?us-ascii?Q?MflKEUrU/7Cz4e7otfeMPhUeRTLiiIlH1W96ELyfamvy7qEXoXzERKJx/PI9?=
 =?us-ascii?Q?G8skCAwz79qR8zDvSGrHmR65NGRgSlOk3OjDrpNpY7d+Uo/PvmM1YRVM+zSK?=
 =?us-ascii?Q?fhhEufSz8Ht1BWJ1rMvnHtY1kJywb01Q3oUa3XL6kwXOIrUKdamD4y+8cSia?=
 =?us-ascii?Q?EJ88LDGBXK49BhCh1P1c4I1T0Lp1yPep/ElJJDnHmY9BeOSpSkGctvueMgjG?=
 =?us-ascii?Q?/frRZm6V51vCO509bNIus0JAknCqIUMXz1Gxd1Euu4zQc4NQ1ecfIWzM6G7m?=
 =?us-ascii?Q?DGL5hcgYyzJPw8DyqhSA1abfwHRhg39JzLLd7lvTdHQQQF+fMuVbi6K/A/QO?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c84ef4f9-9182-4d22-f5b3-08dcf843523e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 17:58:40.9030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43N4czYtrIAwmQhklwpR10E54mtr/l8hqUykLzO82D8JM/Q7EoSRAhO43oB+//BXoJZg1oEuV06H69HmSKpZ1NGZ20smx8FMz/Do3vzf6FU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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

On Tue, Oct 29, 2024 at 10:27:28AM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Oct 28, 2024 at 05:32:03PM -0500, Lucas De Marchi wrote:
>>On Mon, Oct 28, 2024 at 01:33:09PM -0700, Umesh Nerlige Ramappa wrote:
>>>On Sat, Oct 26, 2024 at 12:08:47PM -0500, Lucas De Marchi wrote:
>>>>When the exec queue is destroyed, there's a race between a query to the
>>>>fdinfo and the exec queue value being updated: after the destroy ioctl,
>>>>if the fdinfo is queried before a call to guc_exec_queue_free_job(),
>>>>the wrong utilization is reported: it's not accumulated on the query
>>>>since the queue was removed from the array, and the value wasn't updated
>>>>yet by the free_job().
>>>>
>>>>Explicitly accumulate the engine utilization so the right value is
>>>>visible after the ioctl return.
>>>>
>>>>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
>>>>Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>---
>>>>drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++++
>>>>1 file changed, 8 insertions(+)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>index d098d2dd1b2d..b15ca84b2422 100644
>>>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>++ b/drivers/gpu/drm/xe/xe_exec_quee.c
>>>>@@ -829,6 +829,14 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>>>
>>>>	xe_exec_queue_kill(q);
>>>>
>>>>+	/*
>>>>+	 * After killing and destroying the exec queue, make sure userspace has
>>>>+	 * an updated view of the run ticks, regardless if this was the last
>>>>+	 * ref: since the exec queue is removed from xef->exec_queue.xa, a
>>>>+	 * query to fdinfo after this returns could not account for this load.
>>>>+	 */
>>>>+	xe_exec_queue_update_run_ticks(q);
>>>>+
>>>
>>>At this point we may/may-not have the updated LRC timestamp.
>>>
>>>fwiu, xe_exec_queue_kill() is an async call. It will queue a work 
>>>that will disable guc scheduling on the context. Once guc notifies 
>>>KMD that scheduling is disabled on this context, KMD knows for 
>>>sure that the context has switched out and the lrc timestamp is 
>>>updated for this
>>
>>ok. do you know what's that notification? Is it the cleanup that we
>>process at __guc_exec_queue_process_msg_cleanup() ?  (which is where I'm
>>moving the io read to in the other patch)
>>
>>>context. It may work well for contexts that switch frequently and 
>>>may not work for contexts that seldom switch or never destroy 
>>>their exec queue.
>>
>>why does it matter? it's only for contexts going away - for context that
>>are scheduled out the sampling on fdinfo read covers it. Note that this
>>call is not replacing other calls. If the exec queue is not destroyed,
>>the other 2 places should still cover it.
>>
>>The problem with the case when the destroy ioctl is called is that q is
>>removed from xef->exec_queue.xa, so the additional call in fdinfo-read stops
>>working. It  then relies on the last job completing and being released before
>>a read on the fdinfo. As CI shows, this is racy and fails in ~10% of
>>the cases.
>>
>>On a remote system I got it was failing ~20% of the time
>>
>>>
>>>I still believe calling it from job free is the right thing to do. 
>>>As for the ~120 Hz updates, these are just memory updates, so not 
>>>sure if it's a huge performance impact.
>>
>>it seems now you are commenting on the change in the other patch?
>
>sorry, I will try to be more clear here.
>
>patch 3/3:
>
>I missed the fact that the updates could be in VRAM, so moving the 
>update out of job_free makes sense.
>
>Also since fdinfo query is expected to be frequent enough, adding the 
>update to exec_queue_fini makes sense too.
>
>patch 2/3 (everything below)
>
>it's just the update in destroy_ioctl that I am not convinced about 
>since the kill is async. Also you see another instance of failure 
>already below.
>
>>
>>I think it's pretty pointless to do the io access when nobody cares
>>about that number. The user needs to be reading the fdinfo, probably
>>through gputop or the like for the number to be meaningful. So why do we
>>care about sampling it at a high frequency when nobody is looking? For
>>real, non-CI use-cases it should be as good as before.  The difference
>>is that instead of getting 120 updates of few cycles, we are getting
>>just 1 with the amount of cycles that got used in the last sampling
>>period.
>>
>>Looking at the traces we do get a few low-msec execution time for
>>xe_lrc_update_timestamp(). Mind you, there's another race about updating
>>u32 in xef in a non-atomic way and doing it that frequently just makes
>>it more likely to happen. That still needs a separate fix.
>>
>>Goal of this series is to make this work:
>>
>>	$ for ((i=0; i < 100; i++)); do echo $i/100 >&2; if ! ./build/tests/xe_drm_fdinfo; then break; fi; done
>>
>>I was happy when sending this that it passed. But just double checking
>>on another host, the issue is still there and I get this after 16
>>iterations:
>>
>>Starting subtest: utilization-single-full-load-destroy-queue
>>....
>>(xe_drm_fdinfo:5997) DEBUG: vcs: spinner ended (timestamp=4818209)
>>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 1: cycles 9637999, total_cycles 19272820538
>>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 2: cycles 9637999, total_cycles 19277703269
>>(xe_drm_fdinfo:5997) DEBUG: vcs: percent: 0.000000
>>(xe_drm_fdinfo:5997) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:527:
>>(xe_drm_fdinfo:5997) CRITICAL: Failed assertion: 95.0 < percent
>>(xe_drm_fdinfo:5997) CRITICAL: error: 95.000000 >= 0.000000
>>(xe_drm_fdinfo:5997) igt_core-INFO: Stack trace:
>>(xe_drm_fdinfo:5997) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>(xe_drm_fdinfo:5997) igt_core-INFO:   #1 [check_results+0x204]
>>(xe_drm_fdinfo:5997) igt_core-INFO:   #2 ../tests/intel/xe_drm_fdinfo.c:860 __igt_unique____real_main806()
>>(xe_drm_fdinfo:5997) igt_core-INFO:   #3 ../tests/intel/xe_drm_fdinfo.c:806 main()
>>(xe_drm_fdinfo:5997) igt_core-INFO:   #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>>(xe_drm_fdinfo:5997) igt_core-INFO:   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>(xe_drm_fdinfo:5997) igt_core-INFO:   #6 [_start+0x25]
>>****  END  ****
>>
>>which makes me think it's probably related to the kill being async as
>>you mentioned.
>>
>>I wonder if we should synchronize the call in the fdinfo read with the
>>queues that are going away.
>
>Hmm, maybe.

doing that it passes for me 62/100 running all
xe_drm_fdinfo@utilization-* tests.

The failure on run 63 is different  and I think it's another bug or
race. This is what I'm testing with currently:

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a3e777ad281e3..eaee19efeadce 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -614,6 +614,11 @@ struct xe_file {
                  * does things while being held.
                  */
                 struct mutex lock;
+               /**
+                * @exec_queue.pending_removal: items pending to be removed to
+                * synchronize GPU state update with ongoing query.
+                */
+               atomic_t pending_removal;
         } exec_queue;
  
         /** @run_ticks: hw engine class run time in ticks for this drm client */
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index a9b0d640b2581..5f6347d12eec5 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -327,6 +327,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
         if (!read_total_gpu_timestamp(xe, &gpu_timestamp))
                 goto fail_gpu_timestamp;
  
+       /*
+        * Wait for any exec queue going away: their cycles will get updated on
+        * context switch out, so wait for that to happen
+        */
+        wait_var_event(&xef->exec_queue.pending_removal,
+                       !atomic_read(&xef->exec_queue.pending_removal));
+
         xe_pm_runtime_put(xe);
  
         for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fd0f3b3c9101d..58dd35beb15ad 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -262,8 +262,11 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
  
         /*
          * Before releasing our ref to lrc and xef, accumulate our run ticks
+        * and wakeup any waiters.
          */
         xe_exec_queue_update_run_ticks(q);
+       if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
+               wake_up_var(&q->xef->exec_queue.pending_removal);
  
         for (i = 0; i < q->width; ++i)
                 xe_lrc_put(q->lrc[i]);
@@ -824,6 +827,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
                 return -EINVAL;
  
+       atomic_inc(&xef->exec_queue.pending_removal);
         mutex_lock(&xef->exec_queue.lock);
         q = xa_erase(&xef->exec_queue.xa, args->exec_queue_id);
         mutex_unlock(&xef->exec_queue.lock);


Idea is that any process reading the fdinfo needs to wait on contexts
going away via kill.


>
>I was of the opinion that we should solve it in Xe by adding an update 
>call in an additional place (like you are doing), but after digging 
>into it a bit, I am not sure if we should resolve this specific issue. 
>Instead, we should alter the test to not check for accuracy when the 
>queue is destroyed before taking the second sample. We know that the 
>ticks will get updated at some reasonable point in future and the user 
>will see it in subsequent fdinfo queries anyways. If that "reasonable 
>point in future" is unacceptably large, then I think the problem is 
>outside the PCEU domain.
>
>Note that the original reason we added the test was to catch the ref 
>count issue with xef object (which is now fixed).
>
>>
>>Another thought I had was to use the wabb, but afaics we can only
>>execute something on context restore, not on context save.
>
>I am curious what you want to run in context save though and how it's 
>any different from what's happening now - CTX_TIMESTAMP is being 
>updated on save.

I was thinking about letting the gpu use MI_MATH to keep calculating
the delta.... but yeah, it wouldn't help in this particular case.


>
>>
>>>
>>>If the ftrace is getting filed up, we could throttle that.
>>
>>oh no, that is definitely not what I want. If we enable the tracepoint, we
>>want to see it, not artifically drop the events.
>>
>>Initially (and to get a good measure of function runtime), I was
>>actually using retsnoop rather than using the previously non-existent
>>tracepoint:
>>
>>	retsnoop -e xe_lrc_update_timestamp -e xe_lrc_create -e xe_lrc_destroy  -S -A -C args.fmt-max-arg-width=0
>
>Didn't know that. That's ^ useful.

life saver - I keep forgetting options for the other tools to do similar
stuff, but this one is so simple and effective.

Lucas De Marchi

>
>Thanks,
>Umesh
>>
>>Lucas De Marchi
>>
>>>
>>>Thanks,
>>>Umesh
>>>
>>>>	trace_xe_exec_queue_close(q);
>>>>	xe_exec_queue_put(q);
>>>>
>>>>-- 
>>>>2.47.0
>>>>
