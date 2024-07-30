Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFAFC3DA70
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 13:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B1710E056;
	Tue, 30 Jul 2024 13:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWDXUFNk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFE510E073
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jul 2024 13:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722347818; x=1753883818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L4hJD3k/VkfWiuEuSyYR+sUi4MwcI4CAoG1QfHb9oNk=;
 b=JWDXUFNkYjbe0tjQi/TZg2gH9GVYP2BjAYuXId4xPTE4ejmng9gH6otR
 zeeTtLlwEdW9qUXd8t+rf9jkkWMLuuOlQDO/k+lbG2TAesgWBtapoelX8
 BY0lynebKlo97jk65yfI2x+dljfROWhUhG217V6KvZMy/TNaBIEYaB2Gg
 zvif6jLcAo+mHLIAF3O1VfxpqV0SqnwIN1Rtd4sLlIC5kOiP5frfiUdNF
 iEDH/aqfzB0Ch4uXn/4zpgK3Oli2eGeCztCktDdnZxinamh0FRXDKfN7o
 +yRFUZ0OWq1qVETLNMdLZzplNCzrqF0hQMVRGFE2YX7QrY5xbKFF3tDN6 g==;
X-CSE-ConnectionGUID: Na75G6fCRH+Ppv+iEgWeZA==
X-CSE-MsgGUID: W4XWTDAcQlOv7RlzmCtXTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20343390"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20343390"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 06:56:58 -0700
X-CSE-ConnectionGUID: Ij4TVCX3TymQI4fQR8y+SA==
X-CSE-MsgGUID: 7xf4agXVR9GzUzM/90ImIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="91853461"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 06:56:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 06:56:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 06:56:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 06:56:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivAxJyoWVYuTZ7Q16KjwaqIUjFpQ0Oc76wAaswOnoZmrvyPpO2JyaltMoI5w3+LGXtJ3xuT2Z2FfiRLoxaIYVej2SOVtg4RSXhwHMHeGp5RCftfR/+YzknrVtvvv2kljUKooAXg1Pgos2WGQvBvM940MPCvfZdCdXbro+euU6fFBptHiA+B5aYivLoPVDw/xO/P2smD7UyoGIFl6oyanXCzv0M8VtdEaADOmUtEPl9+1eQ/yinY4udCUjYquaK2D+KMq0kZl+8aenoVWqDtEZT9ySKhVd2/+I5p2zuYQFRVcmSu4MnewXqiWB1IodVWsoinFY9vu/ZLDa0nF565R0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hR+yKkfqqTB8PaIcGfALBIqIx36LwUxtkAAp5kEOKA=;
 b=Ea5PR5LIikUjnv+MhFUIPHuz39xGDOzN5+xiLB9g+i1CeTYBw3Ci1uXgOaGdhPrP7vDFiHtKvbf7dUoPdTMgTDVI4qexBrjIwRgJMvJBQzpmWpE+bN4jC/QAE/FGD+Ka6jQ4CevZNoEKGQ8R/DDINxMvd3BUeAqot3VZZzSMC1Y/L1nbwPg24cgV/VEKBcjsBdqGt7951i8Tm3FOKCOW0BBs3NJukn4jjcywL+UFvqyqKdfVBPrlilDQktyiQH9LDeOJLrxysJgKvwb7YUXDy605RHILHF0fLsrHmYPMGxaIhWN1GF+VSiI+ctgaS24LbURUboFVkgwH8EkpS/9wmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 13:56:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 13:56:49 +0000
Date: Tue, 30 Jul 2024 08:56:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
CC: "mika.kuoppala@linux.intel.com" <mika.kuoppala@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 08/21] drm/xe/eudebug: hw enablement for eudebug
Message-ID: <omwu2mogw7qa5bjad5gzqdjil7f54udrxg3n56qhxnvccxdrc7@4rrdg5jfo6wy>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-9-mika.kuoppala@linux.intel.com>
 <icykmctrrffrulnbf6tnvb2jxnsasejdkk3zxxysizdqn3fsok@qrfh2iyol2ii>
 <718c4e50d84f77af4045872fcb7748a1081c68d3.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <718c4e50d84f77af4045872fcb7748a1081c68d3.camel@intel.com>
