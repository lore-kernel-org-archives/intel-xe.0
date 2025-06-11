Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9853C71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 19:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F18210E704;
	Wed, 11 Jun 2025 19:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/s1a7YB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7073110E707
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 19:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749668543; x=1781204543;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1OMGcBGKSOoPytiVRMwmiwMKxBY+wKNzh3vpNVWaWIA=;
 b=i/s1a7YBUZbjGFcyKGtw6Tt/RftCcuRIox4PoIHkOkclpUgH+JeUS7Dc
 foiXrJUnKe415+walxY+mbw2fC4K5PFc0HJ0M6d4X5gYqTmOr+JveVnCp
 VOpFeP3NCg7V0L+LP4+SuuLOy9EGv3w/dfD87ueOPMHHwWifQwJ0i/u6T
 BENgBbU7gwepJu96Un2VwrxGsHrik68lgWpSdji9VZTH6eixvysOOXVCu
 /P+fCkrVhS8eBQMlXRrWPuGD7cHnD731LYMSIZXgRpfrN0PfGFx0CLmuh
 dvCWBwW+k97bzAeBaDZQau3hHrGNSpHkwsza25a4ieHbmRcpQrN75uUId A==;
X-CSE-ConnectionGUID: peHIdUIUQTi7XpXPXQRg/Q==
X-CSE-MsgGUID: MT32IWCESb2R6HLpnhf1mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55620101"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="55620101"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:02:23 -0700
X-CSE-ConnectionGUID: 5ovfUbcqTcKukvD1egJTqA==
X-CSE-MsgGUID: YYf74d0aTU6HrTWLvaJOlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="147769361"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:02:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 12:02:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 12:02:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 12:02:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqzml+PRfcpQ7EUA1O3lUF5DJR4Qc0cui8Ob5lfXel+s1+1CLlI4Vu0HrGLCCd2wLkX3a0KpusVZs1EQts7hky8VIAjhZILk8I1vyklxFYMDBZClXsNTzkl1zldnDTl6Z6UbmDdaTTCvrQuL/5KUEsaaJGm0xDcTUiGnrrLXy9nSWpqkVPUb2ZWIO65v57Dj8xJIRPiLKBHMhw8v4lx9c83cFxiBs5/RnbEHVLyPrlfqT6y2JPlgJXP/bUS1qTAHIqKV7HI6DqHrbkA8hUY6s4XiBJRv5lJHJ0vsNeTuCDR4S5sxXtQ2zqUhriXm057FtgadAipF3gm+GmQOuDDBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXtvXXghoLmtPKey0P5QdxhLdPbVvg3zsRgiUZ8kLH8=;
 b=usU/P3ebUJE6JHIeJ5lV2uS94ACjINzx0hCh3tdRzws7pYtfPeI6WC/4q07lqB8bkZcTeBaMqEeagxLiEdj9oFHs8cI62mS1W4dBDuvZLK/DTCALEbyJgaUzCJkEwM9LuecQnXL7Fw8rf3vrdsoC69tgVDrXOxLXVcGVkSX/kDJWri7BN4zGk3eScXaX7ooKa60a+Q3q86T8VOH6Q7LeHaM0ZKJLbo++7y7eRR2vDpRYASJWY5Lb24fC0P7dyY4iBknFcgJy/cGYOs36QaWoJ+k3bkDeXhc2hmMLdALVgE3SSJuwtKDaenN4//Pcn3kcuhizNM/54+JnOawERwWC9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Wed, 11 Jun
 2025 19:02:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 19:02:17 +0000
