Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05013C3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 18:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B002410E249;
	Wed, 31 Jul 2024 18:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iziOg51z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15F110E249
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 18:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722449053; x=1753985053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H+gpJSLtXC0nqUn+mimoRuO1MaGYwT2lOQ5heYBxdds=;
 b=iziOg51zrZbGMQZZKPeeEdp/FAwYBe5iRfQxjkFkSp4voxRekAWZ3TWU
 wbPD4GKNlkFT8gVPWU19V6gIHsFVVLS3fPHm4aMZn9Hqhe4UUiq8w5hvO
 FB0sOD+LwdaaE4txBQVd3+JmNvnqj97LefM50hpNDPmO/5ONA0MTg4L9O
 j7uUJsHHrVuAxdqtclk65GRAHpMuTtf2jg3twb0u6q30pgNhlZrz3d+Qd
 /jEA2kKN6MGkEB9t3txO3Pxbf8AA1oNlZeBAvRy6QRWP6nebXzIV+2dST
 no19q1E/IQBYHbYIvN8Lq6s1lJ3xLc2sLfXDrDEbVj4XZzc4wWOAC4MM9 A==;
X-CSE-ConnectionGUID: wPHuyOfyTdutFK8hXISZLQ==
X-CSE-MsgGUID: RIqX/we5SXG+fyJm/RLc4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37865271"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37865271"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 11:04:12 -0700
X-CSE-ConnectionGUID: B4XqeO2ITDOX4nyGo0x7ZA==
X-CSE-MsgGUID: cag70MoLRAC3AAsdoMSWEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54448108"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 11:04:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 11:04:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 11:04:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 11:04:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 11:04:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aftF2DlC9SRwRcPYkrZEkQXPHKXXjjxbFx4RSUppY/ZzFdKkNpManF5vTKbfZiYlmQG3ic+sR07O3UPGkFCuFmB71Hc0nbfthQXkTNJh76g7rj829WLTC647oyf4bKndGt2IZsabPKKxUURYHp6uRJ00elglfWA899q7GMklRBBzUQBFClLWfDQyzr6htp21nESeO6J4l24T6q4VHnXTFraGYGyjYXFVGnpjydX+IbiW66DvzOyKRUi/0xtHSs227H3UCmtif50R0e80RT87ZZDL2MQ7SRuFI/34W7sRU5ybKWaIpiblCyfEBPnPWb1qI3OmhuWNm+etRGmdWceC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBqXGpbkizPMRhvNF546f5sBhW+eVZnN+c9TcTsmGHQ=;
 b=TGreAamZecI/8vwL/rNhjcrKE6EN36h8ah9cjTD8zrNmbk+4Gbp/tPQSZlj2YIyawBL6fD2R2wFrYm2Agq9AFzuVNGt03k1SrcSxrZgQQPrHM8yhOGljJkr5MeLRA8mNmkRG6Ayf9zuwswIeev+dLWlmtyDaccNGMta3rhF/sLaeytHBMlfmc2E+9zlRbgD1f3pxWNBnJdgpPvSM5UqO6EYMuJyN0TnzYq0iLGIUKcISsDX7XE98kObh6gAP5hkJexwa13/K7GLFjc9ouXbKhz722aV22S2RmldavAUimk9/78dXpCvMKanzmb9rrL1z/2KyZkluyqFeBhlxyWj+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 18:04:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 18:04:06 +0000
Date: Wed, 31 Jul 2024 18:03:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 20/21] drm/xe/eudebug: Dynamically toggle debugger
 functionality
