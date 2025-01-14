Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B84EE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 12:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2527710E1FC;
	Tue, 14 Jan 2025 12:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeQmRDZn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5873C10E1FC
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 12:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736856085; x=1768392085;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XRJp0gSfxrhqIx7ARQS3/Aon0LFPSGGQIoh8/lVLruE=;
 b=EeQmRDZnyaRqTMAMxofEwzsAj33VY7lIWQ5TpByhJH/65GI9TfFLA1+2
 ClDA2rJvt+cEsYS4a/sG1kuH/iF1A7TOCHjVl518pec4wYoCq+3IZM7WZ
 TC/19XmM8P9JHcdY+YUhvIqlFkB6Si6ob546fG+trx0lb+EBsVCIwzdWQ
 TQ5iYKl9V6fUYxa180LchR2R5it/oqBCaOmSF9UYYZ885eGXabsx+d9iz
 rf9HBBeHxgVEg0+L4v0snZRp44iBNFtntymbfddOWjprAvJqpFizrPUG0
 NZo9NmabG8nqKsgHjzBOQUQlQNnbCGsiX8OVf6hWdMwtqSGup2vxMB/S/ w==;
X-CSE-ConnectionGUID: psk5Av77RaS0ThXpTgA59Q==
X-CSE-MsgGUID: tUE54lLJTDm+MQeLtNR0jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37302982"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="37302982"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 04:01:25 -0800
X-CSE-ConnectionGUID: i3fRb5RkSzKzMlmweznNAQ==
X-CSE-MsgGUID: 2zIRX0pPRSukrBgA3zP0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="109769317"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 04:01:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 04:01:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 04:01:24 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 04:01:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGL0VD7Qyx6jp5c8BB57DZc9qygpvhHSL7hV/nAKxKfaoPAVHgPxjL1kg13Xo2PXDudaODjdLCbv7Du60XozOTQoIR8u2Ukxa9czbwefe31chdEqcxAE0MLZf/CrSSDn7BSpw1TypO94jwzvQvB2Cl9B0lEly4LbPQhptzHwyRYYoZfxhgsRqzLPHtqEV9nKUzwIwW1LRCwvutnoqo3iAFAbhCFtANoH9BIm9zmyoQhQl1iNl6TjLadX04DKgqHcBU91uHhKyzcUMUa3CiaAhMdj5JfBTF6ba/yFn2X9z8BnfDVPh5sF+oilzWqGMsVjov271td12P/dJFR4O9RnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7n5oe1XZQEHKqNi2H+y8eLaCT3t6zRb0MXYnxUBJQQo=;
 b=bdZlaDJwny/ACMErYONJkMx6ieiakxS3v1O2u5QTktpiGYKpmMLpoCijTQSg5KKQZrSEklXqbx2xkwx7fXy1rhpFJSH+hj4MdC3NCzWHZuvzSLv9fKbew1Zlogv8wKy35nrVcAQeRkzQqJHjCnTEPiuC9GQDKJPwuqVKwDNmC9g5E9EFI3ILe4HpWugwGZeMOCFfXKBw2DEj/Xkn7HuKcRXr5QK/UxgEzY1b/JLpE6ZqsSU3Z772dR2XJxVsD8JI2aUHhk+PA4p1Qx/IzQHKsiDDvOBim9JtxytXJBWvkgUToM5XsIFxscVlOLkL7qkY8IuxtfVbtFxpHCJwCBuoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV3PR11MB8459.namprd11.prod.outlook.com (2603:10b6:408:1b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 12:01:05 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 12:01:05 +0000
Date: Tue, 14 Jan 2025 13:01:01 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 10/11] drm/xe/kunit: Allow to replace
 xe_managed_bo_create_pin_map()