Date: Wed, 11 Jun 2025 12:03:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
Message-ID: <aEnTF6zsZXYsARNI@lstrano-desk.jf.intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
 <0c909f7376ab30f8260d83a74b3a908a4e6eb764.camel@intel.com>
 <aEmy8yBp0Ghssyuq@lstrano-desk.jf.intel.com>
 <7ede4886131931de5f9a672fd823d8bac3f374af.camel@intel.com>
 <aEnDbmfEVUEzmk0A@lstrano-desk.jf.intel.com>
 <c99af8b540ab40381b2bc44f78bfc634c27043b6.camel@intel.com>
 <aEnI7t5DTbcfYibp@lstrano-desk.jf.intel.com>
 <bfad428658219de07f8defb4c46b234bdd34c2dc.camel@intel.com>
 <aEnSdmCa64X1OFBP@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEnSdmCa64X1OFBP@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: DS0PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:8:191::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9a60e7-3807-4e47-6a56-08dda91a7be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?78Dg3C+WCxy9eKxrFDvHxQ+cgvpufA6HmEaiOv6o5fYwfa18ok2lQTD7/g?=
 =?iso-8859-1?Q?gc9Gw4lbnBINUREmBMJYgX4BpiTSgHYBuijuEcBCtc7Z177ac+VIg3Via/?=
 =?iso-8859-1?Q?sgQnkog2lFKOaidOoVjNzZ9WEqOHE8An1nvnwM7ynAUShUVt4h+hrX7axN?=
 =?iso-8859-1?Q?n2fIWe6GNoFTtfw1T15DJUXxgNju8QiP/xwIEOncGtU3taFBHEvGm834NN?=
 =?iso-8859-1?Q?ZMuZunTUafZllsSB+Ek0ZvPhNy8mRCauvwlt5/WnKqtaFqrbZL88woFW3D?=
 =?iso-8859-1?Q?PCmv7WtzuDO0bdbcT1Xoww6vxP+K/NHL8gFAjTQhDkCOP4IiG5wTviwRVU?=
 =?iso-8859-1?Q?LjKdIL0w+lKP7ID84kx4KamihcF8xESwfr9a2pO7ha2TdOwhq1KWp3x93X?=
 =?iso-8859-1?Q?xmWjyW+4WlxpXwrgV3RQfv4UenS+z9OgFpbA6dalhD2lYGjvcw7PS1Ld+U?=
 =?iso-8859-1?Q?5aJatM6a/KSHnR1z+rBn+sSidDVfhgthGDZVkqdZSU1ZfOrbRBHTr040W8?=
 =?iso-8859-1?Q?fJk90gNzpjJ4cV/UNLtQTn1XCEnn3Mnt6SkhhKkAe9GIU4B7yCxu7MrHJ2?=
 =?iso-8859-1?Q?MiIFc4ecgR3GZ16xi9S3r9t0bDVd0YWIZhbAtYQRc0Xo7mR12AB8PaiDPp?=
 =?iso-8859-1?Q?vOIF9RWPznRnFrjXVd5ljrqG2Qla0dS2fzzxQWnK1+/jMvtwTUcYsD9FJ3?=
 =?iso-8859-1?Q?ftbJTJDDGFvE8r8bmYYMhE3g2FMnX6QI1PXkq5S8xip8IhZXD1SQ2ixhi+?=
 =?iso-8859-1?Q?goDgaEMjBxz1M7kl+1IwVCjfC3FKgh3gCRII/716OrMqGNmK6aehukhK5p?=
 =?iso-8859-1?Q?SuIhmgTQOCP2vLe5b+OamaxT9cN2jP3J0FPFXG3OxV6w5XnabDBiBg3sUr?=
 =?iso-8859-1?Q?zjUaWckJR6tLmBRiNBp/eylxoortMUfWlaH30aIU5HAgzPZgnkpSPaArbW?=
 =?iso-8859-1?Q?nc4JtpI1VhtxM3NL0YOtP3x8giox8BlC1aR50vULBrO2QjlpqsM/ljULs9?=
 =?iso-8859-1?Q?g87mLm+HZybAAAn1PDTEfRxTECOKsvrPNFUxPXGU2crRsTM7haxwJT+5FM?=
 =?iso-8859-1?Q?Yt0S4AjwP32cssm9wbpprw5BGROs+femja2nBPXphPhXp3btFZnh5Yh6R9?=
 =?iso-8859-1?Q?R7TaqqkQ+WrMJNCc/FiJveCLKwj0AFOKZX7qmwKp2HwT6qGT5L+iWQJ1Jz?=
 =?iso-8859-1?Q?FQVKP9ShSorgbtb775I9lkRgpRXejBcn2o54cuprw2SCr6w6OqfRsR09G+?=
 =?iso-8859-1?Q?rjtIO+eL4IU9l2vmizQ28jT8UFrfRVTbjFQLInMy3RmCo1gAw3AjW09Euo?=
 =?iso-8859-1?Q?IfJdKoPlCEH8hRByO1WkGG33ddqkZ5ivpY5BLAEi/cOWj39SJ7Qclg2wrW?=
 =?iso-8859-1?Q?QfiWrgf0ThXjNWRpFJ5L6EWzLd6g4i/phvQZQTSDqBNRnOtrwx0Nk8pbAh?=
 =?iso-8859-1?Q?IIhyb9ap0PTDBcxua7aduL09pX6MOhvYByceq/NxwJ/kuUl66W9OdHlsUa?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mAO3SrpOkDDrpARDTZe+Wv53txhwlKevRbFPyktjXh18evjapKe+yTd2zE?=
 =?iso-8859-1?Q?9BZY1XOljMt4gtFW3c1RsQAyRyP4HYlHWv0PDXnTVH6Ei+4Xu4TzbjLQ/f?=
 =?iso-8859-1?Q?MCG+NiY7D4E1IZpIZGAk4/XYT01icRUJcC0SKCPlKWAZH2loFls+vRfj3o?=
 =?iso-8859-1?Q?Fts/70fjM64D2TQE+kUTKmF1seRuDzIQqHWLW0Is/+sexQBIba7ppPdD60?=
 =?iso-8859-1?Q?2ZeoI33QOK5iaTtc+Cc/1uApGG3l4sW1QrGYS62KdNDro341OVrTiPfV6P?=
 =?iso-8859-1?Q?CZB+Yj/2eEcxeL2janqEphAvi+BwulUEyyiY06pU6/tflsEdYWLQ8TmhtR?=
 =?iso-8859-1?Q?P54jF+hYzjV9JI8teAcsiXH/1mFQtGm5yGvCesd2yvpqM3HziExpEtH0w1?=
 =?iso-8859-1?Q?udNYl1CXcr8ygRoB/Bm0SDM3jCuAhOGh621l3AbVXOiULzIuLlXqjAPwfW?=
 =?iso-8859-1?Q?GYQKFi5/aeRnLvQxj6AuVGix6xidcyxVDi/r/cVdsGgHg+LUH0ln+bqPfi?=
 =?iso-8859-1?Q?UhnIfGCOUU2xLgF6E1DvC9jZfb9v6BKTkrLglXSjS3s3yDM0CBQSWMF8F4?=
 =?iso-8859-1?Q?oGjSNtVTUnHsTL4F0ghMH5P+DO/enE/6lD6rMcQpm4qwnbYFItdLLbDCZS?=
 =?iso-8859-1?Q?HNwYqjK9MkAa8+nRRLeRgWQwWje1h/1jTOKembn9cW1yY3qg+zdBywv/2P?=
 =?iso-8859-1?Q?q9XSVnnPvjav0fW1TTvwJuQ9JpLKZIppRZdvRVYLSxPaPfQ0LbjQ56bLU8?=
 =?iso-8859-1?Q?gVcrMJDTR1ACQu2+EEiflWc750BKcJxwnIPsJXHQiK3mZW4Ha5pmVsF+vr?=
 =?iso-8859-1?Q?YGro4xq//E4cgysG6FY7uQllLrnl+SeuBc6oIOit4c84jIN10UqBAAPyOj?=
 =?iso-8859-1?Q?Rc3ZNTEkZS05t7o/gpelEIWJoH0ptore74m1MJHgAZyHn+uQASvNt+wjO3?=
 =?iso-8859-1?Q?WcDZX+H+LKonfJYOkXW0+RGe87d1Q+tWReYrIvChPaISpmbA0eFUFx+Fni?=
 =?iso-8859-1?Q?wRiH95mzTL9bNa5WeblmKXFH38gNM4VLnxwerbScYOg43GDI8Vc+MV0Xli?=
 =?iso-8859-1?Q?/RssRdH1KGghV1cvMyS7dcwR4oL9Ql+oiOaBT99iotiigPoVCz4j05kfMF?=
 =?iso-8859-1?Q?PS+xd+QmfPcneycQYnGrUWQ2VWcn1eYlSiQA2nUc3gWyYJc6RWAHgQvE9q?=
 =?iso-8859-1?Q?8fUv6l81lPNHOSD+nrdkO/1ryxf1wLGX7EZtxn4P4NbBcdvMpf+iXfOeQ5?=
 =?iso-8859-1?Q?D01KRhLfETNGuVmKb3peAsOYglwdcVlpz1ys9a0XeB81OwRtWZFZYlsGSh?=
 =?iso-8859-1?Q?PH2XYWUxEllTROxHG6YAwsLsNoRhScv3nYW67Yh1uYPBdRLF18ifLOs85E?=
 =?iso-8859-1?Q?zRuMiya/9kNfEMdSuLKX3TkYBVQlQI4c/P92T2DGyyDimwWoSe67VyCSZE?=
 =?iso-8859-1?Q?tgNoa6QpMoubFDUzHe6pnRLn4pKig7p1kTF7723rBXrtCHDA8YAgLLlSCd?=
 =?iso-8859-1?Q?rDdIVWrJW9Jz3IcY3uU3NAsEd2dsE1UYVTTOhCNQLgR3C5ntMmLTzpTL25?=
 =?iso-8859-1?Q?Wknn/SyS8BAzLnNOZelbf4aIdAb+hU2aDV0hH5SUlyyW+uv/8SzzVF054A?=
 =?iso-8859-1?Q?8v764asI9SFU+zX6pk1JBatVhLZss8cEPgBiVRtrYbfcrnB/yxa9uaOA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9a60e7-3807-4e47-6a56-08dda91a7be7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 19:02:17.1478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ln7afkBS1lq79VTreacC0JJBcAPtyEI8rPZW9Q0M98AOzWxZhvth4YLc7prgVorgiKaIJYf82ujbLHLMyWscRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
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