Message-ID: <Zqp8XzqKfwpsv63E@DUT025-TGLU>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-21-mika.kuoppala@linux.intel.com>
 <ZqXOF3ACeHABbCPj@DUT025-TGLU.fm.intel.com>
 <9b938342-5edd-409c-b37d-6230a44ca972@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9b938342-5edd-409c-b37d-6230a44ca972@intel.com>
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: bd02776e-7690-4079-5864-08dcb18b2b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lLqGZsHFqZBdapstYliqu0mE86pc0vzaz+VeSWvdrTDWemlERlKFjjMKfpUL?=
 =?us-ascii?Q?mNhioQJmlAmfM4hkneje30tjCGTj2za5DU4ZOTBo57kGbC+L02LHU8kOmceU?=
 =?us-ascii?Q?BSSlTl30n3hSJxe2V7HMhKF5/vhpIXh66BA3mRfmt7QjkPpe+FwetE9GdKJN?=
 =?us-ascii?Q?l15zvfuZzt5mJPqi1hhtaIyt3v83lXjv8oCw/d6rrPxFGonMq0wELFnklM6X?=
 =?us-ascii?Q?9mkSZZQ1pKDk7Q7c5K1ZXHulBSqVZViKkMrsXqwk3TGIUaBfnHv8bogmJN0O?=
 =?us-ascii?Q?AZeCj0caI8X4NWt6ZsM0Fg65JHaG9vYQmj0635WEq0JN//A8AUcNczacDl+H?=
 =?us-ascii?Q?0XczZA/cwSsXS78uzOG7dYI+zaJDMUMVwyO4hnDy/srBZGNsAwQN928JGmEy?=
 =?us-ascii?Q?f0sanHYpz54AiOn5xgYpjF28no1YU5oEkCMSOBAAenXIiwlArkwO3DszlSpP?=
 =?us-ascii?Q?blRIdj1r4sovB9CuqkdMIIGXmBuhj04wpxeZtXHMRwo/2sW9iFD2GM/F3uIn?=
 =?us-ascii?Q?gR2SaA/rNlSrWI0rzKNfo78zGLMnUr5DmMcvH4c03DwOPBw6DwboePPoUBvo?=
 =?us-ascii?Q?zZSq8s+4WaymEombFE8roDIsgtJJiDOLClBEhPr95uJS0arFXbMHZJuxUs30?=
 =?us-ascii?Q?e/M/vEoLpQEsYqUwK9xLSzJuiDzBLQngTebS7CFBzLoWA2rdn6R10JmMIPl1?=
 =?us-ascii?Q?kUt7onmnWuMyHQ3fbVbfTTzlpcvLk6UtP1/TeOTStwfu1CNt0lie8D9Zefvg?=
 =?us-ascii?Q?skB4ugCBusX18auxviXH8zfvDtpr+w38HiUdaTyMbAYUw3YlXx7eQ79GdBFQ?=
 =?us-ascii?Q?XJVkmjpTA1C3/HRNajo+Nuehvde6iAVaHbmREIWRXz3HaG4luxMgKMVfVXU8?=
 =?us-ascii?Q?NRDi1j6VMuT1bJQArJqmLrLZwgFWH5uKC2gSqs0rtHQaW48B0dYPNrB1sdbj?=
 =?us-ascii?Q?H6SiAtI1s3vOUd5sNKAguAi83IN5WHOvBgTDqL1/I+Rj7QvFpSj0gJchbvi2?=
 =?us-ascii?Q?m8LruAQ1UDKfLElGyogXK9u4NAcDfG66FbpUBpmCLGHJ1j4x7nt6zVnVRn7l?=
 =?us-ascii?Q?6JXwUZ2kjqutZQ0wknNTpd0s3Zfdi5N6aTPeabIztdjfvuuOK5FhpZjofXMl?=
 =?us-ascii?Q?mzVr1nOb5nUrM73rYHCQVZb7CK3ZYq97uPDzpWK0Zm77JXBkLKvFW/qYrK7H?=
 =?us-ascii?Q?doVlHZkmGzOAAUsENaBwrT5a0YfG0dd2GlFpYR4ikjr6Tqa46fUgsMNGdSHQ?=
 =?us-ascii?Q?P+hd3FxFv5N6MuYpK4fWW7FWQt4FxTwKikoZtY1Y59rZXriDIz2puHUubohX?=
 =?us-ascii?Q?UPZGs8Y0/nnWCverQRjHiuTJNr/SZJ5PBnbHEj0AzOkurg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s5yrvI36iFScKNr/BoPO6e+f0tqGeO+SYnKLvGrc6hSXDN+flO33wh4B+uBj?=
 =?us-ascii?Q?tJ3n3eWIU/Wy/qmHbxBGB+Gaw4eYlC2Wb5frk3MgEDAdPORkEMZXQPTU+WQ4?=
 =?us-ascii?Q?AI2ot9dwOgMdcK32ECZStDN8E1pMzPWPh5JNb0ShWjD1yF8y0l2w6sWxMSw1?=
 =?us-ascii?Q?JSN7EE2l/1ZU6iv7CxFWSHUboO9OWqZ0bk6Hmp3WkP/OTjGwCrJYXtVSBfZU?=
 =?us-ascii?Q?fkfFs8oRfPrBnCGyqYIa++xQ1fggt8rxbXSu6iLPhyAIZnh72IJV4pJc9nIR?=
 =?us-ascii?Q?RCJFwPSgsYzeHZT93QnrhWGY73bL4F/DDJ3/jbl82feK8jK6xcfpK4Pw9/dr?=
 =?us-ascii?Q?1mXPKl4x0ugKJapEzzuPpXi+dEYSyeKMYYctFIhZIVPsWqSyW52dECGkseTy?=
 =?us-ascii?Q?8MSu3qQTw/O9kAEm0e+wo5cso6/6E7I/K4z2jC1l1QWFUPWxAzTYuIvrO9KK?=
 =?us-ascii?Q?9JixQs0lFlHGGoKv1HPd9uWWeBXdTRb4MW3sweaMZwzFLsS7M3hkBofOLLQd?=
 =?us-ascii?Q?Ory37kZYVLo9ddXUzMFd2tK1pKeVh32RIEzQX6/Kro+aShHFT9hov8j20BWi?=
 =?us-ascii?Q?7yz50F4PGi+vpCKtvxEcSx4ir2vIwNPFlATm9MuZ/aNuWysPL6Y43s1/Kj0Y?=
 =?us-ascii?Q?Cdar8015bh6/7OGYxg0lW2dYDdG0uTbr919XaT2AUgU3Qla5/pPHNvMYO6aG?=
 =?us-ascii?Q?V48qrJwCaniNN70J3uhzwi/fK39cvrM53eoluFmkqC85OowJP/QPzAnu6E5x?=
 =?us-ascii?Q?S4q2wUAFS5yTUAv+OyKuEsRclQVXypgCSPjozLtPU8FijsPj15jTXqiAWH9G?=
 =?us-ascii?Q?K1jGWkMW/59RmY5Zvtzkch3IXU4kfjf8XO5BhQx2o8BiwEH1oIWk7WEfRdwG?=
 =?us-ascii?Q?lDgjc4ajvRT38NVrQSUNhiKuM9HcCPxkfEWcjBXqOR2NiJxzsOdby8O2F02D?=
 =?us-ascii?Q?hcswVt9Lseb6ri3soP0i6PR1Z8ChNygH0RAwCkBKE7ZcZuukl1s6L0nRQkZk?=
 =?us-ascii?Q?d8vQzmCkJOdpBK9XxHY12eII/WmE3b0ar0dwmfC4+9W2ISfmemITZlir62S0?=
 =?us-ascii?Q?76gJut+mwAUMi03hIvZOOoCy7GZscCXsGHiiG3LX5pLW75X9ETTKU2z95q7f?=
 =?us-ascii?Q?3/iAc/AzEdBkmuOK8EfMFso09MU6L7puTWQuSUPZxYxMwPtKiTk2oAXZkuBi?=
 =?us-ascii?Q?7LYZTH8KI2VCB+VXO3p8EMLlkzHjVTzWE0ns6GOYvlX61BkNkny2zp5KamNG?=
 =?us-ascii?Q?MV90emo+6Plv8O9xLgwvitZLlcAwfd9kpkcu0f+EF7NHChfPz5O6+kYLDxSY?=
 =?us-ascii?Q?sQdHuYkxDsOSudAFw4lbdnBFQHPKbUnAb/d25xjdZKd6/RPL/RsXW4G+rjFO?=
 =?us-ascii?Q?e71x73fOTEETpiEFpPr7QMoZGKSQD1YEnhPyTp03uE3ZmAKSmp2+jqBQyiVZ?=
 =?us-ascii?Q?mu4Lg54g9XEdVkH2XyigK7+Yp8WsJIFxWWSNFU6Gsgv3Gf/6Tis3KlRTRLul?=
 =?us-ascii?Q?fOKtO7frl02k8/q+YcOJRrNiwcAXtxnE9nZqSo5fXpEqE2S5tT2049qSlxb7?=
 =?us-ascii?Q?QLqTlqhBCg6PV4wv7hrnEfRAvEzcumgA8NrCwtLs5rXBxF8gI95bC2E5bSxF?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd02776e-7690-4079-5864-08dcb18b2b60
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 18:04:06.7472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CQMP27Q5cUvOaYXyPRM3I8TsLFh54IsAgbxXNAaUrts2QTGZXg4ETcFPBt1bP/UPhJ1N3fbUadEiGnbmH6iuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
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