X-ClientProxiedBy: MW3PR06CA0004.namprd06.prod.outlook.com
 (2603:10b6:303:2a::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: ce696562-a004-4431-c3ec-08dcb09f7572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?myGVaEhOD1svKTCS0tntFiOoL/AViiBBKAaCz7WoHjsyBkiyQA9cAUOfVE94?=
 =?us-ascii?Q?oXcqlyyGt2yyzJYrSrZc8S5ut8fLv4p0C8dqu3RY+i/6l7I8zvS8UegKRQAi?=
 =?us-ascii?Q?++u/JTAK+3uStftszd6ApYRgPqAG/nJgqhtFfyLZGWmuRGnakEcekDA6OZfU?=
 =?us-ascii?Q?9ToR3gkxHELu8bitUDCadNAsr1V7V2QlZuJF3EOYlwh0cWLFoVrzxI5T7l+w?=
 =?us-ascii?Q?dgAZ327WLdgZFuiUXW2j8Z7YOVxvFMQdz/wdgqnoSdn5GlLVzfPn3+izEhHs?=
 =?us-ascii?Q?F4DA6HRTF5tFe15VaLUzWJXn7T/ay5E7WhP8O5wTQ8gXumiOGYpoZqhtMvj5?=
 =?us-ascii?Q?5G71J0tluqe8UlMLoYsbd1UVZ3K2pn+6pzlkwaj3IsA9TfRSO+vyZvOiq2Ou?=
 =?us-ascii?Q?HLM/5nBtDy5sTz9aZ+V6Pfw7MuDlMwa/G593kaNIFgoJ7+BOcJaHLajt4Aif?=
 =?us-ascii?Q?jLZASLFcvxjtGXOQD1rNuJvbkCeiWJZEcHPIR00fD1OIt0pXohTztiAj0D0M?=
 =?us-ascii?Q?PEq+FEwEqNshNaOjCa0kLm7RJXLYXZ5rH00F5Fcy1KBPKeWfb91eh/ffAvv2?=
 =?us-ascii?Q?E0gyUQ7qsuo5tKq+7AZYhrVRRQ3l3FWC0gb6jw5SuB1nhbMhehJefEFQRcKq?=
 =?us-ascii?Q?VDF3TdAPLp6cqrGEW6ksmzQ9D7JbcZJznpa3aiJExksPKQwWXrzQMyvFT08E?=
 =?us-ascii?Q?Oh+i7xXkMIOz9qkrVCr+s4K0PjY4+Yi9X7Hzyn93bsR3iqStmQCGBoTAGEv8?=
 =?us-ascii?Q?z3pckFu51ShW16mAFcx7PNVqzmOKKRGLyNBCYGfVQdmht9N5Tuhszc/1D/rF?=
 =?us-ascii?Q?Bx+zznZdBrXaoehq27C5pxZDm5h+MvSY0m7IbNhmgGB3hlJy+0vGIutpfvAb?=
 =?us-ascii?Q?rnIgPEAMQ+tycdBooimv/u7hcLKcjQy4VRjxIr2xl6xu6V0MzT6BZmer7EJO?=
 =?us-ascii?Q?tDguXxjqQzQZexxAMrmoCZ0k3s19NCg8f3HqViEce5J7daeybokgC2kvGHmL?=
 =?us-ascii?Q?wNFAFq0X4Ez43kXfdFf4b4Nmw02fapmkfHWrt2ZbZiBBOgykHeltljmNzvVz?=
 =?us-ascii?Q?/2LMAqnnIqHGWcJ8LNYuxsoBUDPJ4bGzkiDZHISAL9zFpO6Zvde/TASUWjYg?=
 =?us-ascii?Q?PwCv9eqVtTdbuk3FWdLUE7v1TPL+RhtWEq0BB4YkZxHrUkiXlb7P3M2AmPbN?=
 =?us-ascii?Q?JmRW7sLP/V1JLM00PWHMTMEAa2NGZWC6suE0n3JG5wQnzQYMNWG1Abu6vQiY?=
 =?us-ascii?Q?SoEc9Neeldw4XS05Qij5o6pQpWUME9vL0dcGRu7fmFl2Hgj4CFzajelenlXR?=
 =?us-ascii?Q?v2Ya/AN4m7t0Yij4v1ErJEl4jw29bcEKcgEE6ITIUUXQ3g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pQWzyyJ/jtswhT8EU6LVqxVupzn7BLmGV2RBL4mJdMo/oQDWq38wztR6pcO1?=
 =?us-ascii?Q?yeQ66KpsdFFuqehjR2J9b2wODftDxACyqhilMNppXMq4vi3WsrKtWJBT7yZL?=
 =?us-ascii?Q?xZf7IAsYj3ZmTMsTCaFkLjGLEUWtjiC1bBELtEmhSiCt1FlQrRr+d6dPy6eR?=
 =?us-ascii?Q?GpjcY40EB6l964tPnFiONqxWiVEufe1pb5hoe/kD2mHAru9T+5MQSlXxA4pB?=
 =?us-ascii?Q?c/N7CcBlIQT73S6Cenu/arbkr11LDohgHYHM3fYsSU9XuP0yUZe8yj3D1xMT?=
 =?us-ascii?Q?VPjatuCNr7ZSDI100Z54oio0vuiw5d5glQeaJOIOmWtMfT6cWr8urecE2LYv?=
 =?us-ascii?Q?UubfZxIAAFzYvDbiSJI38hclo6Nc1Y+x+CUyB1YLObiXi9ZgvQ9gMpBw6Cxg?=
 =?us-ascii?Q?GEdgF+k34fwKIx513m1VZ5GsOxq51FVa/yluBA5TAHtSYP+bIJgz/XzgknEy?=
 =?us-ascii?Q?sbc6QMAkKuRHbFo0Q0QZaEXjp/ILbP+F0q4fy5rX9wTCVx1EL5t3j8Lkm4s6?=
 =?us-ascii?Q?MEQAiX7e0W/IRO6pVbq3+OAOid+JuumZA9vtdMTKdhYjbnb+5w8+E+lI+0xr?=
 =?us-ascii?Q?bz1N5N6BTBdMcsWbUUuIRicwtIodiKIufU4R8giCyzzQU0YnVUZJchhr0lvQ?=
 =?us-ascii?Q?AOM1VtCNQ5sdSNkMSr/xy69qPgCD6h0L7yg99bHlLBQxsVS7BHWAdRZZjHFX?=
 =?us-ascii?Q?NdVEIE8lM+BLgiK+kla+jTLK6tW1ZZQKPL+DhfnjFhNAOdE+dYXivgl+GpQz?=
 =?us-ascii?Q?PB10rE2Tgl1WwuSMWh7tlRaWUU8B9UpcRHRr/FxyePjVDBTm/NGS8CqRqcPN?=
 =?us-ascii?Q?wSROjAXWMdAJEXwKxROZMA5bkprcNVesGdj0YV6weUrr34naaJ82jESEuQqM?=
 =?us-ascii?Q?LAoglSGB/bi59PFM0GaTQQ2F3zkkyO2oj+XORQzGF3BuRQnlMewq3ud0qmln?=
 =?us-ascii?Q?hoKMIPtdX5cW3Yr7ipDfw+YzqLnkTKUJzPblX1cJHGU/MjDxyUtsIGNJmcoW?=
 =?us-ascii?Q?C8jGxBHXqgngfOisEnjuAct472d9Mn7u9GGXUxeWbO9uJYCi5tzIP7aZ4EC+?=
 =?us-ascii?Q?GeLV29XNid1GulhDJ83Qvx4QECf41zRQZNaR8WR4941U/zgO+O1Sa27PsREX?=
 =?us-ascii?Q?g2qGwOMm3SVqYiotskXvpTlOYTeeLEw4g7SDALcY1gZJdTyerCQ8HEfJKAbI?=
 =?us-ascii?Q?wZIY4Hmf9sHblDTR/zDJdV/9snjxJ0wqHgXNKlO51KHdfojAEdmvAVqThn7c?=
 =?us-ascii?Q?dtWkfr/Bh/vokBy1UHd9AYO3A/rJXhwKqrurC5W6frDb94cYVQHu6DW85mh2?=
 =?us-ascii?Q?AB7eZ+Ec+ieNr9qZouXYreUVkYzY3AZgy414JXUriQ0O5myzr/b60UnR1Sf9?=
 =?us-ascii?Q?YplRJHwqeJpbl2NlRylkSmM15lmxBSjaQlXunTNs2Rc7Z6U43YwH+DBcm1fq?=
 =?us-ascii?Q?WOk9DizhvmTZhaIy8qxuXhSjzxWrTpNAop5L168wJ4k8r+Md+VBJDCJjvjXC?=
 =?us-ascii?Q?wmykDWsqxE2oWQRkwPouRj/4J0AHyX1SLd4dAwJr2HXMe3qghDuoXDyheuvk?=
 =?us-ascii?Q?3SumeXh2RhAXDivWtAnpQAK/JHySQdDNjgPrQBl7GqXwEh/2BY3VyX4/jPVZ?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce696562-a004-4431-c3ec-08dcb09f7572
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 13:56:49.8110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQ9KuAvbW6OPp6wb2iGqvy0RgVivDc5aTvFGG5mGBkrvUSkMRTAdA9xOkNv77gvSGySXJNmtSYAnwbD9FlMs6yQz/JMpirJ2UQwovmC3JyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
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

On Tue, Jul 30, 2024 at 09:01:50AM GMT, Grzegorzek, Dominik wrote:
>On Mon, 2024-07-29 at 14:05 -0500, Lucas De Marchi wrote:
>> On Fri, Jul 26, 2024 at 05:08:05PM GMT, Mika Kuoppala wrote:
>> > From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> >
>> > In order to turn on debug capabilities, (i.e. breakpoints), TD_CTL
>> > and some other registers needs to be programmed. Implement eudebug
>> > mode enabling including eudebug related workarounds.
>>
>> nack for the workadound part. See below.
>>
>> >
>> > 1) Enable exceptions only on platforms that does not have per context
>> >   debugging functionality
>> >
>> > 2) Fixup 22015693276:
>> >   Use lineage HSD instead of per platform specific, be precise defining
>> >   graphics range.
>> >
>> > Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> > ---
>> > drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++
>> > drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 10 +++++
>> > drivers/gpu/drm/xe/xe_eudebug.c          | 50 ++++++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_eudebug.h          |  2 +
>> > drivers/gpu/drm/xe/xe_hw_engine.c        |  2 +
>> > 5 files changed, 68 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> > index c38db2a74614..fd31f3fb2b4c 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> > @@ -114,6 +114,10 @@
>> >
>> > #define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
>> >
>> > +#define CS_DEBUG_MODE2(base)			XE_REG((base) + 0xd8, XE_REG_OPTION_MASKED)
>> > +#define   INST_STATE_CACHE_INVALIDATE		REG_BIT(6)
>> > +#define   GLOBAL_DEBUG_ENABLE			REG_BIT(5)
>> > +
>> > #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>> > #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > index 8a94a94d2267..96a59a96dd4c 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > @@ -425,6 +425,14 @@
>> > #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
>> > #define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
>> >
>> > +#define TD_CTL					XE_REG_MCR(0xe400)
>> > +#define   TD_CTL_FEH_AND_FEE_ENABLE		REG_BIT(7) /* forced halt and exception */
>> > +#define   TD_CTL_FORCE_EXTERNAL_HALT		REG_BIT(6)
>> > +#define   TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE	REG_BIT(4)
>> > +#define   TD_CTL_FORCE_EXCEPTION		REG_BIT(3)
>> > +#define   TD_CTL_BREAKPOINT_ENABLE		REG_BIT(2)
>> > +#define   TD_CTL_GLOBAL_DEBUG_ENABLE		REG_BIT(0) /* XeHP */
>> > +
>> > #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
>> > #define   DISABLE_ECC				REG_BIT(5)
>> > #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
>> > @@ -450,11 +458,13 @@
>> > #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
>> > #define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
>> > #define   EARLY_EOT_DIS				REG_BIT(1)
>> > +#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
>> >
>> > #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
>> > #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
>> > #define   DISABLE_EARLY_READ			REG_BIT(14)
>> > #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
>> > +#define   XEHPC_DISABLE_BTB			REG_BIT(11)
>> > #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
>> > #define   DISABLE_TDL_SVHS_GATING		REG_BIT(1)
>> > #define   DISABLE_DOP_GATING			REG_BIT(0)
>> > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
>> > index db55e449049a..9611acedeee9 100644
>> > --- a/drivers/gpu/drm/xe/xe_eudebug.c
>> > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
>> > @@ -11,13 +11,19 @@
>> >
>> > #include <drm/drm_managed.h>
>> >
>> > +#include "regs/xe_gt_regs.h"
>> > +#include "regs/xe_engine_regs.h"
>> > #include "xe_device.h"
>> > #include "xe_assert.h"
>> > #include "xe_macros.h"
>> > +#include "xe_gt.h"
>> > #include "xe_eudebug_types.h"
>> > #include "xe_eudebug.h"
>> > #include "xe_exec_queue_types.h"
>> > +#include "xe_module.h"
>> > +#include "xe_rtp.h"
>> > #include "xe_vm.h"
>> > +#include "xe_wa.h"
>> >
>> > /*
>> >  * If there is no detected event read by userspace, during this period, assume
>> > @@ -925,6 +931,50 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
>> > 	return ret;
>> > }
>> >
>> > +#undef XE_REG_MCR
>> > +#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
>> > +
>> > +void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
>> > +{
>> > +	const struct xe_rtp_entry_sr eudebug_was[] = {
>> > +		{ XE_RTP_NAME("GlobalDebugEnable"),
>> > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
>> > +			       ENGINE_CLASS(RENDER)),
>> > +		  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE2(RENDER_RING_BASE),
>> > +				     GLOBAL_DEBUG_ENABLE))
>> > +		},
>> > +		{ XE_RTP_NAME("TdCtlDebugEnable"),
>> > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3499),
>> > +			       FUNC(xe_rtp_match_first_render_or_compute)),
>> > +		  XE_RTP_ACTIONS(SET(TD_CTL,
>> > +				     TD_CTL_BREAKPOINT_ENABLE |
>> > +				     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
>> > +				     TD_CTL_FEH_AND_FEE_ENABLE))
>> > +		},
>> > +		{ XE_RTP_NAME("TdCtlGlobalDebugEnable"),
>> > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),
>> > +			       FUNC(xe_rtp_match_first_render_or_compute)),
>> > +		  XE_RTP_ACTIONS(SET(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE))
>> > +		},
>> > +		{ XE_RTP_NAME("18022722726"),
>> > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, 1274),
>> > +			       FUNC(xe_rtp_match_first_render_or_compute)),
>> > +		  XE_RTP_ACTIONS(SET(ROW_CHICKEN, STALL_DOP_GATING_DISABLE))
>> > +		},
>> > +		{ XE_RTP_NAME("14015527279"),
>> > +		  XE_RTP_RULES(PLATFORM(PVC),
>> > +			       FUNC(xe_rtp_match_first_render_or_compute)),
>> > +		  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, XEHPC_DISABLE_BTB))
>> > +		},
>>
>> workarounds don't belong here. All workarounds should be moved to
>> xe_wa.c, which also has tracking for active workarounds and make them
>> show up in debugfs.
>>
>> tuning and other non-wa stuff may be added separately, like we have in
>> xe_tuning.c, xe_hw_engine.c etc.
>>
>> Lucas De Marchi
>
>The thing is that these workarounds are purely specific to EU debug. For
>instance, the description in 18022722726 states, "When enabling the
>Debug feature, [...]" I assumed that there is no need to enable them when

ok, we may have to do something else for that then:

1) if there's no side-effect of setting it, enable it unconditionally
2) set it as an OOB WA - this will enable the WA tracking and allow us
    to check the WAs implemented for each platform

(1) is the simplest one

For (2), then if you are using an RTP table for enabling/disabling you
basically check if that OOB WA is enabled as the rule.  Currently you
will need to split some rules as the OOB WAs are gt-centric (so the
engine check part would still be in outside OOB).  +Matt Roper if he
has other ideas.

>the debugger is not active to limit any negative interference, and we
>address this later in the series. Please take a look on "[PATCH 20/21]
>drm/xe/eudebug: Dynamically toggle debugger functionality." Could you
>also share your thoughts on that?
>
>xe_rtp isn't really designed for dynamic changes and we may be bending it

that part is beyond rtp. RTP is mainly about getting a bunch of entries
on a table. Applying the outcome of that table to the hw is left to
xe_sr and guc-ads

>a bit there. If so, we would appreciate any ideas on how to dynamically feed
>GuC restore list in a proper way.

will try to take a look later today, but I believe you will need tweak
the ADS and reset GuC.

Lucas De Marchi

>
>Regards,
>Dominik
>>
>> > +		{}
>> > +	};
>> > +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>> > +	struct xe_device *xe = gt_to_xe(hwe->gt);
>> > +
>> > +	if (xe->eudebug.available)
>> > +		xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
>> > +}
>> > +
>> > void xe_eudebug_init(struct xe_device *xe)
>> > {
>> > 	spin_lock_init(&xe->eudebug.lock);
>> > diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
>> > index 44b20549eb6d..ac89a3d1ee1d 100644
>> > --- a/drivers/gpu/drm/xe/xe_eudebug.h
>> > +++ b/drivers/gpu/drm/xe/xe_eudebug.h
>> > @@ -11,6 +11,7 @@ struct xe_device;
>> > struct xe_file;
>> > struct xe_vm;
>> > struct xe_exec_queue;
>> > +struct xe_hw_engine;
>> >
>> > int xe_eudebug_connect_ioctl(struct drm_device *dev,
>> > 			     void *data,
>> > @@ -18,6 +19,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
>> >
>> > void xe_eudebug_init(struct xe_device *xe);
>> > void xe_eudebug_fini(struct xe_device *xe);
>> > +void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
>> >
>> > void xe_eudebug_file_open(struct xe_file *xef);
>> > void xe_eudebug_file_close(struct xe_file *xef);
>> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > index 20c4fdf40790..0d8b871b47fe 100644
>> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > @@ -15,6 +15,7 @@
>> > #include "xe_assert.h"
>> > #include "xe_bo.h"
>> > #include "xe_device.h"
>> > +#include "xe_eudebug.h"
>> > #include "xe_execlist.h"
>> > #include "xe_force_wake.h"
>> > #include "xe_gsc.h"
>> > @@ -503,6 +504,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>> > 	xe_tuning_process_engine(hwe);
>> > 	xe_wa_process_engine(hwe);
>> > 	hw_engine_setup_default_state(hwe);
>> > +	xe_eudebug_init_hw_engine(hwe);
>> >
>> > 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
>> > 	xe_reg_whitelist_process_engine(hwe);
>> > --
>> > 2.34.1
>> >
>