On Wed, Jun 11, 2025 at 12:01:10PM -0700, Matthew Brost wrote:

One correction...

> On Wed, Jun 11, 2025 at 12:23:13PM -0600, Summers, Stuart wrote:
> > On Wed, 2025-06-11 at 11:20 -0700, Matthew Brost wrote:
> > > On Wed, Jun 11, 2025 at 12:05:36PM -0600, Summers, Stuart wrote:
> > > > On Wed, 2025-06-11 at 10:57 -0700, Matthew Brost wrote:
> > > > > On Wed, Jun 11, 2025 at 11:04:06AM -0600, Summers, Stuart wrote:
> > > > > > On Wed, 2025-06-11 at 09:46 -0700, Matthew Brost wrote:
> > > > > > > On Wed, Jun 11, 2025 at 10:26:44AM -0600, Summers, Stuart
> > > > > > > wrote:
> > > > > > > > On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost wrote:
> > > > > > > > > Clearing on free should hide latency of BO clears on new
> > > > > > > > > user
> > > > > > > > > BO
> > > > > > > > > allocations.
> > > > > > > > 
> > > > > > > > Do you have any test results showing the latency
> > > > > > > > improvement
> > > > > > > > here
> > > > > > > > on
> > > > > > > > high volume submission tests? Also how does this impact at
> > > > > > > > very
> > > > > > > > large
> > > > > > > 
> > > > > > > No performance data yet available. Something we definitely
> > > > > > > should
> > > > > > > look
> > > > > > > into and would be curious about the results. FWIW, AMDGPU
> > > > > > > implements
> > > > > > > clear on free in a very similar way to this series. 
> > 
> > So back to this one, what is the motivation for this change if we don't
> > have data?
> > 
> 
> It is the assumption that in typical cases (no memory pressure) the
> buddy allocator pool can find a clean VRAM upon allocation resulting in
> immediate use of the BO rather than issuing a clear which could delay a
> bind IOCTL, an exec IOCTL, or even mmaping the BO (dma-resv enforces
> this ordering btw).
> 
> Even if there is memory pressure, it is fairly easy to reason that
> clear-on-free creates a pipeline in which the clear is started earlier
> than it would be upon allocation thus reducing the overall delay of the
> BO usage after allocation.
> 
> Yes, there might be odd corner of large clear-on-free followed by small
> allocation where it might be slightly worse, but overall it seems to be
> an easy win - both AMD / Intel have done work to make clear-on-free
> possible.
> 
> > > > > > 
> > > > > > I had a few other comments towards the end of the patch.
> > > > > > Basically
> > > > > > I
> > > > > 
> > > > > I should slow down and read... Repling to all comments here.
> > > > > 
> > > > > > think it would be nice to be able to configure this. There was
> > > > > > significant testing done here for Aurora in i915 and the
> > > > > > performance
> > > > > > benefits were potentially different based on the types of
> > > > > > workloads
> > > > > > being used. Having user hints for instance might allow us to
> > > > > > take
> > > > > > advantage of those workload specific use cases.
> > > > > > 
> > > > > 
> > > > > We can wire this mode to the uAPI for BO creation if needed -
> > > > > this
> > > > > patch
> > > > > does clear-on-free blindly for any user BO. Ofc with uAPI we need
> > > > > a
> > > > > UMD
> > > > > user to upstream. We may just want to start with this patch and
> > > > > do
> > > > > that
> > > > > in a follow up if needed as it a minor tweak from a code PoV.
> > > > 
> > > > Actually it would be great if you can add exactly this to the
> > > > commit
> > > > message. Basically we are intentionally doing clear on free here
> > > > blindly because we don't currently have a user for some kind of
> > > > more
> > > > complicated (from the user perspective) hint system. (just kind of
> > > > repeating what you said)
> > > > 
> > > > This way we have some documentation of why we chose this route
> > > > other
> > > > than just because amd is doing that.
> > > > 
> > > 
> > > Sure.
> > > 
> > > > > 
> > > > > > > 
> > > > > > > > buffer size submissions and mix of large and small buffer
> > > > > > > > submissions
> > > > > > > > with eviction between different processes?
> > > > > > > > 
> > > > > > > 
> > > > > > > Eviction somewhat orthogonal to this. If an eviction occurs
> > > > > > > and
> > > > > > > it is
> > > > > > > a
> > > > > > > new allocation a clear would still have be issued ahead
> > > > > > > handing
> > > > > > > the
> > > > > > > memory over to the new BO, if eviction occurs and paged in BO
> > > > > > > has
> > > > > > > backing store (it was previously evicted) we'd just copy the
> > > > > > > contents
> > > > > > > into the allocated memory.
> > > > > > 
> > > > > > Good point. I still think we should consider the scenarios of
> > > > > > having a
> > > > > > large buffer workload running and then clearing, then we have a
> > > > > > small
> > > > > > buffer workload coming in which now needs to wait on the clear
> > > > > > from
> > > > > > that large workload. Whereas on clear-on-alloc for the small
> > > > > > workload,
> > > > > > we can get that submission in quickly and not wait for that
> > > > > > larger
> > > > > > one.
> > > > > > 
> > > > > 
> > > > > The buddy allocator tries to allocate cleared VRAM first, then
> > > > > falls
> > > > > back to dirty VRAM. Dirty VRAM will still be cleared upon
> > > > > allocation
> > > > > in
> > > > > this patch.
> > > > > 
> > > > > The senerio you describe could result in eviction actually. If a
> > > > > large
> > > > > BO has pending clear - it won't be in either buddy allocator pool
> > > > > -
> > > > > it
> > > > > will be TTM as ghost object (pending free). If the buddy
> > > > > allocator
> > > > > fails
> > > > > an allocation, eviction is triggered with the ghost objects in
> > > > > TTM
> > > > > being
> > > > > tried to allocate first (I think, if I'm misstaing TTM internals
> > > > > my
> > > > > bad). This would as you suggest result in the BO allocation
> > > > > waiting
> > > > > on
> > > > > potentially a large clear to finish even though the allocation is
> > > > > small
> > > > > in size.
> > > > 
> > > > So we have had customers in the past who have wanted explicit
> > > > disabling
> > > > of eviction. I agree in the current implementation that might be
> > > > the
> > > 
> > > Explicitly disabling eviction is not an upstream option, downstream
> > > in
> > > i915 you can do whatever you want as there are no rules. We have
> > > discussed a pin accounting controler vis cgroups or something
> > > upstream
> > > which may be acceptable. Different discussion though.
> > > 
> > > > case, but in the future we might want such a capability, so there
> > > > is
> > > > still a chance of blocking. But again, maybe this can be a future
> > > > enhancement as you said.
> > > > 
> > > > > 
> > > > > > I don't think there is necessarily a one-size-fits-all solution
> > > > > > here
> > > > > > which is why I think the hints are important.
> > > > > > 
> > > > > 
> > > > > Jumping to new uAPI + hints immediately might not be the best
> > > > > approach,
> > > > > but as I stated this is minor thing to add if needed.
> > > > > 
> > > > > > Thanks,
> > > > > > Stuart
> > > > > > 
> > > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > > > 
> > > > > > > > > Implemented via calling xe_migrate_clear in release
> > > > > > > > > notify
> > > > > > > > > and
> > > > > > > > > updating
> > > > > > > > > iterator in xe_migrate_clear to skip cleared buddy
> > > > > > > > > blocks.
> > > > > > > > > Only
> > > > > > > > > user
> > > > > > > > > BOs
> > > > > > > > > cleared in release notify as kernel BOs could still be in
> > > > > > > > > use
> > > > > > > > > (e.g.,
> > > > > > > > > PT
> > > > > > > > > BOs need to wait for dma-resv to be idle).
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/gpu/drm/xe/xe_bo.c           | 47
> > > > > > > > > ++++++++++++++++++++++++++++
> > > > > > > > >  drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++---
> > > > > > > > >  drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> > > > > > > > >  drivers/gpu/drm/xe/xe_res_cursor.h   | 26
> > > > > > > > > +++++++++++++++
> > > > > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
> > > > > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> > > > > > > > >  6 files changed, 94 insertions(+), 5 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > index 4e39188a021a..74470f4d418d 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > @@ -1434,6 +1434,51 @@ static bool
> > > > > > > > > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object
> > > > > > > > > *ttm_bo)
> > > > > > > > >         return locked;
> > > > > > > > >  }
> > > > > > > > >  
> > > > > > > > > +static void xe_ttm_bo_release_clear(struct
> > > > > > > > > ttm_buffer_object
> > > > > > > > > *ttm_bo)
> > > > > > > > > +{
> > > > > > > > > +       struct xe_device *xe = ttm_to_xe_device(ttm_bo-
> > > > > > > > > > bdev);
> > > > > > > > > +       struct dma_fence *fence;
> > > > > > > > > +       int err, idx;
> > > > > > > > > +
> > > > > > > > > +       xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > > > > > > > > +
> > > > > > > > > +       if (ttm_bo->type != ttm_bo_type_device)
> > > > > > > > > +               return;
> > > > > > > > > +
> > > > > > > > > +       if (xe_device_wedged(xe))
> > > > > > > > > +               return;
> > > > > > > > > +
> > > > > > > > > +       if (!ttm_bo->resource ||
> > > > > > > > > !mem_type_is_vram(ttm_bo-
> > > > > > > > > > resource-
> > > > > > > > > > mem_type))
> > > > > > > > > +               return;
> > > > > > > > > +
> > > > > > > > > +       if (!drm_dev_enter(&xe->drm, &idx))
> > > > > > > > > +               return;
> > > > > > > > > +
> > > > > > > > > +       if (!xe_pm_runtime_get_if_active(xe))
> > > > > > > > > +               goto unbind;
> > > > > > > > > +
> > > > > > > > > +       err = dma_resv_reserve_fences(&ttm_bo-
> > > > > > > > > >base._resv,
> > > > > > > > > 1);
> > > > > > > > > +       if (err)
> > > > > > > > > +               goto put_pm;
> > > > > > > > > +
> > > > > > > > > +       fence = xe_migrate_clear(mem_type_to_migrate(xe,
> > > > > > > > > ttm_bo-
> > > > > > > > > > resource->mem_type),
> > > > > > > > > +                                ttm_to_xe_bo(ttm_bo),
> > > > > > > > > ttm_bo-
> > > > > > > > > > resource,
> > > > > > > > > +                               
> > > > > > > > > XE_MIGRATE_CLEAR_FLAG_FULL |
> > > > > > > > > +                               
> > > > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY);
> > > > > > > > > +       if (XE_WARN_ON(IS_ERR(fence)))
> > > > > > > > > +               goto put_pm;
> > > > > > > > > +
> > > > > > > > > +       xe_ttm_vram_mgr_resource_set_cleared(ttm_bo-
> > > > > > > > > > resource);
> > > > > > > > > +       dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > > > > > > > > +                          DMA_RESV_USAGE_KERNEL);
> > > > > > > > > +       dma_fence_put(fence);
> > > > > > > > > +
> > > > > > > > > +put_pm:
> > > > > > > > > +       xe_pm_runtime_put(xe);
> > > > > > > > > +unbind:
> > > > > > > > > +       drm_dev_exit(idx);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  static void xe_ttm_bo_release_notify(struct
> > > > > > > > > ttm_buffer_object
> > > > > > > > > *ttm_bo)
> > > > > > > > >  {
> > > > > > > > >         struct dma_resv_iter cursor;
> > > > > > > > > @@ -1478,6 +1523,8 @@ static void
> > > > > > > > > xe_ttm_bo_release_notify(struct
> > > > > > > > > ttm_buffer_object *ttm_bo)
> > > > > > > > >         }
> > > > > > > > >         dma_fence_put(replacement);
> > > > > > > > >  
> > > > > > > > > +       xe_ttm_bo_release_clear(ttm_bo);
> > > > > > > > > +
> > > > > > > > >         dma_resv_unlock(ttm_bo->base.resv);
> > > > > > > > >  }
> > > > > > > > >  
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > index 8f8e9fdfb2a8..39d7200cb366 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > > @@ -1063,7 +1063,7 @@ struct dma_fence
> > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > xe_migrate *m,
> > > > > > > > >         struct xe_gt *gt = m->tile->primary_gt;
> > > > > > > > >         struct xe_device *xe = gt_to_xe(gt);
> > > > > > > > >         bool clear_only_system_ccs = false;
> > > > > > > > > -       struct dma_fence *fence = NULL;
> > > > > > > > > +       struct dma_fence *fence = dma_fence_get_stub();
> > > > > > > > >         u64 size = bo->size;
> > > > > > > > >         struct xe_res_cursor src_it;
> > > > > > > > >         struct ttm_resource *src = dst;
> > > > > > > > > @@ -1075,10 +1075,13 @@ struct dma_fence
> > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > xe_migrate *m,
> > > > > > > > >         if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> > > > > > > > >                 clear_only_system_ccs = true;
> > > > > > > > >  
> > > > > > > > > -       if (!clear_vram)
> > > > > > > > > +       if (!clear_vram) {
> > > > > > > > >                 xe_res_first_sg(xe_bo_sg(bo), 0, bo-
> > > > > > > > > >size,
> > > > > > > > > &src_it);
> > > > > > > > > -       else
> > > > > > > > > +       } else {
> > > > > > > > >                 xe_res_first(src, 0, bo->size, &src_it);
> > > > > > > > > +               if (!(clear_flags &
> > > > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > > > > > +                       size -=
> > > > > > > > > xe_res_next_dirty(&src_it);
> > > > > > > > > +       }
> > > > > > > > >  
> > > > > > > > >         while (size) {
> > > > > > > > >                 u64 clear_L0_ofs;
> > > > > > > > > @@ -1125,6 +1128,9 @@ struct dma_fence
> > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > xe_migrate *m,
> > > > > > > > >                         emit_pte(m, bb, clear_L0_pt,
> > > > > > > > > clear_vram,
> > > > > > > > > clear_only_system_ccs,
> > > > > > > > >                                  &src_it, clear_L0, dst);
> > > > > > > > >  
> > > > > > > > > +               if (clear_vram && !(clear_flags &
> > > > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > > > > > +                       size -=
> > > > > > > > > xe_res_next_dirty(&src_it);
> > > > > > > > > +
> > > > > > > > >                 bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > > > > > > > >                 update_idx = bb->len;
> > > > > > > > >  
> > > > > > > > > @@ -1146,7 +1152,7 @@ struct dma_fence
> > > > > > > > > *xe_migrate_clear(struct
> > > > > > > > > xe_migrate *m,
> > > > > > > > >                 }
> > > > > > > > >  
> > > > > > > > >                 xe_sched_job_add_migrate_flush(job,
> > > > > > > > > flush_flags);
> > > > > > > > > -               if (!fence) {
> > > > > > > > > +               if (fence == dma_fence_get_stub()) {
> > > > > > > > >                         /*
> > > > > > > > >                          * There can't be anything
> > > > > > > > > userspace
> > > > > > > > > related
> > > > > > > > > at this
> > > > > > > > >                          * point, so we just need to
> > > > > > > > > respect
> > > > > > > > > any
> > > > > > > > > potential move
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > index fb9839c1bae0..58a7b747ef11 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > > > @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct
> > > > > > > > > xe_migrate
> > > > > > > > > *m, struct xe_bo *bo,
> > > > > > > > >  
> > > > > > > > >  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA          BIT(0)
> > > > > > > > >  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA         BIT(1)
> > > > > > > > > +#define XE_MIGRATE_CLEAR_NON_DIRTY             BIT(2)
> > > > > > > > >  #define
> > > > > > > > > XE_MIGRATE_CLEAR_FLAG_FULL     (XE_MIGRATE_CLEAR_FLAG_BO_
> > > > > > > > > DATA
> > > > > > > > > > \
> > > > > > > > >                                         XE_MIGRATE_CLEAR_
> > > > > > > > > FLAG
> > > > > > > > > _CCS
> > > > > > > > > _DAT
> > > > > > > > > A)
> > > > > > > > >  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > index d1a403cfb628..630082e809ba 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > > > @@ -315,6 +315,32 @@ static inline void
> > > > > > > > > xe_res_next(struct
> > > > > > > > > xe_res_cursor *cur, u64 size)
> > > > > > > > >         }
> > > > > > > > >  }
> > > > > > > > >  
> > > > > > > > > +/**
> > > > > > > > > + * xe_res_next_dirty - advance the cursor to next dirty
> > > > > > > > > buddy
> > > > > > > > > block
> > > > > > > > > + *
> > > > > > > > > + * @cur: the cursor to advance
> > > > > > > > > + *
> > > > > > > > > + * Move the cursor until dirty buddy block is found.
> > > > > > > > > + *
> > > > > > > > > + * Return: Number of bytes cursor has been advanced
> > > > > > > > > + */
> > > > > > > > > +static inline u64 xe_res_next_dirty(struct xe_res_cursor
> > > > > > > > > *cur)
> > > > > > > > > +{
> > > > > > > > > +       struct drm_buddy_block *block = cur->node;
> > > > > > > > > +       u64 bytes = 0;
> > > > > > > > > +
> > > > > > > > > +       XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > > > > > > > > +                  cur->mem_type != XE_PL_VRAM1);
> > > > > > > > 
> > > > > > > > What if we have more than just these two? Maybe check
> > > > > > > > against
> > > > > > > > the
> > > > > > > > mask
> > > > > > > > instead.
> > > > > 
> > > > > Sure. I think we do this test in a couple of other places in the
> > > > > driver too
> > > > > and clean this up in seperate patch first.
> > > > 
> > > > No problem, just wanted to call it out. We can do this later..
> > > > 
> > > > > 
> > > > > > > > 
> > > > > > > > > +
> > > > > > > > > +       while (cur->remaining &&
> > > > > > > > > drm_buddy_block_is_clear(block))
> > > > > > > > > {
> > > > > > > > > +               bytes += cur->size;
> > > > > > > > > +               xe_res_next(cur, cur->size);
> > > > > > > > > +               block = cur->node;
> > > > > > > > > +       }
> > > > > > > > > +
> > > > > > > > > +       return bytes;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  /**
> > > > > > > > >   * xe_res_dma - return dma address of cursor at current
> > > > > > > > > position
> > > > > > > > >   *
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > index 9e375a40aee9..120046941c1e 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > > > @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct
> > > > > > > > > ttm_resource_manager *man,
> > > > > > > > >         if (place->fpfn || lpfn != man->size >>
> > > > > > > > > PAGE_SHIFT)
> > > > > > > > >                 vres->flags |=
> > > > > > > > > DRM_BUDDY_RANGE_ALLOCATION;
> > > > > > > > >  
> > > > > > > > > +       if (tbo->type == ttm_bo_type_device)
> > > > > > > > > +               vres->flags |=
> > > > > > > > > DRM_BUDDY_CLEAR_ALLOCATION;
> > > > > > > > > +
> > > > > > > > >         if (WARN_ON(!vres->base.size)) {
> > > > > > > > >                 err = -EINVAL;
> > > > > > > > >                 goto error_fini;
> > > > > > > > > @@ -187,7 +190,7 @@ static void
> > > > > > > > > xe_ttm_vram_mgr_del(struct
> > > > > > > > > ttm_resource_manager *man,
> > > > > > > > >         struct drm_buddy *mm = &mgr->mm;
> > > > > > > > >  
> > > > > > > > >         mutex_lock(&mgr->lock);
> > > > > > > > > -       drm_buddy_free_list(mm, &vres->blocks, 0);
> > > > > > > > > +       drm_buddy_free_list(mm, &vres->blocks, vres-
> > > > > > > > > >flags);
> > > > > > > > >         mgr->visible_avail += vres->used_visible_size;
> > > > > > > > >         mutex_unlock(&mgr->lock);
> > > > > > > > >  
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > index cc76050e376d..dfc0e6890b3c 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > > > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct
> > > > > > > > > ttm_resource
> > > > > > > > > *res)
> > > > > > > > >         return container_of(res, struct
> > > > > > > > > xe_ttm_vram_mgr_resource,
> > > > > > > > > base);
> > > > > > > > >  }
> > > > > > > > >  
> > > > > > > > > +static inline void
> > > > > > > > > +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource
> > > > > > > > > *res)
> > > > > > > > > +{
> > > > > > > > > +       to_xe_ttm_vram_mgr_resource(res)->flags |=
> > > > > > > > > DRM_BUDDY_CLEARED;
> > > > > > > > 
> > > > > > > > I see the amd driver is doing the same thing here. Maybe we
> > > > > > > > can
> > > > > > > > pull
> > > > > > > > this in based on the flags given at the resource
> > > > > > > > initialization
> > > > > > > > so
> > > > > > > > we
> > > > > > > > can potentially tweak this for different scenarios (when to
> > > > > > > > free)
> > > > > > > > and
> > > > > > > > converge what we're doing here and what amd is doing into
> > > > > > > > the
> > > > > > > > common
> > > > > > > > code.
> > > > > > > > 
> > > > > 
> > > > > AMD has a flag, which is the same test in this series as 'type ==
> > > > > ttm_bo_type_device'. AMD blindly sets this flag on user BO
> > > > > creation
> > > > > but
> > > > > as I stated above we could wire this to uAPI if needed.
> > > > > 
> > > > > Also I think there are some kernel BOs which clear-on-free is
> > > > > safe
> > > > > too
> > > > > (e.g., I think only PT BOs need contents to stick around after
> > > > > final
> > > > > put
> > > > > until dma-resv is clean of fences). Would have to fully to test
> > > > > for
> > > > > definitive answer though.
> > > > 
> > > > In most cases the kernel operations are going to be lower priority
> > > > than
> > > 
> > > It is the inverse of that - kernel operations are a always higher
> > > priority as without them a user app can't function (think any page
> > > table
> > > memory allocation or memory allocation for a LRC). This is one of
> > > reasons we just pin kernel memory in Xe compared evictable kernel
> > > memory
> > > in the i915 (also evicting kernel memory is a huge pain as we have
> > > idle
> > > the GuC state which could use that memory).
> > 
> > We're talking about kernel operations attached to different processes
> > though. The incoming kernel work would be for a new user process
> > (prepping the buffer for submission). The existing user process IMO
> > should have higher priority.
> > 
> 
> You still have to wait on the user operation complete in dma-resv mode
> before stealing memory.
> 
> In LR preempt fence mode, we'd wait until LR VM is preempted off the
> hardware.
> 
> In LR fault mode, we can steal the memory immediately.
> 

s/immediately/after TLB invalidation completes

Matt

> There is no difference though if we are trying to get kernel memory or
> user memory - this is just how eviction works.
> 
> Also if we are in LR mode, we have no idea how long the user processes
> which we stealing memory from will take to complete (e.g., we do not
> install fences in dma-resv attached to jobs as the fences could run
> forever breaking the rules of fence or in other word breaking reclaim).
> 
> This is where pinning of user memory could come in play /w some
> accounting controler, likely cgroups. LR mode could pin some memory to
> ensure fast forward progress or buffers it really doesn't want to be
> moved around (e.g., buffers exported over a fast network interconnect).
> 
> Matt
> 
> > Thanks,
> > Stuart
> > 
> > > 
> > > > the user operations (with the exception of maybe page faults). We
> > > > had
> > > > looked at things in i915 like preempting kernel operations when a
> > > > user
> > > > op comes in (the user clear-on-alloc preempts the kernel clear-on-
> > > > free/alloc). This probably falls in the same optimization category
> > > > you
> > > 
> > > We definitely won't do that as this would require multiple migration
> > > queues and preemption via the GuC is so expensive I'd doubt you'd
> > > ever
> > > win. I guess we could have a convolved algorithm in the migration
> > > queue
> > > to jump to higher priortiy jobs but would need some really strong
> > > data
> > > indicating this is needed. Also with dma-resv basically the migration
> > > queue needs to be idle before anything from the user can run.
> > > 
> > > Matt
> > > 
> > > > mentioned, although it doesn't necessarily need a user hint.
> > > > 
> > > > Thanks,
> > > > Stuart
> > > > 
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > > > Thanks,
> > > > > > > > Stuart
> > > > > > > > 
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  static inline struct xe_ttm_vram_mgr *
> > > > > > > > >  to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> > > > > > > > >  {
> > > > > > > > 
> > > > > > 
> > > > 
> > 
