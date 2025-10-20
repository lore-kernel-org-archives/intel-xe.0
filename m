Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90B3CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E9010E53C;
	Mon, 20 Oct 2025 23:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iglAEvel";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E9510E53C
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761002182; x=1792538182;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=9ZjgicE//4zV5x9h49UEoFHyoQsZUE+Yc/G3u21eF68=;
 b=iglAEvelIZ81CuL5tABhNYGGgqemnww481zrdV+ps9yRTiSvsKO2QdnZ
 42yZs0SzX+Gm7RGvgNJt8ja2y/z/NsstQekDjpL9cAiiMO5E3Fvwb1jVR
 U0wj+JuFYcqB5R/1nPSF8F/KhwBvbwPWFKpiEK7KyG0Hupm87HgaBZ8l4
 1+ZvVg/MZVl9nZSXorgNJ7SIzBWBBBnfkuHFgdOX69D3Dv92LT4N2HVp7
 h75LgcQX1Q1JZ/850ZMh6rVhsiDuzl/DX0GhNRzzFU8flZ7sIMFIom+7T
 Pj2okr9A1HOxYaj87xs+yR07P1hwSqg3NFE6wedZ+MQb7zVuthEGvpi0b Q==;
X-CSE-ConnectionGUID: czhhcp7ESIiSDSBfoi6ZpA==
X-CSE-MsgGUID: 2MK7S/XKT5WJGD1GseF0xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66960422"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66960422"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:16:21 -0700
X-CSE-ConnectionGUID: G9vwA82oTv6NSO3lwJO8gQ==
X-CSE-MsgGUID: 6J1AJZe8RAKxuUCl8E260A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="182638887"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:16:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:16:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 16:16:21 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:16:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9psfrHYCdsS3530X4QWehV1pJNWSrobPno/oRAjiBwVBxLlFdnyxodFAj0Xym+7czM8+w9J8S2ZqvDikUYvzSVxvV8wxiykuBwQLPFhDPHlArMWIchUu5hb1zxBQiLFAd6kANofCYb2EJ7N3xhXkgiHulEgp2CrDX+VjC+rh2yRNs8xGOfcuR8PzqaoVoZEH1PeNqFAe8J0fip1Z05Y9GSIF+7UR5mrnNj1+UOmeZ/37ZdskO6YJJsjZBCHvt6Iq7kcPeucxx4DDsChY+2FIfVl/9ERvtoJ/lqQlT85nGeveqv/ItzDwrHSyn8DfLhRlp5akOFKJ+hSdj6nhaEZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWobs02XqF0b+IhUHXFRDgYJi7cAu0ixKmc9ElWpCO8=;
 b=esSlVEPiUl65UXito2UXg9qwEQdLCMuYpfb/hbTKMwblGaASpkMsWzckKIB2Rpy9IRXkzsJ1nEGrsb7vfzqGYhVj4SX5OZkV/ovE6C4c8qO5i46WXxTU2PDIiDuXnvTCVolRb87dfkV37N62a2j+0wQWeMfADumAC7DYwxtvnMjYmrIfCaiXSan/8z5aG5JSk8falTwPv1UX9XZ3cjKnPsjFcXPs9ADIke8VkEmfKgBSVDXjtfTLN2paFzbdmBPrKITYLAHmxlnXrxky9bFrLeZEegn8tWeBIGmv6LJECnGKU4srGJkHVGaaGxqaMQh/A3c/jPrTONY77XP6GJkwSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 23:16:13 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 23:16:13 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <afea5ffb-9429-4e54-950a-0c7cae6f391e@intel.com>
