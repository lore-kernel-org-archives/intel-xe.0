Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66997E9A04B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 21:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2001A10E644;
	Wed, 18 Feb 2026 21:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fm2GVMre";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F1910E318
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 21:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771449722; x=1802985722;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=03dE4Kxy0ebCJorhlBnsIk68Ywv4SxKOq92ieIxTMvQ=;
 b=fm2GVMre4lBOgfPaim5DH00kUPelBAqUhfWnL48UyUXmNc1uWj4Do8JE
 5aQVLsH7h9hNdn8mUbASueeVuNb7VJDcvCIQtkDsnAp9Pr8+FD4BwBRex
 PYBWfoI0c22MBNU+BEN1sSWJzecPHg0qVgmR0QxiDi33CH7cozFOuPEFC
 QnxuZwqaiCrQFYtjailO0Ljyf0u3CDKaNg0hawsKovYpuXE44av0Zb4h6
 PmTQJqIhuBWMru0Zd2kwxayf51MI5I6i++iiI0OFj3p0qZFPWmVQeic2d
 lGRqrKt+2Jp7vLUazGHdevEZLjZHLjwdIY+WUMZs+5aBbtJwPJnsOu1E9 A==;
X-CSE-ConnectionGUID: p6827EMPS4CVb3EjBmy21w==
X-CSE-MsgGUID: ssW2jyfAS8OYHp18Wtijqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71558199"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="71558199"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 13:22:02 -0800
X-CSE-ConnectionGUID: SUrBVpoCS+i6KWHT+oRF1g==
X-CSE-MsgGUID: Rm+nKCdcQZSBPLc0j0yCFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213404029"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 13:22:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 13:22:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 13:22:00 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 13:22:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0ASoPbioXvPzJtaHo+7JFy2SiT5iE6AQSVLkxMt2b4zbPDvKEW8D3FfMuil6T1N614X1zViGtSprTOg0Sk2rbojlg8yEn5xdsq30vA04opLOTHHYsQ3sU9aQm4RKevPJ/iXOln2vbqa4Ap1DZKniI7szonDx63Mly0lADsjx98WC1VKasojQGUSVIvko4bizlR5BQ1Hn+RiYYdKZb9qGrzlidt6pG/cX3tRW4uqH+wsMO7sZoVaFXgM3EEI4cxs2c1jGtyKM4CPnIOPE3YsRrs1idvq+ASo3j2w15ctTfLt/5qjulUEt30VaLbYlJS0L6zrePrYVlO0ewrq6fRGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLkCK+O3WfYUQ+8FYU9t1RdnGzOWdYqHO8cTMjucCnk=;
 b=JaTW3bTOfSGrb7HkTavhAfW08sTa8f5pYEJAlMj+NogVQKXqRIOmJ5elPcbFkf/lalp33PruUIo8CD3jJS2nn0CmSuwMsYidHLGASroV48CXmXmbv/UEyNAjrjMWWDcAzQHA1ePEL3fZcVFO0Pg9djIE8BuQoXrt0H3dklr53izbRX3NIY84nVjJdb74n1+CISHnLuNdNTuF4p/x1UTp/LnAvlpPmTfT9xpFLEMPSVAcogCpX8vLOtnhhDUowO/k8cWf9V//zG0ix9JEh80Q9LKpFTxjAhxn0F1GXaWYrW3YEC7jAC6bAq4kgSxKUBiJyyVpseJZ9kktvlKc+F43jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPF8B755DBFD.namprd11.prod.outlook.com (2603:10b6:518:1::d36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 21:21:58 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:58 +0000
Date: Wed, 18 Feb 2026 16:21:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 10/10] drm/xe/pf: Add documentation for vram_quota
Message-ID: <aZYtc9iUfSGEnqnp@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
 <20260218205553.3561-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260218205553.3561-11-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH3PPF8B755DBFD:EE_