On Tue, Jul 30, 2024 at 05:01:17PM +0200, Manszewski, Christoph wrote:
> Hi Matt,
> 
> On 28.07.2024 06:50, Matthew Brost wrote:
> > On Fri, Jul 26, 2024 at 05:08:17PM +0300, Mika Kuoppala wrote:
> > > From: Christoph Manszewski <christoph.manszewski@intel.com>
> > > 
> > > Make it possible to dynamically enable/disable debugger funtionality,
> > > including the setting and unsetting of required hw register values via a
> > > sysfs entry located at '/sys/class/drm/card<X>/device/enable_eudebug'.
> > > 
> > > This entry uses 'kstrtobool' and as such it accepts inputs as documented
> > > by this function, in particular '0' and '1'.
> > > 
> > > 1) Adjust to xe_rtp graphics ranges changes.
> > > 2) Fix pile placement. Wa 14019869343 (aka. 16021232320) was
> > > added later in the pile, move disablement to appropriate commit.
> > > 3) flush reset (Christoph)
> > > 4) dont allow exec queue enable if feature is disabled (Dominik)
> > > 5) bind to drm sysfs functions (Maciej)
> > > 
> > > Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > > Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> > > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device.c       |   2 -
> > >   drivers/gpu/drm/xe/xe_device_types.h |   5 +
> > >   drivers/gpu/drm/xe/xe_eudebug.c      | 174 +++++++++++++++++++++++----
> > >   drivers/gpu/drm/xe/xe_eudebug.h      |   2 -
> > >   drivers/gpu/drm/xe/xe_exec_queue.c   |   3 +
> > >   drivers/gpu/drm/xe/xe_hw_engine.c    |   1 -
> > >   drivers/gpu/drm/xe/xe_reg_sr.c       |  21 +++-
> > >   drivers/gpu/drm/xe/xe_reg_sr.h       |   4 +-
> > >   drivers/gpu/drm/xe/xe_rtp.c          |   2 +-
> > >   drivers/gpu/drm/xe/xe_rtp_types.h    |   1 +
> > >   10 files changed, 178 insertions(+), 37 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 268faa1800c4..30a2bf2a7e00 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -785,8 +785,6 @@ int xe_device_probe(struct xe_device *xe)
> > >   	xe_debugfs_register(xe);
> > > -	xe_eudebug_init_late(xe);
> > > -
> > >   	xe_hwmon_register(xe);
> > >   	for_each_gt(gt, xe, id)
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index beb1f3c8dc63..17aedbba3130 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -517,6 +517,11 @@ struct xe_device {
> > >   		/** @ordered_wq: used to discovery */
> > >   		struct workqueue_struct *ordered_wq;
> > > +		/** @enable_lock: protects the enable toggle */
> > > +		struct mutex enable_lock;
> > > +		/** @enable: is the debugging functionality enabled */
> > > +		bool enable;
> > > +
> > >   		/** @attention_scan: attention scan worker */
> > >   		struct delayed_work attention_scan;
> > >   	} eudebug;
> > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> > > index a80ffb64df15..80066f787ec2 100644
> > > --- a/drivers/gpu/drm/xe/xe_eudebug.c
> > > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> > > @@ -2000,9 +2000,6 @@ xe_eudebug_connect(struct xe_device *xe,
> > >   	param->version = DRM_XE_EUDEBUG_VERSION;
> > > -	if (!xe->eudebug.available)
> > > -		return -EOPNOTSUPP;
> > > -
> > >   	d = kzalloc(sizeof(*d), GFP_KERNEL);
> > >   	if (!d)
> > >   		return -ENOMEM;
> > > @@ -2064,70 +2061,199 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
> > >   	struct drm_xe_eudebug_connect * const param = data;
> > >   	int ret = 0;
> > > +	mutex_lock(&xe->eudebug.enable_lock);
> > > +
> > > +	if (!xe->eudebug.enable) {
> > > +		mutex_unlock(&xe->eudebug.enable_lock);
> > > +		return -ENODEV;
> > > +	}
> > > +
> > >   	ret = xe_eudebug_connect(xe, param);
> > > +	mutex_unlock(&xe->eudebug.enable_lock);
> > > +
> > >   	return ret;
> > >   }
> > >   #undef XE_REG_MCR
> > >   #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
> > > -void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
> > > +static void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
> > >   {
> > >   	const struct xe_rtp_entry_sr eudebug_was[] = {
> > > -		{ XE_RTP_NAME("GlobalDebugEnable"),
> > > -		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
> > > -			       ENGINE_CLASS(RENDER)),
> > > -		  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE2(RENDER_RING_BASE),
> > > -				     GLOBAL_DEBUG_ENABLE))
> > > -		},
> > >   		{ XE_RTP_NAME("TdCtlDebugEnable"),
> > >   		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3499),
> > >   			       FUNC(xe_rtp_match_first_render_or_compute)),
> > >   		  XE_RTP_ACTIONS(SET(TD_CTL,
> > >   				     TD_CTL_BREAKPOINT_ENABLE |
> > >   				     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
> > > -				     TD_CTL_FEH_AND_FEE_ENABLE))
> > > +				     TD_CTL_FEH_AND_FEE_ENABLE,
> > > +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> > >   		},
> > >   		{ XE_RTP_NAME("TdCtlGlobalDebugEnable"),
> > >   		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),
> > >   			       FUNC(xe_rtp_match_first_render_or_compute)),
> > > -		  XE_RTP_ACTIONS(SET(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE))
> > > +		  XE_RTP_ACTIONS(SET(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE,
> > > +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> > >   		},
> > >   		{ XE_RTP_NAME("18022722726"),
> > >   		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, 1274),
> > >   			       FUNC(xe_rtp_match_first_render_or_compute)),
> > > -		  XE_RTP_ACTIONS(SET(ROW_CHICKEN, STALL_DOP_GATING_DISABLE))
> > > +		  XE_RTP_ACTIONS(SET(ROW_CHICKEN, STALL_DOP_GATING_DISABLE,
> > > +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> > >   		},
> > >   		{ XE_RTP_NAME("14015527279"),
> > >   		  XE_RTP_RULES(PLATFORM(PVC),
> > >   			       FUNC(xe_rtp_match_first_render_or_compute)),
> > > -		  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, XEHPC_DISABLE_BTB))
> > > +		  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, XEHPC_DISABLE_BTB,
> > > +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> > >   		},
> > >   		{}
> > >   	};
> > >   	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> > > -	struct xe_device *xe = gt_to_xe(hwe->gt);
> > > -	if (xe->eudebug.available)
> > > -		xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
> > > +	xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
> > > +}
> > > +
> > > +static void xe_eudebug_fini_hw_engine(struct xe_hw_engine *hwe)
> > > +{
> > > +	const struct xe_rtp_entry_sr eudebug_was[] = {
> > > +		{ XE_RTP_NAME("TdCtlDebugEnable"),
> > > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3499),
> > > +			       FUNC(xe_rtp_match_first_render_or_compute)),
> > > +		  XE_RTP_ACTIONS(CLR(TD_CTL,
> > > +				     TD_CTL_BREAKPOINT_ENABLE |
> > > +				     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
> > > +				     TD_CTL_FEH_AND_FEE_ENABLE,
> > > +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> > > +		},
> > > +		{ XE_RTP_NAME("TdCtlGlobalDebugEnable"),
> > > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),
> > > +			       FUNC(xe_rtp_match_first_render_or_compute)),
> > > +		  XE_RTP_ACTIONS(CLR(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE,
> > > +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> > > +		},
> > > +		{ XE_RTP_NAME("18022722726"),
> > > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, 1274),
> > > +			       FUNC(xe_rtp_match_first_render_or_compute)),
> > > +		  XE_RTP_ACTIONS(CLR(ROW_CHICKEN, STALL_DOP_GATING_DISABLE,
> > > +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> > > +		},
> > > +		{ XE_RTP_NAME("14015527279"),
> > > +		  XE_RTP_RULES(PLATFORM(PVC),
> > > +			       FUNC(xe_rtp_match_first_render_or_compute)),
> > > +		  XE_RTP_ACTIONS(CLR(ROW_CHICKEN2, XEHPC_DISABLE_BTB,
> > > +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> > > +		},
> > > +		{}
> > > +	};
> > > +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> > > +
> > > +	xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
> > > +}
> > > +
> > > +static int xe_eudebug_enable(struct xe_device *xe, bool enable)
> > > +{
> > > +	struct xe_gt *gt;
> > > +	int i;
> > > +	u8 id;
> > > +
> > > +	if (!xe->eudebug.available)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	/* XXX: TODO hold list lock? */
> > > +	mutex_lock(&xe->eudebug.enable_lock);
> > > +
> > > +	if (!enable && !list_empty(&xe->eudebug.list)) {
> > > +		mutex_unlock(&xe->eudebug.enable_lock);
> > > +		return -EBUSY;
> > > +	}
> > > +
> > > +	if (enable == xe->eudebug.enable) {
> > > +		mutex_unlock(&xe->eudebug.enable_lock);
> > > +		return 0;
> > > +	}
> > > +
> > > +	for_each_gt(gt, xe, id) {
> > > +		for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++) {
> > > +			if (!(gt->info.engine_mask & BIT(i)))
> > > +				continue;
> > > +
> > > +			if (enable)
> > > +				xe_eudebug_init_hw_engine(&gt->hw_engines[i]);
> > > +			else
> > > +				xe_eudebug_fini_hw_engine(&gt->hw_engines[i]);
> > > +		}
> > > +
> > > +		xe_gt_reset_async(gt);
> > 
> > What are you trying to accomplish with the reset? Reinit of some HW
> > settings? Doing GT reset does have a side affect of killing exec queues
> > with jobs active on the GPU which is not ideal. Please explain exactly
> > what needs to be done, and maybe we can brainstorm something that won't
> > kill things.
> 
> Yes, the intention is to set the required registers using the modified
> reg_sr entries. The reason for performing a reset here, instead of directly
> writing the mmio registers, is that to my best knowledge the register values
> are fetched on thread dispatch. Thus, modifying them directly would result
> in having inconsistent TD_CTL values across threads, which would break
> debugging. Resetting is a harsh way of ensuring consistency.
> 
> Of course, I am more than happy to discuss a better approach.
> 

I'm thinking more or less a GT reset but with an extra step which attempts
to idle the GT. If I have time, perhaps I can post a RFC for that
implementation as I think it should be fairly straight forward. 

> > 
> > Also exposing a GT reset via sysfs might be potential security issue
> > too.
> 
> I assumed that since it is only available for privileged users, security
> should not be a concern here.
> 

Yea I guess it isn't truely a security issue more of an issue where ww
expose something to the via sysfs user which can cause bad things.
debugfs would be fine to do something bad, but sysfs really shouldn't
allow bad things.

For example, what is user enables EU debug and a compositor has a job
running? This could crash the compositor. Users will not be happy and
perplexed by an interface we expose doing bad things.

Matt

> > 
> > > +		flush_work(&gt->reset.worker);
> > 
> > Flushing the reset worker here creates a lock dependency chain with
> > xe->eudebug.enable_lock and all locks taken during a GT reset which is
> > not ideal either. If we need to do a GT reset (or something else with a
> > worker that takes locks) it probably best to flush the worker after
> > dropping xe->eudebug.enable_lock. This relates to my other comments on
> > locking, we shouldn't create lock depeendecy chains unless we have to
> > and the chains are well defined.
> 
> Got it.
> 
> Thanks for your feeback,
> Christoph
> 
> > 
> > Matt
> > 
> > > +	}
> > > +
> > > +	if (enable)
> > > +		attention_scan_flush(xe);
> > > +	else
> > > +		attention_scan_cancel(xe);
> > > +
> > > +	xe->eudebug.enable = enable;
> > > +	mutex_unlock(&xe->eudebug.enable_lock);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static ssize_t enable_eudebug_show(struct device *dev, struct device_attribute *attr, char *buf)
> > > +{
> > > +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> > > +
> > > +	return sysfs_emit(buf, "%u\n", xe->eudebug.enable);
> > > +}
> > > +
> > > +static ssize_t enable_eudebug_store(struct device *dev, struct device_attribute *attr,
> > > +				    const char *buf, size_t count)
> > > +{
> > > +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> > > +	bool enable;
> > > +	int ret;
> > > +
> > > +	ret = kstrtobool(buf, &enable);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = xe_eudebug_enable(xe, enable);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static DEVICE_ATTR_RW(enable_eudebug);
> > > +
> > > +static void xe_eudebug_sysfs_fini(void *arg)
> > > +{
> > > +	struct xe_device *xe = arg;
> > > +
> > > +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_enable_eudebug.attr);
> > >   }
> > >   void xe_eudebug_init(struct xe_device *xe)
> > >   {
> > > +	struct device *dev = xe->drm.dev;
> > > +	int ret;
> > > +
> > >   	spin_lock_init(&xe->eudebug.lock);
> > >   	INIT_LIST_HEAD(&xe->eudebug.list);
> > >   	INIT_DELAYED_WORK(&xe->eudebug.attention_scan, attention_scan_fn);
> > > -	xe->eudebug.available = true;
> > > -}
> > > +	drmm_mutex_init(&xe->drm, &xe->eudebug.enable_lock);
> > > +	xe->eudebug.enable = false;
> > > -void xe_eudebug_init_late(struct xe_device *xe)
> > > -{
> > > -	if (!xe->eudebug.available)
> > > -		return;
> > > -	attention_scan_flush(xe);
> > > +	ret = sysfs_create_file(&xe->drm.dev->kobj, &dev_attr_enable_eudebug.attr);
> > > +	if (ret)
> > > +		drm_warn(&xe->drm, "eudebug sysfs init failed: %d, debugger unavailable\n", ret);
> > > +	else
> > > +		devm_add_action_or_reset(dev, xe_eudebug_sysfs_fini, xe);
> > > +
> > > +	xe->eudebug.available = ret == 0;
> > >   }
> > >   void xe_eudebug_fini(struct xe_device *xe)
> > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
> > > index 02c9ba56e752..2f66aa87a0f6 100644
> > > --- a/drivers/gpu/drm/xe/xe_eudebug.h
> > > +++ b/drivers/gpu/drm/xe/xe_eudebug.h
> > > @@ -24,9 +24,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
> > >   			     struct drm_file *file);
> > >   void xe_eudebug_init(struct xe_device *xe);
> > > -void xe_eudebug_init_late(struct xe_device *xe);
> > >   void xe_eudebug_fini(struct xe_device *xe);
> > > -void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
> > >   void xe_eudebug_file_open(struct xe_file *xef);
> > >   void xe_eudebug_file_close(struct xe_file *xef);
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index bc2edade5e5b..b6fc65ab8aa9 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -360,6 +360,9 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
> > >   			 !(value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)))
> > >   		return -EINVAL;
> > > +	if (XE_IOCTL_DBG(xe, !xe->eudebug.enable))
> > > +		return -EPERM;
> > > +
> > >   	q->eudebug_flags = EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
> > >   	return 0;
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index 74813bc20787..0f90416be0ba 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -504,7 +504,6 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> > >   	xe_tuning_process_engine(hwe);
> > >   	xe_wa_process_engine(hwe);
> > >   	hw_engine_setup_default_state(hwe);
> > > -	xe_eudebug_init_hw_engine(hwe);
> > >   	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
> > >   	xe_reg_whitelist_process_engine(hwe);
> > > diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> > > index 440ac572f6e5..a7671722a84e 100644
> > > --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> > > +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> > > @@ -92,22 +92,31 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
> > >   int xe_reg_sr_add(struct xe_reg_sr *sr,
> > >   		  const struct xe_reg_sr_entry *e,
> > > -		  struct xe_gt *gt)
> > > +		  struct xe_gt *gt,
> > > +		  bool overwrite)
> > >   {
> > >   	unsigned long idx = e->reg.addr;
> > >   	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
> > >   	int ret;
> > >   	if (pentry) {
> > > -		if (!compatible_entries(pentry, e)) {
> > > +		if (overwrite && e->set_bits) {
> > > +			pentry->clr_bits |= e->clr_bits;
> > > +			pentry->set_bits |= e->set_bits;
> > > +			pentry->read_mask |= e->read_mask;
> > > +		} else if (overwrite && !e->set_bits) {
> > > +			pentry->clr_bits |= e->clr_bits;
> > > +			pentry->set_bits &= ~e->clr_bits;
> > > +			pentry->read_mask |= e->read_mask;
> > > +		} else if (!compatible_entries(pentry, e)) {
> > >   			ret = -EINVAL;
> > >   			goto fail;
> > > +		} else {
> > > +			pentry->clr_bits |= e->clr_bits;
> > > +			pentry->set_bits |= e->set_bits;
> > > +			pentry->read_mask |= e->read_mask;
> > >   		}
> > > -		pentry->clr_bits |= e->clr_bits;
> > > -		pentry->set_bits |= e->set_bits;
> > > -		pentry->read_mask |= e->read_mask;
> > > -
> > >   		return 0;
> > >   	}
> > > diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
> > > index 51fbba423e27..d67fafdcd847 100644
> > > --- a/drivers/gpu/drm/xe/xe_reg_sr.h
> > > +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
> > > @@ -6,6 +6,8 @@
> > >   #ifndef _XE_REG_SR_
> > >   #define _XE_REG_SR_
> > > +#include <linux/types.h>
> > > +
> > >   /*
> > >    * Reg save/restore bookkeeping
> > >    */
> > > @@ -21,7 +23,7 @@ int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe)
> > >   void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
> > >   int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
> > > -		  struct xe_gt *gt);
> > > +		  struct xe_gt *gt, bool overwrite);
> > >   void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
> > >   void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe);
> > > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> > > index 02e28274282f..5643bcde52bd 100644
> > > --- a/drivers/gpu/drm/xe/xe_rtp.c
> > > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > > @@ -153,7 +153,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
> > >   	};
> > >   	sr_entry.reg.addr += mmio_base;
> > > -	xe_reg_sr_add(sr, &sr_entry, gt);
> > > +	xe_reg_sr_add(sr, &sr_entry, gt, action->flags & XE_RTP_ACTION_FLAG_OVERWRITE);
> > >   }
> > >   static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
> > > diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> > > index 1b76b947c706..20d228067da3 100644
> > > --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> > > @@ -33,6 +33,7 @@ struct xe_rtp_action {
> > >   	/** @read_mask: mask for bits to consider when reading value back */
> > >   	u32			read_mask;
> > >   #define XE_RTP_ACTION_FLAG_ENGINE_BASE		BIT(0)
> > > +#define XE_RTP_ACTION_FLAG_OVERWRITE		BIT(1)
> > >   	/** @flags: flags to apply on rule evaluation or action */
> > >   	u8			flags;
> > >   };
> > > -- 
> > > 2.34.1
> > > 