References: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-0-d0886d97121d@intel.com>
 <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-2-d0886d97121d@intel.com>
 <afea5ffb-9429-4e54-950a-0c7cae6f391e@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/tests/pci: Check dma_mask_size,
 va_bits and vm_max_level
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 20 Oct 2025 20:16:08 -0300
Message-ID: <176100216827.3231.12518242353810286320@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ad167a-d45c-4cec-a6c1-08de102ea9a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWswU3hZY0RmbURNSEtmNEx6Yk1PYy9BbWRMakJGVjA0aVR5MDZuN0o3NWhV?=
 =?utf-8?B?N3NXY1IvekZUZzZ5M1FjbGFudU9nWjBKRVZ6cjhhSVRUOEl0QUd2T1NXQWZX?=
 =?utf-8?B?VHVYV0JBYlhEWGFhV3laTWNmdWYyR1ZNREU3MXJlamR5YnBLeUVWL2ZCZnlk?=
 =?utf-8?B?NUpWajZScUdYSnhPeWE0MTN6VWc5amFITlpQaTdNeFZPNXlSNlVFTUNCeHlD?=
 =?utf-8?B?RVA5TzdsbkN4R3hpcHhDTHAxU2FJSnRqQ2F5aDROTXFqQ1QyeWhBNDRvSXlB?=
 =?utf-8?B?dTJxRERyc1duRHpIYXJoR2x3MjFQc1ZROGhqeHRsWHlGb1hTQ3Y2NFpsK2tX?=
 =?utf-8?B?dm04ekEvNUg2Y1l1dzlwcG9LMjBybkxGOGFIbjY4VU5Ka2pVUHJYMXZGRWVK?=
 =?utf-8?B?MXJUQU1sR0VwZElSUEJjR0U3ampRR3p3TnhWWm96OHYxeUQ0Z2d4OWZrNEF4?=
 =?utf-8?B?bmZSL2lnWk9oQjQwTmZhQ2RTRUp5TllvanJxLzJqNkx4Zk9TT0ZmTzlHM3h3?=
 =?utf-8?B?M1p1SEVkK002WS9tTmNkVTgvS04wSll2NFF0OTFCNkFyc1R2cFREMFc1VG16?=
 =?utf-8?B?QXZmRElLcXAzeUU3cXVPVllHQUpDdXNWTjlrQnJ1Z1hJaDBuV1gvZXJhUkFm?=
 =?utf-8?B?NmVsNDYzbGVKNlFsMmRUMG9qL2pnL1ZrUHJhY0RRVXZHcWdpLy83NzZOMFZD?=
 =?utf-8?B?bmQ4UXdJRUxYajhNZDNING81bkFzWlNaY3VPNVJUcUNXUENOMnVGOGtVVHVt?=
 =?utf-8?B?eTJodGQyVUVKV09GNlU3YjFWaFhzTDBvVGhESzRsckVseWc1NXh5MzlGb0Fx?=
 =?utf-8?B?Y2ozNmxtZ2xtUXVjK3ZHbkN6Nldtc0ZLNHhPaWk2SUgzRTBhdHhXZjE5R1lm?=
 =?utf-8?B?YnhjRHJvNUZiUG1IdGJ2S05xOGF4dmNidHhlN2lEZzlJTk5sNkdSODlVbzUx?=
 =?utf-8?B?a3hxZEtQc1dHS3FKWXVGcmZ6TTI3eWkvSHhpYk4za1A5cXNiOWZCaTBDWnRt?=
 =?utf-8?B?MFl5S1B1Tm9sZTVZQ3hWc2NLWDhYbFFDZzRzUUJuanFVaUY0S1Qray9RNFpN?=
 =?utf-8?B?SytnN2dwazRyNm9rUXJGWkJPc05reTlmV0tRSysyM2ljb2dqMDc2eDhnMDd5?=
 =?utf-8?B?UmYxcWU3dUZQeGNQd3IrbDhnbEVvcDFxRG9xYTd2eDRwYzZ4NzExWWViT3Q5?=
 =?utf-8?B?S0dSbGJweE9VMFFrcmF0S2pvY2tUQTkzanROa2NNOFVWRVVSUnlnN1FVUE9G?=
 =?utf-8?B?YkE1eFVLQUFUdEpzKytZaW5PTXFLb2plcUlnYlFudGJZZ3JUWkJ4QzhDcW95?=
 =?utf-8?B?eDRpemxRSHp0WWQzcExyMGluLyt3RkhOc1dMUDBneDhsLzNFN3hYVlNvVWhL?=
 =?utf-8?B?RFVDNkJMaUpWa1VyeUVaMUpDM0V5cGI1THBSZEh4S2lvTVQxUU41V0xwRkhl?=
 =?utf-8?B?aTVYWDFmb1V5Z1pXMTVpOVJBbDA1UmRsOVJQWUI2SWhsYlZLSEF5V09UTGJV?=
 =?utf-8?B?UGlabTFjUE92bkY3ZG5IOEVXMDV0bnMwVy9xMUhHUWhLdFg4dnJFbDVmd2Q1?=
 =?utf-8?B?MmVScko5NUpwblkrUlk5QS9SRkV0YWNDODNOT3JoelEzOEh2TkRldnpSWkd0?=
 =?utf-8?B?UUovMks0V0xzYVBOTGhJZVBDMjlNMmcrVzNpNzJHUUIxenZGSzVnSTlaUjdY?=
 =?utf-8?B?ajM3OUJIK2VoZGM0VnRVWndQOUxhQThrZGJ0clliZU12aSsxNlY5cDhGNGMw?=
 =?utf-8?B?T3BBci9sZUlPVFNFWnRpMlUwQjNGNkJHeTAyRjFldk5iaVBUdkFSNUlzdGZ4?=
 =?utf-8?B?ZnVFSmJaTEFVQ3pRbTFHaFoxQlpmQmdBaEQwWmtkbmswRENybVkxTElOblA5?=
 =?utf-8?B?bXNiK2FMU0dWUmhsc1FqMEd1WVJ3V2VsOHFEY3pxZ0ZRbFNkOTg3My8rbFUr?=
 =?utf-8?B?TmJ0V2tLNkxuUFhodTlvdHFlWkZmVUE0VUt3TFpEVEZweUFKeE8zelhnMEdH?=
 =?utf-8?B?ZkdKQnNWc2FRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3FMTUo5bE1wTnY5NkpYaEoyYjF2MzVhSWtUMUZ3anlKOE1aNDZpQ1E2OWpv?=
 =?utf-8?B?MHVlSWg0d09QL0N4MzlsblFSOHpUSjNhM3JBaGd3SWhRZUZFQldhM1g2ekZM?=
 =?utf-8?B?ZGxjazBXSS9HemE0RExEdCtIYnFRN2IwRGJYM0dPeUZKVVZsdUdOdzVydWk5?=
 =?utf-8?B?K0ZaeDhXMnc2bklLS1E5REQ2N0d5M0g1b0VDUEJDNi9jTkFmL1hhcTYrRUNH?=
 =?utf-8?B?VUZFVzVNZkJmaU4wbUo4OHZZWGpYN2RHWUoxS252UVprMi9mblY2MENLTTM5?=
 =?utf-8?B?VHVLVjI5aVpsUU5FZ3RYNTliTCtuajNyMjFGQjJRbFBUemNPU2QyYy9uUUlt?=
 =?utf-8?B?Zi85QlBGSWw3MXMwZUJ1aDhGcnVNQlJUUUhSSDBSS0dzZWpzUmZBdXdTOUF6?=
 =?utf-8?B?dnFCOW50T1d4TTgrVG1lK05rL1IvVTUvdzlzaE1BTmdrdjlEcDAzRDc4M1k4?=
 =?utf-8?B?bHFyUUo3S1JYTU04TUc5dXh2NWhpRWF2SndJMVIzOERjUnpNaUE0OC9seWFU?=
 =?utf-8?B?eU5MS3UxSjl4dlRIRjFNaFQ0YkFlTk93eFIwYjRJQmlVNC9USmVhQm85dmZa?=
 =?utf-8?B?M0E3YlpWU20vVGZuUDdEZ2I3ekhiaGtnU2R3aTEzbjlEY0hlcUdGdHRuU01m?=
 =?utf-8?B?VFU4eG9TQVE3c1N4TFZhcHEvb3U0NmI0a3NOZ29EWUdTczF0SkhOaDhlZ1dm?=
 =?utf-8?B?V3AzcGUrV0lFbW5TMy8vSFJEdzF6V3RoOVl3RCtUd0E3OVlKOEk0OGVaMjVP?=
 =?utf-8?B?MVZKMnExOWllejNmVGNmMVBBZ3VBY0MwMnc4aVlGUTV0ZGd1a3NhUEVjUDZZ?=
 =?utf-8?B?L0VOeFJpZXAwb1o1bkUyei9YdmZLOXFXQ2J2cWt0cFlFYzRDOG1JejVqVmVr?=
 =?utf-8?B?Tk5QQTgzejlTZk85cy90TWtsSnhpRHRiQVplbE1yOW1SclBlWTRuaGlTdWpD?=
 =?utf-8?B?bDRQOUZjdlhKOW91U1FNbTVGa0lEYWs2ZVI2ODlLZEtzTUgzNHpscU94U1lQ?=
 =?utf-8?B?bC9QS05mN1FyUXJ2bnpYMm1tcTJtZUEzcGRkNE5DR1lCMVBjWDYwN1dua0VS?=
 =?utf-8?B?dDVUL2FWd1F3Ymk2N2FiQVA4U1c4RDl6aGREU1h0YjRBdnplNnluN01qWFJq?=
 =?utf-8?B?UFJIMHZGV1NHY0RnQWtYS1FXZWlFVmkwbUVjTW5NWTc2TW94cVN3WWlKeWpL?=
 =?utf-8?B?SE9Fa0VpNzZFUGM0bWowZDFLbVJ3a2xnSFdNbjZ6blE3U1cxZ05GS0IvSVho?=
 =?utf-8?B?R2c5MXlkZTZ2T2EvdmE2RWlWdm9pR1BycFlIUVpDNDk0Z3N6VjRrN3lpWVNp?=
 =?utf-8?B?WlNSTlp5WU5VWnA4R1VJRHJ5NjBiT2gxRnZaYzBHa3VhSTIwYzY3SlBLSlkv?=
 =?utf-8?B?TWFKRDhqMHNKSk54TjRoemhoaHhVZGtselZvN2ZCNE1YZWM5dURHVUxPTTh2?=
 =?utf-8?B?RURERmVvM0k0Q1BtTzZoVXB1S1JBdW5uVjk4ZjVQelZTSEdKVFR5TkhXV1Fq?=
 =?utf-8?B?bXdRUWFJemJqSHZ0VXZuUlVmOHBTRnludEVFQ1d3STZqZGdWWVhrekgrclpR?=
 =?utf-8?B?ajdUNFpOUTBqT1dFOEJGbGFTQVVMck1OcnY0dUxFRWlYZUxWKzBtVmtsMUtQ?=
 =?utf-8?B?QnFEZU1zd0poUWhCSVFBQTVVOHJNSVMzYVZ1WXBHN1pTL01yUzViR01aQWhh?=
 =?utf-8?B?cTlyZ1BXdkNONXlxdHVsQi80dm4yUTlQVUhXcFNMbFhieEp3QjRUMkFVRzhE?=
 =?utf-8?B?KzBJMnpvNVJWMnpFOC9QRWZlT0pPTnNrdWQ2ZFdwU1VzWlN3QU9BcGlNMUpz?=
 =?utf-8?B?SWRtNVB2NTVjeU9ZVVVDMHQ4Z0x2Z1lxWXUyZGM0ZjZ3ZXRZbjZ1dURqdzNo?=
 =?utf-8?B?NWhjS2s2Z2tRY2dNNzJuSTNlc0ZEZmFpTEIzcEtacWw4dmVUU3h1NzIxazBl?=
 =?utf-8?B?d0N0SFowWVFvYVRRN0thOGhVNkhOTDRET0g4c3N6eTJLUE03S1ovZEpnTy9E?=
 =?utf-8?B?dWdJaVRUdlZQbmtucFFwQ1V1UVBJNDdjd2NIU1BIdzcrcWZHNXVMZDV5SjRk?=
 =?utf-8?B?VDVld2ZqR0NJQ0UyZS9sc29xWDhJSlVJNHU1MVpBY1VIZCtyc3lySXZZV0ky?=
 =?utf-8?B?QmNwWXFhell5OWVwZE5XNDAreHFZbXNkRFV3eUNQdGI1YmM3QzJBTm5ISzBt?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ad167a-d45c-4cec-a6c1-08de102ea9a2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:16:13.6779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fb2RiKmypHzMP2e5gWs1DIz2zl66GDVvNjQZ0hsHw6aJKIkDjzy709DPyuHNvG88ZCVYfpJiQGz2pBlveDZswg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
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