X-MS-Office365-Filtering-Correlation-Id: 5125e5c8-a14b-40b6-5376-08de6f33bf70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ql0Y8oZbjmJ8yUh8ZjJR2erX0VvmMsAEDdxATzvt+JQDQ+DgxnU2egwL20?=
 =?iso-8859-1?Q?o7M8FEC2eLV3HEJCz7CnLeQv5fyHoRhq0C9DUc4+lLtm/ZjCME3965Lpd5?=
 =?iso-8859-1?Q?/dL/kiUQy+73JQ4DyoGe1l6vkqe/FMMl7qawSSsvdB1tzsIHaGH4n6TDmp?=
 =?iso-8859-1?Q?l/z5ROPx34fzwTqFl8jHyANlXdilSyUd9xsEhgk5nKdaNST430Awk7mF5B?=
 =?iso-8859-1?Q?EHQ4lygm8Yt1UmBWPyJvVRsQOS5KxOin6WdjAa+IzMU4suND4YgMRVrQ0G?=
 =?iso-8859-1?Q?k05YjZq/r5KlJFouGmS2lhouHZSP14dCz+98yVw8htTMVTzytbUwNiahEM?=
 =?iso-8859-1?Q?NSVreyr47wyJnnoY1rrBsaR4LWhtkcm0kkUwMNEn2JVvwNoXizGvfSJ0vV?=
 =?iso-8859-1?Q?ZLCdzkzHuEoeoBORXWz9EFQwZ08cDBG7EOjbAN0SeDFGO6ShobJkA/GUhV?=
 =?iso-8859-1?Q?SxFM6XnSmIqDXDBUZRW7feDWOrqzaXLPBzc4a5trW/5r7Ax9MbdkY+AIE+?=
 =?iso-8859-1?Q?s4yo/bLExKe+mGBZqthuqPPm0V609IwqBt6LrZhadI7/fzIz8kUuDRE2YO?=
 =?iso-8859-1?Q?BnFGNB7PrM5heN+tSB5a5zvMoRUFSwzk8BZyWXDHZ4GhnlSMZLPgPja+7j?=
 =?iso-8859-1?Q?hJUY+vlJiC3K5juIngbJEJlAID5XGFL0WDcaNq7ZjfldEFwzGzuqmeiPib?=
 =?iso-8859-1?Q?aCAKSEpmwu2iR/15wyZMJCpn5pe8N9NoVx8yRYKlLYMFC3z1u9xSZ94DKW?=
 =?iso-8859-1?Q?xbkhM5G7SvPmYI+XwkOrrePy5CBPyYHigHaN7nw/phcgGu1zCTZdXHzu+n?=
 =?iso-8859-1?Q?Ps1doWpffXfeGRR5uMdcGtHFSKh4wCemry4M+zbIUkGEBPmatvnuHH5jGf?=
 =?iso-8859-1?Q?EMZj2+zyXWaEJQIGd39klVzxSvE2aiMD0miJ9eVZpjJd0NFPkJ/7XVCiOW?=
 =?iso-8859-1?Q?GKBhJO7X1UrXAwaIWqMvVwfP+Srx1fTyJDM2KFI107K0MzYtsZ+wwSh07A?=
 =?iso-8859-1?Q?SLT75VwhxbIfT6DV1p0RumqPjpIDByVyD3zqwBW6MV9PuhiP6XH4CPjArT?=
 =?iso-8859-1?Q?sfzkX9y0HxxiVy259CjQG5i7l4WgwtpMg91yQSPYjwDAKnFobDoX2ZV2tc?=
 =?iso-8859-1?Q?jt9QfwsWlhuWU+zSrqxREPaISRkXtftePw+CbbpHpLdhbb5vLPi7wFC34k?=
 =?iso-8859-1?Q?HSw/v/nmLfiYW/xZ/fyVt0NXSos1JNojJU+qbREVdKTFnuuYafttxc/bVS?=
 =?iso-8859-1?Q?tcy/3KVh9LsQA8pCSMvQL482+pg2VeuFslU7VeiFZ6qWay/YkiRvYLuVUw?=
 =?iso-8859-1?Q?Pd05uFPAnr8DtI/f86YfzOphpD1rZVklYFVk69VJoT3QXkHYbrV0mhwUVJ?=
 =?iso-8859-1?Q?d+ffitg1ZCgsp0Bev1c8eHUbPSPF79SOQe06fEbOp9J8SpBJIxwa9l+Byb?=
 =?iso-8859-1?Q?aSPY27P0aPdlsqBUZ5pW0RYuRKLpWsj9dssG5j7PHh+aZGUO33W861Zs5/?=
 =?iso-8859-1?Q?+uMwyAHVQbYrF4sM2exNPttj5hkdnFlKYk0Up1lnNJZ64lrXNmhkemc8ic?=
 =?iso-8859-1?Q?u8JEulTLP2HsAM7eDkDliV4OAq3+pqqPpDDzCdNlVFM/yzJ1AqXJp+/c7c?=
 =?iso-8859-1?Q?+k3XAmnqFuZQQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pAvD+JZ9IG0JA6EozUOTQFCMAGDrxokCu4Z+NQubK5zll0deZflFiASvDW?=
 =?iso-8859-1?Q?IsGR4KJ812dUaupagQWytL0YQTSnBAilIeVa+CmyvpviSXQH10l/pA5/tw?=
 =?iso-8859-1?Q?4Oe+SNUEYkRei1BD1qtuSY+hXpGCeReob1gm7fErFawCktZYSgJ4nsZG8I?=
 =?iso-8859-1?Q?BMdEjLzGlnqDurFzpN2tYtA3oYkRbt66ywQbrE6NSxZzNuHuOQ3e7vO6D+?=
 =?iso-8859-1?Q?oLKd+/IkOBJS1bUPSsLCEqpUFtxuY3XMMEGuEqzX/11M9usI/nISx5p/h4?=
 =?iso-8859-1?Q?2BNHUBZKb9gdBmA8m6ec0duXYAO1o/6KNHoN7dOYAV5QOlmLP9BRRSMjRY?=
 =?iso-8859-1?Q?pyfnJGnP2i/SWVKtN9NQ3zWVQjim6vSU1x6gzw0Y3dP9bYt5QHrnRGVNrq?=
 =?iso-8859-1?Q?ADWhelpQ27lN12wwqDVIFlJei4lULaE2Qq5B+tZmsZd0sU+4QPHrKYYeD8?=
 =?iso-8859-1?Q?e5f5j+ylbknCQVyGvNg/xF8gFTxzO2FNzMWDwrn32hxHuzObSN+IJF68cy?=
 =?iso-8859-1?Q?cWvHrrrz+Qwa2GBx/WcEtHDtuW8PwLIZfmP0/Ab+zc56dTu9XTRaker5i3?=
 =?iso-8859-1?Q?UK09utlNEucUJbGx7ZXpa3iRMdXVcK7t+GO9BbkH5dG8Y1N0VtkyNOoIPQ?=
 =?iso-8859-1?Q?qTIDqlHteN23hPNJjLwqG21LQ+Q4x4oBidHWM1Aj4TDQq+060zBV9dj8rJ?=
 =?iso-8859-1?Q?ORcTXQLunVswWP4kD/AQjz5m4QXmsptKu0UcPsBGf30EjVTR/dHnDtCP9P?=
 =?iso-8859-1?Q?jv4qJ79rYlbtPNI7PQhrXqRPXEREXLLSbUXBZSilVN7DucJCVwlC6hBt8+?=
 =?iso-8859-1?Q?IkZJknvsPFgVT6Ug8DiPme8/9FDoRLdSkxzQIUC1ekSHJZo4HOykdo/Dwj?=
 =?iso-8859-1?Q?8Kl/n4dnuqhBxS5n70kOJAO99KuysWvV/F5asMp85r6NT0NZon0jUte/mi?=
 =?iso-8859-1?Q?v/lujXFyIOe9saY3gYMFYfVJvqdd//6ci84X8QPYrE4qEg57pqxcYW5BwB?=
 =?iso-8859-1?Q?6lCWewobrbCFCTZgCOsRKTaH03+iKfbIkfW7CsHsPaQj8s4IbciPCEvHby?=
 =?iso-8859-1?Q?lhe1T6r5WdyhuOy/xNga6n5kdMW3+XT4kKHSjCXt47WBN/J+CbUYEWDasa?=
 =?iso-8859-1?Q?LvPn9UpdDegGzKkF6gD8y12fCHOX3Jna7kD61dHx52jO/msA8ApmVP8tkL?=
 =?iso-8859-1?Q?KwOgThb2Pq95B2vAUWXwEc91gVr63qY3BH4cB6ATAhZpNUOefJjqEwxMoI?=
 =?iso-8859-1?Q?GZQb5d6QaKk2Iz+qJBLc//XYGAJD2hNQ6WTFkfHAYsE6fj68UJRH/s2Mq5?=
 =?iso-8859-1?Q?MzHlalvb7Z1dD0LdQBG5OF5NmdVzg2aEZ2QMoocVagkSU44iaZAcBUoBL3?=
 =?iso-8859-1?Q?GreacjH6y4bkIR84bq4VJC8S9+4GaezvEenbh3JArReY6SUWkDU/BvMZKI?=
 =?iso-8859-1?Q?erMm484OyGkOeTmJm70YM1WeP4mj1+buXKds2z7Jtm54GR5N/KsagH3Yi+?=
 =?iso-8859-1?Q?4iKYqsA/TMKRM2B4x43YlIRSw0CytZCCU/mUaRfw571YZ5tgPYm9Ezq5jl?=
 =?iso-8859-1?Q?EtbNZtUQQs7tNe4V4NZlcn2CokiSB54O5dXKeuOi+c1/g6RKJawJAlBe0r?=
 =?iso-8859-1?Q?nxwZetx+eqonkZYZl7fLt57stKWMvcUr91v/ynLAt70TWUa9Y6AqRgKzSy?=
 =?iso-8859-1?Q?gNGqPSbNoXob6MM48OsECcyX7k2+gaoYRWzqA8tAW5w6j61ZUHxCpCb6Y0?=
 =?iso-8859-1?Q?emEeq8b/cxJKOiQ0m2kssL3UehXrIofLIzIU/8CoOnOfGF2pHWx76pDwzN?=
 =?iso-8859-1?Q?EetlIq9bHA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5125e5c8-a14b-40b6-5376-08de6f33bf70
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:58.1266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9gEHG5xwOerSJABd3aCsZR5JX7YnXhG9cGM/Dp2RCIkBJcjz8tix+hK4lawAqZ3U8qzKkrWg4FOOZ68Dm8PQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8B755DBFD
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