Message-ID: <sxk4ltbimkufunifgeaiczx64bkrsd2muvxdqfz7frixuyg7tv@5bvoufaixzpu>
References: <20241220194205.995-1-michal.wajdeczko@intel.com>
 <20241220194205.995-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220194205.995-11-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR06CA0139.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::32) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV3PR11MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 121e63e5-a46f-48d7-7f9b-08dd34931fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2g1SmYzczIvYkRtR05nMk51QVBEaHF2TWM0eFRHOGZLRkZxWk4yZUs5TkxC?=
 =?utf-8?B?Rnk5K050VW10ajY2a0ZuUG1kRjVVQVdGVHdydU9wNmEvWm1RaW5EdERjVENO?=
 =?utf-8?B?U0dGYU5zak4rbUU1YWRld2VGakdIaUFVNGRUV1NKRGZPdDVqZTBSeVFaN2ZI?=
 =?utf-8?B?NndCa0tialJlcmVvcEhidHZQanI3Y2dscEdpZzViS0xUZmlyZnNQczB6S1BH?=
 =?utf-8?B?NEtDekpBdU4xOExUVTh6aVplNkZzbE5XWGtoR0JRYTJpNnhBUWcxOFFjNDBz?=
 =?utf-8?B?UnpPdUU3ZkZJVHZ0c2R5SnF2YWFWejdHZ3I4a0w0UjlGNDgwamVxK3EwWEcz?=
 =?utf-8?B?WlZxQmtxVEtDR2llM0xtTGVJS3RLZlVsSXpLME9Nbm9EaGtabXMvZE5ReFkw?=
 =?utf-8?B?RndBQUQxNWVnTFF3Q3kzbjRhdlU4WjNpcmIwUVRGOTNWMUx1ZDdtQXZBS0xN?=
 =?utf-8?B?cUduL1JTQ0lOa3grK2s5T2lpa1M0TXA1NTIzRm5rWnNDY3lubDFRSm5LSzFZ?=
 =?utf-8?B?anY4Nm9YaWF1QXFZTm94SldPMEovaGpnMFlWRFU1NVE1ZG1zYi9EbWY4cDZW?=
 =?utf-8?B?Zlh3cVd2RndJdm5xVkEwRjNlNWVncy9SRytiY3VqT0JtUWdSbzEzQW1Sejdt?=
 =?utf-8?B?WmtnV2Vwd0NZbWxtNFV0Z2RJRnZvaUdnYnA2Ukd4SFpDZGlIc0sycnVTbjA3?=
 =?utf-8?B?TTN2dm54Q1VZOVdZYnVGdzk2b0ZxaDh3cDNDS293Q3MyQmNoTlBJSUFnNUdB?=
 =?utf-8?B?N2R1YzRHeUpXMVQrTHIxTG9qWVhTdjBHdWtKSGFCNUN6MTlZbk95K29xZlBD?=
 =?utf-8?B?SDh1Z21haDk2L1Q3azB5R3c3bktER20zbVJJYjNWL2loNC9ub1BxR05vQ08y?=
 =?utf-8?B?NG90UGhTZDQxak9ZMFVVOHdPQkxzS05Oc0RabUUzR2phdXRtTkx5N2gwU09v?=
 =?utf-8?B?R2NRWXp3TUhPaDM3NnlJTWZSeWlXZUNTNmMrQW9CeUpQaGhhV05yWVA4TlJu?=
 =?utf-8?B?aFp3QkVjdTlGNTY2U1pSclJndnQxZVYxemlxYzBOWTJ4cldwVUJKZkUrckIw?=
 =?utf-8?B?d0VTWWhXZ2k2dUtlS3orVC9EM3hBY2xKV3ZocFh4REE4U3pjQmZTYS9qYmFy?=
 =?utf-8?B?TW9OSWpGYlhSODZHMVVQWTdCdWIxYVlnQVU4ekhSK3dBSzVhTE5SVlFXUlRE?=
 =?utf-8?B?Zi8vaDJab2lxRGxVTjRhNHRlOWwrYW9PZ0s1b2d5OUFGc1pEVVhXRUlQc1F3?=
 =?utf-8?B?RUxIYnZzNGVSNlVkdG9oWkV6RzdkRjdtZXFkMmd2Zm00cm9jS3ZVSzFSZnBY?=
 =?utf-8?B?Yng2bHhyMEc2VDNkNlI1cEl1SHpsUUVhcXRxTURpUHBZRGdCa0RXUEQvNWM2?=
 =?utf-8?B?QzFHYXY0RVZuQ1pTUm9CVmFXL1E0S1FQUGJqNUxxclhCVm41UXNnOGpVd3JP?=
 =?utf-8?B?Q2JzMFpHdVZpOVM1WS9YZjRERzJTdEZyYVJUa2dkZUY1N0tQblFEcGMxWFNR?=
 =?utf-8?B?NFJBd0wxOTEwcGhVQk5TeDN6a0F3Mm94R2NLVE9WV1M5eXBvQVhwLy82UnNl?=
 =?utf-8?B?YXdyeE1sTmpaV0FQeGVTMlFZZ0VmdzJZc2pYZTJ5eGhRd2FvRU41OGhQNVRu?=
 =?utf-8?B?SDd0SkROTVhsWEhCK3RacFlsZEpKSS80MkEwVlRjZ09MTllzb3FrU1M5Rk1E?=
 =?utf-8?B?cFNiZ0l1L3luQ2FGOFFzSnRSUFpQRmtoSDFDQkJORGF6aDdWVmNTZmJRMTlF?=
 =?utf-8?B?K1d1QnVjZlJodC81c21iSnNhdFdCMHZVbllJTDlMYUZ2TEZJSDZBeE0xRXhr?=
 =?utf-8?B?VEQyZGNSSXI1Mnd5WXgvbmJ4OGVzVnlyWGFyNURlZTZuR3Zwenh2S3JlTXlv?=
 =?utf-8?Q?2BLLsxgy/uwWt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTNuNzUwTzB1Y0Q4TXhrQU9MbTNFNU5DMzFlNG1uWlVyUElMZWQ3UGM5VG9q?=
 =?utf-8?B?OXkzQXRYdnp6NnVXMXhIVkl1SXo5N1NhdEhRZjN1eEN6S2xPSFJBamZDM0NF?=
 =?utf-8?B?eEoyYld2bkdQWWtDVHRJYVpyUUFOZW9JcGlpR3didHpIUkpLZkFiRUVvbHJM?=
 =?utf-8?B?bUZSTUJJRFp6Q3NQTmdrQXh5eE9ldFdXQVZNNWpZUWQwN2RjRWtXLytHalFp?=
 =?utf-8?B?dFZyT2NaQXV5allNMnBBMGdWeG14YWpSZ1JsUnN1UXFLcklibnRWUjBhNG90?=
 =?utf-8?B?enVBZ0RBWlozUkxQbWhrRDRGd1F3N3ljVUNtS2lNVjJMU1h5TCtGeGpoektB?=
 =?utf-8?B?WjgzZEVyV3lrMnJLVjZTZDlkNkV4U0RJU2dHNTJTRHl3OTUySmhuZ2pwUGpX?=
 =?utf-8?B?M3RVcUl1K0dHaGE4bWF0Mnd1dHVvbWpvRHlBekE2bERpUTIvdW8rNnlGbEo2?=
 =?utf-8?B?SVoycUZxZlY3T3JqN3Q5eDVTUDV0UXJsRTI1Y20vY1lFbStSb29ZRzhXL3Vk?=
 =?utf-8?B?ZnZCWDdhdWlkakVha0RyWlI4eXFLQTN2bnNKeU4wWEtZNWNGbzhpS0Z6bys4?=
 =?utf-8?B?dGNISGYvN0RtcisxOXkyaFdHWU83alZKdWNYU04yWkcwS202TUVrQUhVRjU1?=
 =?utf-8?B?azI0bmJRVDVVUjFWQlJVRmN2N3gyTi9CVXBiTHVHcEdJRHBNa2hvT2xiQVpP?=
 =?utf-8?B?ejBsNTh1c05zVktURTF4d0VUTzB1U2w4SGNhQm1Ud2xJa2VCaGhMWjFHRSs5?=
 =?utf-8?B?VnpXcFd1dW5rc1Y3UDArVzNMOExnenRaTlRaVTlkMFMwNURWVVluYUM0Q2U3?=
 =?utf-8?B?T1hLYnJzVlU2KzZJQmh6REVicWxjS0JLenN3N0tOWWZjTEQ0UThZQ0VtQzZZ?=
 =?utf-8?B?eGlEdWRFdVJJQ0VpY0hkRzRKajlrdExtMFZzWTBNdm9tM2sxNXV6aHNZNnBy?=
 =?utf-8?B?WnRMUjdGUS84Zmd4QWtKMHlLT3hWVjVYV08xRDQ0YWM4WWo5UmcwT3htb2sz?=
 =?utf-8?B?UDdJWHVEK3Z2K25ISXZtdWdEcVpva2tFZFhUdUZ1UU9KNG5kU2pzZVNGeWdk?=
 =?utf-8?B?N2F0T2hrd2R5ZXdaUTRoMzAyTXBwTWgwVGVyWDIxWWZVVzRPTUFjS1FGejRW?=
 =?utf-8?B?VUU4dnhyTDR3c0E1UE5PN3NWSlVaRjc0TkFKb2VPdS81ZWZjZzRQcEEvaGZv?=
 =?utf-8?B?WXdUeTd5bjFnT2VIMGl5bTNPMldWRy9hank2OUxiT3dPa2lQZlpYWmhSaXU1?=
 =?utf-8?B?am41UFZOam43UWFMNmJ5SlJFMEhLWHNKVnFQMktZVzByazNWZVlvZVZTYTVB?=
 =?utf-8?B?R2NwQndjcVZwcktLalZsNlRFRDlnQ0svK0ZlUm9UUGZ2OVFDQ3htMzY1eHBs?=
 =?utf-8?B?S1ZXOUpWODZQc05qUWF6dmloYmdaOXE4WnlGZDZnOXJ4cGh4WkhRc0pEdkgx?=
 =?utf-8?B?Qk1SNUY0ZlhBbE5pYjc4ZlhnUVlLcGYyM3ZPVDdqU1BiZjM2bWxmQ0xZZzZ3?=
 =?utf-8?B?WElOU1hxbStvZmcxT0pDYWhCYXUzQkgxQlhPMUdGWnF5cFBaeVJDTFVmdFNh?=
 =?utf-8?B?dFJvM2MwZlpPYWlqRkYrWTVITzVWY09hdmxIQzRPejZmeXg2L3JYZHBLMUFE?=
 =?utf-8?B?Q1lrRkEzNFBPcTVnb0VsMmRONWhPZDhrN04wY28wMVcybmJRcThlbkl1UjRs?=
 =?utf-8?B?NE5lTTNyYTAwWnhZby9ZeEVlTmk3WFIxc084RFE3Vm95WlNHSVJsaGJwUXJD?=
 =?utf-8?B?STVlVnBIMGd3NTE0Y1RRSVVQNWl0MWZ2NjNvL1FIYUZBM2FGQ1orNjc0RXdL?=
 =?utf-8?B?cThKbFo2Q296b1JLMitnbkp2M1oySkVPSE9xQ0x2VXdXRm9TT1YybkhzbEhv?=
 =?utf-8?B?SlJQLzZsNHJ2YXQrdUFkZ0cyTVpCck5HdGVQamhGNlg3ZmdyVG5nbStvU0RL?=
 =?utf-8?B?T2QxMHpQaFo3SEE4SVN5dUI4Sy9qVEwzeGFERkRzWmQ4c2NVQ3R5bW11a21K?=
 =?utf-8?B?dElmaHlRSmhUSVN1SnNhUGVuK3daY2dvNXY1UGl5OTRmZ0pmUmJiSXMwMFpr?=
 =?utf-8?B?Z1pNN3kzK1BHcTh4emV0SDJqdXpXSE9jNk5mdlJoeGdOcmJ6cVVqUEZxQ1dI?=
 =?utf-8?B?MUw0QlNsSjZPUmlpdXdPTU81SC9pWGRzdTdnY0JENks2bkhpbERtMWtBNE4w?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 121e63e5-a46f-48d7-7f9b-08dd34931fa2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 12:01:05.4703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+QdxI6DNxYo6R6F7sgjhu35rfmWzOq8cEkAHsgoSLDo4eOZYBXcolPecyu04gaKeNO0YU0dzX67Zm8q0oSRSWZBdHRXpAVktfKe119iUCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8459
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

On Fri, Dec 20, 2024 at 08:42:03PM +0100, Michal Wajdeczko wrote:
> We want to use replacement functions in upcoming kunit tests.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e6c896ad5602..32ec026df429 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -15,6 +15,8 @@
>  #include <drm/ttm/ttm_tt.h>
>  #include <uapi/drm/xe_drm.h>
>  
> +#include <kunit/static_stub.h>
> +
>  #include "xe_device.h"
>  #include "xe_dma_buf.h"
>  #include "xe_drm_client.h"
> @@ -1781,6 +1783,8 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>  	struct xe_bo *bo;
>  	int ret;
>  
> +	KUNIT_STATIC_STUB_REDIRECT(xe_managed_bo_create_pin_map, xe, tile, size, flags);
> +
>  	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
>  	if (IS_ERR(bo))
>  		return bo;
> -- 
> 2.47.1
> 