Quoting Michal Wajdeczko (2025-10-16 16:02:54-03:00)
>
>
>On 10/16/2025 7:49 PM, Gustavo Sousa wrote:
>> Members dma_mask_size, va_bits and vm_max_level of struct xe_device_desc
>> are all expected to be non-zero.  Add checks for that in
>> check_platform_desc().
>>=20
>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>=20
>> Michal, I added a "Suggested-by" on your name because of [1].  Please
>> let me know if you are okay with that.
>>=20
>> [1] https://lore.kernel.org/all/43c824c1-dbfc-48b1-9c90-389e3bf24c9a@int=
el.com/
>> ---
>>  drivers/gpu/drm/xe/tests/xe_pci_test.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe=
/tests/xe_pci_test.c
>> index f09efb523b7e..a4dbc8ddee43 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>> @@ -50,8 +50,13 @@ static void check_platform_desc(struct kunit *test)
>>          const struct xe_device_desc *desc =3D
>>                  (const struct xe_device_desc *)pci->driver_data;
>> =20
>> +        KUNIT_ASSERT_GT(test, desc->dma_mask_size, 0);
>
>nit: maybe check against 0/false using:
>
>        KUNIT_EXPECT_TRUE(test, desc->dma_mask_size);

I think I prefer to use KUNIT_EXPECT_GT() because the values are
unsigned integers as opposed to flags/booleans.

>
>> +
>>          KUNIT_ASSERT_GT(test, (int)desc->max_gt_per_tile, 0);
>>          KUNIT_ASSERT_LE(test, (int)desc->max_gt_per_tile, XE_MAX_GT_PER=
_TILE);
>> +
>> +        KUNIT_ASSERT_GT(test, desc->va_bits, 0);
>
>        KUNIT_EXPECT_TRUE(test, desc->va_bits);
>
>and try to test the upper limit too (where applicable)?
>
>        KUNIT_EXPECT_LE(test, desc->va_bits, 64);

Yep. Sounds good.

>
>> +        KUNIT_ASSERT_GT(test, desc->vm_max_level, 0);
>>  }
>> =20
>>  static struct kunit_case xe_pci_tests[] =3D {
>>=20
>
>but not a blocker, and still move in the right direction, so
>
>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Thanks!

--
Gustavo Sousa