On Wed, Feb 18, 2026 at 09:55:52PM +0100, Michal Wajdeczko wrote:
> Add initial documentation for recently added VRAM provisioning
> Xe driver specific SR-IOV sysfs files under device/sriov_admin.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> v2: fix typo (Piotr)

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  .../ABI/testing/sysfs-driver-intel-xe-sriov   | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> index 7f5ef9eada53..1d6eaff6882f 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> @@ -129,6 +129,37 @@ Description:
>  			-EIO if FW refuses to change the provisioning.
>  
>  
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/vram_quota
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/vram_quota
> +Date:		February 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		These files allow to perform initial VFs VRAM provisioning prior to VFs
> +		enabling or to change VFs VRAM provisioning once the VFs are enabled.
> +		Any non-zero initial VRAM provisioning will block VFs auto-provisioning.
> +		Without initial VRAM provisioning those files will show result of the
> +		VRAM auto-provisioning performed by the PF once the VFs are enabled.
> +		Once the VFs are disabled, all VRAM provisioning will be released.
> +		These files are visible only on discrete Intel Xe platforms with VRAM
> +		and are writeable only if dynamic VFs VRAM provisioning is supported.
> +
> +		.bulk_profile/vram_quota: (WO) unsigned integer
> +			The amount of the provisioned VRAM in [bytes] for each VF.
> +			Actual quota value might be aligned per HW/FW requirements.
> +
> +		profile/vram_quota: (RW) unsigned integer
> +			The amount of the provisioned VRAM in [bytes] for this VF.
> +			Actual quota value might be aligned per HW/FW requirements.
> +
> +			Default is 0 (unprovisioned).
> +
> +		Writes to these attributes may fail with errors like:
> +			-EINVAL if provided input is malformed or not recognized,
> +			-EPERM if change is not applicable on given HW/FW,
> +			-EIO if FW refuses to change the provisioning.
> +
> +
>  What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/stop
>  Date:		October 2025
>  KernelVersion:	6.19
> -- 
> 2.47.1
> 
