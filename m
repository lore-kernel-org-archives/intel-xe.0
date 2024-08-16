Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50768C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0656B10E7F2;
	Fri, 16 Aug 2024 15:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MPuS5lq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C6610E7F2
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723821887; x=1755357887;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+8PleH9LDcSPqfgEVuVIxm6E1zqm5WWNYHdPmCObRaE=;
 b=MPuS5lq43ZH3x6PTW+CqYmwX7v/NT6CKYhURlIX8iu9WoX1cRVP1WG7q
 3YtXceHIXIOSx6XY6DKbInfgH9pu02alaIt20KbUCBBW+6x3+IYMwLMcS
 sbl2kWouImbHSItYNfp7+kI3aWWriMY4IRPl0Tz3Om+444zm58TgJyudr
 /uuxbYURuv2Em6TPNp2HduQGMAZleOvDOngjl2wk4gxY3dOrNzIYteB+H
 Lym46dGwa4iQh6y2gh2hZhrCf6e23JYaXQJAeIE8duW7IowTK7iEfGAhV
 xZts1HKeFbSClQ+knhZpTNcqPRZmUZN7E+kFqtFe7J/bwKxx0GFsBRP2d g==;
X-CSE-ConnectionGUID: cfdHfLXLTi6b3wHbHsnUDQ==
X-CSE-MsgGUID: NIOA1aKBRTK88jdR4X1DUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33530515"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="33530515"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:24:47 -0700
X-CSE-ConnectionGUID: IvP2use3Svi4dts3OT2Rqg==
X-CSE-MsgGUID: EqwiwW20Sd+QhwNmPzZaBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="97217123"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:24:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:24:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:24:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:24:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:24:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXqWsBd3LVaBoeaxPYndNC7reTtu+RlFP/KEz4g95pLWt/i+/w7ty3Ls5ZQKcjINbrbYkslPZMmou8TqaVTe3mPWPocotNnq8UBlnf63vOVWLje54zYzI4HQ4YwmjvF9XLRmUqFWZ+M6VxF+6K9Fl1+Jl8LTQq0YDU7AyYFGozgolZqGEtmcSNqMwrz3BE5FJH5ENI9rFM6tnO2lNXzuE26DDj5eeRZjT1vVWegGqzcivZn0lfWE+Gak1tliCJugStSgFjHyss72a+vE5ZtAxTbvR2VMtFrlWeU3lLRxPBPOJgQGWxpaw3kUew0haYZM43eMnR+Vt6VR9ONIPZEVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OM5GBZJd2Obzu+Ue0/M85/p8NcOnD4zOI7h4KPGD/0=;
 b=UexNmR6XqX/Dplpjamz+uBoE/FUd+PtnilyolIkWYnYiIvus/+nyzRMZu8uKdK73gVBHOcpwKlcrUoePT153FUXWJePRwlhctq4CI9Sgr96+Jbyi9IFzcTpZ9aj+GbHMo+c1C2PFOeJymkjMrj5qa7L4YAxdpron1RXy9O7la7NaSDzCSvMY5duU92ddQatc2vu0B37ezbVtvflEbm0I4B/1ISBJSb1wC/+ESvUwe4qLNfzcQOvBEM4bJHwkawL2ANYR8aXVy9UF5/zWosZq4bQJSFkldXyvIoElNmJKccsHuT465g2AE/oOGzfRqRCX4u8iorNejwQbG7OZycutzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7709.namprd11.prod.outlook.com (2603:10b6:510:296::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 16 Aug
 2024 15:24:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 15:24:43 +0000
Date: Fri, 16 Aug 2024 10:24:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: Re: [PATCH 06/12] drm/xe: Rename xe_ggtt_node related functions
Message-ID: <soraiswuftk5jw372sq7dtaknrgooa2jbdce2jgn7yqwffz757@eynz3y7tmvhw>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
 <20240816150243.87596-6-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240816150243.87596-6-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:303:b5::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: e55d13ad-42df-4e43-0dcc-08dcbe078dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x5yFW2rkuIPn6x6cejeWnm9KICydGdTCBuguJeIwvxw1q2mG0TmOJVEP0Kbt?=
 =?us-ascii?Q?I9VLg1/Ct2m/goS+v3oqisoHRqlzyTuUDkKazuvfJajRRKBNKLdl+oDeJnQF?=
 =?us-ascii?Q?CHObSD2hwYH9/9l4rIXqCv4R195S9wSdTwzQ+rkMZdzBs5CgRsjy92VFResm?=
 =?us-ascii?Q?LXos+VMhQc24j2SamnRaOAmE3lyd0UCTGCbpk2qhDHhDBOjMXE2qJHgmCHqw?=
 =?us-ascii?Q?HKhxDfvbbN3HsxpS4RH3j+A8emFthYFjQLJ9jVl/jQ4OFg/4o9G2QvtETn3L?=
 =?us-ascii?Q?poQK1BAXdtXpHG6+XKA9FuVo5jS3XVXIt26UQfXolgcOUW2T6wBySBQIWJjY?=
 =?us-ascii?Q?K/+/RZpQ14v/0yUf8v6puPTl3fU3j7P1kmW2fbmZ2jW82/EUvtaQikTRGVXa?=
 =?us-ascii?Q?NPQOc1uKQqaU41rIhH1k/7VLqtSqGQJS74aPqKPmxq7uttl35zKkgcVenlWP?=
 =?us-ascii?Q?lBZNvwJbo/vdZNSJ1o/l1Og4Izvh4ND+pjAf5HmXZehEk5XAmswrlIZQU46I?=
 =?us-ascii?Q?3Ua76h2YySTfmncj8ZFR63sq3rPQEG2xDXURQ8Sh0LYNmw5YeonUmtX16UqF?=
 =?us-ascii?Q?nyaQKf/x6KwqGpgONohDs8wGEs203uKXNSXJLeOPa5r86rkbNX6RZPkP5jHp?=
 =?us-ascii?Q?2FqWTb0+yIur8PDFZ/hE3pgmtY4tN1xFlhpzQgjJMEmVV8vKTLhLMATXmWco?=
 =?us-ascii?Q?3MumTOdmUopts6F7P+mK8YdUuB7/6lAI77YiJgfCZCuwIw46KZMcWwt/mRUd?=
 =?us-ascii?Q?wlEHdv2Auas9g0v6q6Y9A0gKL+RSvOt/O9e3lNt5OSkVneounQG8maKHJRdl?=
 =?us-ascii?Q?ZIj6CiKLMPnsrnrcUIkfgCJ/DQvemRO3hOP0RxTRYvZKxIXRYkvCrE7kD5ha?=
 =?us-ascii?Q?jTwC31siYCwPT2g187QDfSUXOzx6XGWRisizneAsLsDDVGcPABCi3ZqhdZoB?=
 =?us-ascii?Q?Cf8hCEBUEHtimdguOCjhMp0Cg6wGU8VM+8+NaaukLOLeVQpbscNogkmqPORd?=
 =?us-ascii?Q?2xtRYoCYo0nOZLyh/Pdm1tcAKqQ7DB/h2ageEWQmNhU87YUhS/gZYp2AOPSB?=
 =?us-ascii?Q?OyxGUU6yOU090bsgDrX01p5CX7fHyimk87DCU0y9K85kTxHkGlb1DAgCneVB?=
 =?us-ascii?Q?wcnTxv1ukutQrfhVb3VQ/NhqBz39KIVkkMcXXni5kQbC6hN0R9xVqccCV2nk?=
 =?us-ascii?Q?nM4lN4ZvzcsE3VvPE4/LS0lpITH/nc1QgWoJS3Xo25XKM3Lf9AXyaANxlvDc?=
 =?us-ascii?Q?IM+Sh//9rzHPse6TTPH/xUyysHH7T2kG29s8WXPOthAOvlbobpAhEYGAvAYW?=
 =?us-ascii?Q?T5Z4y+nL1bOL46DxoPbZJOhWXnFKH5yL/mS16BQebxokqw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U+sWX1lGAXSYi4wTAa9/vIFR8JBu289orwO0EoBnA2t13MbX90Vm1ubWlc+h?=
 =?us-ascii?Q?pMJFu1yuWKFsr9Dr2PoRDwxViS5nBiHZ3AX3zCm8wMAqAh8XfOxRJvB4Tush?=
 =?us-ascii?Q?7e5HP7srXTJ/IlmGMQ5LOFi2bm4ilUf207RqRMqrhgtHk5KQkbhiXyKvGXvm?=
 =?us-ascii?Q?kG+N0j/53zGut1od9rXUm/dK725x2O7+au7T9duvFPiit9NVKBQJVM+bWmzY?=
 =?us-ascii?Q?Zadziw4mz2lF3uyVSYtOpRTNX5xczchzW8s/KP00o4/acuTUK/FJp131FviT?=
 =?us-ascii?Q?cTMYE54qB3AFOQWtUEK+QP2YCZabw+2T2BmL2LrDbAfn1uWk/O3NTUDqHUGJ?=
 =?us-ascii?Q?fxbrdghf0uA71WPIeC5UeQ6M+VZ5Hvy4OyWemMpWq/X6rDhdmNwMA5dg7Wu1?=
 =?us-ascii?Q?PeDBa4nbKoGw8FiD/1JS+cqQcWLj7z2sB1Lg6fsbyo1gK9s1QrQs/LaOdHjw?=
 =?us-ascii?Q?az4t6RYJj8hKV3Smf+13NWj3gnP+tPWQzWmX79rT4DwmyzL5tQ90GsWFl9hr?=
 =?us-ascii?Q?daf2iHbPj2TVKMISKpeXs1zZnMZyTjM2eewUusGzHXziv1UfYnAdMUpOPe5w?=
 =?us-ascii?Q?ccsLQF8EqPiN+EWAiL2rebCuEPX2BzyKKxWKed9llsAq/UOUmkLvBLfU7ZTX?=
 =?us-ascii?Q?Sej7ekNQutDHlXWChTJVEn096U7MF+CXdKrC+wAcnHMqsM1n/SUBtTVWfIzr?=
 =?us-ascii?Q?weDa1bAfRaYfwAsYmeCdX69CcrdhupipsFWDplG+LFW9omio/7/+4Yny7HdJ?=
 =?us-ascii?Q?vItufiKGqGAaHH2JkwjD/YubDBRpnCXDwO69n78D7GMa3+oCvaz16Mkz3Plq?=
 =?us-ascii?Q?lwqP62lp7yTYhg0extYNvYiMRkoZ56maISpStejlNWCAFv7cZzRephhFKUSQ?=
 =?us-ascii?Q?k52dcHrB3QqsPgMWgsyQoFuQFrd6HfGmg5oqD5psLZs2RSFiV31SI2Oq3E/R?=
 =?us-ascii?Q?KB2xzhIghmSBcD8vZZLwyEYEOpJdxhicT09XOR4t77BVS8yKywC3dEg1hcv3?=
 =?us-ascii?Q?2yMrgNhUijvK/kRIYnPfHjKMt+l2krpz0fONrp4pfQrxlXMiO1kBgXnVnB3Y?=
 =?us-ascii?Q?3dNIIkfoAhjJV/o54U1G8SoTo6Ndi0SPme0+3i6TTVAKTVkFOH63XqjsmlHj?=
 =?us-ascii?Q?Xuadwtw5bNFxq45oi2+rIr/0Si5kojnzuAPKBj24c4heNdarPwrAnqPZYx4P?=
 =?us-ascii?Q?sJU+WYQwhzDNYxaKjGZKa9vsb9a1Bm3dS2HCkANN1KRSoXRq/B9jr4/ft7sn?=
 =?us-ascii?Q?vLqq2E8GFEj/pm7wI+o33BPWLUlBYSBA04xHUVTvWXv+MDDQtBXz4vtYTrSn?=
 =?us-ascii?Q?W5Q28pLKm1zMQjNQs0RkDGICdFOsp5Lh+NJSNJTZUXXxe+prupT2nRZpKNZe?=
 =?us-ascii?Q?T1LvHdxoROWoM5jmzxeKkQPwifYQDhk06Pi6sr/CjhyZO/moetBn32McOT0v?=
 =?us-ascii?Q?jXfsVn4ik+1rRSexoGx8w7OMnit88BsGR+VNMLykyHPNjr4Ami9tEpHaDlk/?=
 =?us-ascii?Q?IFrxI1ae5tDgGtM0C4Es97tF+iKvgx0732r2zp6OcxmCWOMzHXnzILHwemJA?=
 =?us-ascii?Q?k/0omv0mv0e2cQIYoseCadSHxD8ewi66Uyna4YAdlTndKdNq84iCXj4dI8hw?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e55d13ad-42df-4e43-0dcc-08dcbe078dbe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:24:43.3564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htPMvLHYKV6Kz9Ko2IFh6WXrDQMTFDujYCg6Fqy8mpQzn1CT3ebGemED4S63I2DjiVRXZwQJXJJXa+Qc+VwV4dVjuTe87hZVUK5pfVEZ1LE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7709
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

On Fri, Aug 16, 2024 at 11:02:37AM GMT, Rodrigo Vivi wrote:
>+/**
>+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
>+ * @ggtt: the &xe_ggtt where node will be removed
>+ * @node: the &xe_ggtt_node to be removed
>+ * @invalidate: if node needs invalidation upon removal
>+ */
>+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>+			 bool invalidate)

pass by note for future... replace `bool invalidate` with `int flags`.

Lucas De Marchi
