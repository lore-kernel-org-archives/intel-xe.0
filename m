Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E93CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 15:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C740310E7D7;
	Wed, 22 Oct 2025 15:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLPjG+is";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A9A10E7D7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761145837; x=1792681837;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tHe8u6+vSphyNBxN06iuAYmNxoNLoN3UlHx3KlwnQX4=;
 b=jLPjG+isgSh/v/nm1FnJRr1Sa/Du3/WcwKAUQXTyGdpIg4TrYQTBaq5A
 2TWEpOUYu8uMbifOYtpZ/s4Ngqm7U7lU1bOuiBTtkbnXc+k0N2QEZrU5X
 1lnYmouD+/ek9VWDdHpycoCYw1mORoVTbCdGH4O4RihnQAnpzaVjqjz62
 vX8KNwTTGE7wIx7LYXHryJ9AgyaTGkp+8tokv2PXI5QqcEzXVQPxSStuC
 UakgOfDs2GM6KWPZJzFm21QSZluUDqHe3T/YIMFm85StxAfdnQkvoZx6P
 87rsFF8mG7ge8US3SzBs3YN1ZJ0o5NuXRMI5ZCfXieG27TRsCJppd8Zbh Q==;
X-CSE-ConnectionGUID: f/IgQ/WRRTS1g8rkIcZy5g==
X-CSE-MsgGUID: fT4EzkFNQGyyyxRtkUhCJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63393202"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63393202"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:10:37 -0700
X-CSE-ConnectionGUID: ry0zYEX+TOCfjr8e20sx+g==
X-CSE-MsgGUID: XgG2AXs8SriMWqAwr4Kz/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="183111334"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:10:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 08:10:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 08:10:36 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 08:10:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyjwkoKjJMXHxJRFnG4LOe2pI9zMWrbT6M2nl1/o8032HY6kCO1X4uqghkzxBaGBHciuZP/aDvAV4A2MMr/UEN6Rqb/8m616DHadRdk3MAXlEBZG0KXUhXn4BahKP1AzmCKFYFZxZl7ltN+gidx4PoO4UEIgsm0xGzM5n4HBA0hmOnGAIwGAeVMPC+NeEgaf4IeTAj0+3YTeVg0xXrKTJxD7yq7kEyj6jyIbf5xwQvJV9AEaX8OtN7Hf6+8rabppUlx272nZ9zga0zxo1KnKajXlClXQkFX5bLW3IyMSo7E5Q7WewqKzbGZT4TmORV4wg57hxABCcgzh5pwm89gKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbYBuwAmR/KbyIQBUs5EtGUbIdRZ/JGLVi1wZIdxTCk=;
 b=fLx8yePckTu+hgyjGK9jixMUwEC5UIG+6eHBcWHoUQ0oNCeqWW2QL98l4TIJMiBzAW0nDNHl36skasw0Tqa/KtxYiTuPWQtBE4dXsgry6sNXuTjkVLyyOnv4jro/t8cJIPwr87QzsDA+6A5gHTJEhpp/CfZ8VS4lOpFhEsiKu9pF04StnkTQJpP57lvO9vwyesQxtWjHQ9NuCHhzmtaQoGzNr253zdINQOqm2tt7DHRLLvoqLThNeqnSDCW0Pp2VGUmsHteqsWdE/ZUKXE1ydWPogEr7ZDq1RB0RBdnsP5bUYKTPMr8SYjxwAz4VYCL7yGEjEC5+z+LX2KfML0qWeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7956.namprd11.prod.outlook.com (2603:10b6:208:40b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 15:10:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 15:10:31 +0000
Date: Wed, 22 Oct 2025 08:10:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, <carlos.santa@intel.com>,
 <thomas.hellstrom@linux.intel.com>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH 1/1] drm/xe: Avoid serializing unbind jobs on prior TLB
 invalidations
Message-ID: <aPjz5BHrNbUBUk8L@lstrano-desk.jf.intel.com>
References: <20251017165217.493595-1-matthew.brost@intel.com>
 <20251017165217.493595-2-matthew.brost@intel.com>
 <f7f83835-adaa-426a-94a5-21ad3bb240ff@ursulin.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7f83835-adaa-426a-94a5-21ad3bb240ff@ursulin.net>
X-ClientProxiedBy: MW4PR04CA0246.namprd04.prod.outlook.com
 (2603:10b6:303:88::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fae779c-44b5-411a-5a8d-08de117d2491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFMxVUN5VzI4U1JqVENvc2hQaFZBWDVQaUNXM3hPb2R0MU9zN3dvZGM4TWo5?=
 =?utf-8?B?blF0dmx1REs5MnEvblN3cFg0UmVTbTNHNnlkU0hCUEZIZEl2M2xTQnhnZ3hQ?=
 =?utf-8?B?eDBqbTdTWDR6cVBuMkdYcytrakpDSXlGd0RTV0pFa0gxcDR5dWExZi9xOXA2?=
 =?utf-8?B?NnJ0TVc4eTIreTFNTVFOQzJlc1VoZWNYWngvTDZvLzlpL2NGRGFxTGtqZGFz?=
 =?utf-8?B?bU5LUDdRZ1d2dmFLeExEYm5yMENiQjJ3U1RZQnVNVkhuWGFCMmlmMEtYWWhP?=
 =?utf-8?B?UFZWYUdQQ29Wdjc5NjNGTFlCQWo1RnlvTkJhdGVzdjNMUjBLM2FwU2RLa1dQ?=
 =?utf-8?B?aXJ2OXNUMCtUVXlXdnJiOFQzWEJIN3J3YjZKN3RNZTdwMU1QMy90N3JsVnBv?=
 =?utf-8?B?SDlEbmxjR3FYM1JvUFlXcldTVUpMNnBHdmZCMkMxRVB3aVJmdVNyNEozQ1lo?=
 =?utf-8?B?RXhFNk1nMVY0LzR5THc5ZVJCSFR0ZmhXZU5oY3UvbVpwM1llaXEzU3BqYTFW?=
 =?utf-8?B?Z1c2OEVnUTRSRERXOER2REtSTGh2c3d0ZXBMdXZHaVJocUZPaFhCSUd4K29u?=
 =?utf-8?B?YUxRRC9NVnorWENYNUgweGNWUVdGaXR4NnR2NkdmdFlPb3lxSDJFbUNhVUdD?=
 =?utf-8?B?aFpFUDVjN240V01Tb2tWMmZ1dnl0QXlNUWRBRGVlMFlFNDN3RXVDY00yWDdx?=
 =?utf-8?B?ZlBYYWhIZk9PV09HNGJXSFlSYTh2dms4RkdkM1Bmektkalp1QlZiNDEvNk5n?=
 =?utf-8?B?NW13SGJhQW5GWk5pQTZCcVRIRWJzSXd6QzhkVWF5bWlUdWY3cjc5bFdjcTNv?=
 =?utf-8?B?TjB1cFJWVzY2ZkpCajZrNStDT1FTT1ZDSzNMaFI5L3hkR00xNVptT2hWdFV0?=
 =?utf-8?B?S1ZNWU9RSEY1M2FEamw0SXZuK1lwaGxIcWd2aG5kNXlqUHd2V0owUUhuSnlw?=
 =?utf-8?B?WE1BNFhEeGp5RzRwRVB2ZmlZcSsxRFh4bkEyYUdOMGpaVDlYY0RsaUpXWmxT?=
 =?utf-8?B?cWxGS3dzbUU0c1dnZTMrSExvYWtDV2tyby9SUzRQYnJMTVlGRCtXSjROZzFo?=
 =?utf-8?B?aUZOVENpK3ZUY3dHUTdYbml2dnZ6ZVBMSXI5cG1DZUhHenBVVnBsS1dZNG5C?=
 =?utf-8?B?RzZ3SFFlWjZSNFloeFZJSm5GQ1dXZmdtbTFDSG1qZitnaTBteUhPZ1ZKdWxv?=
 =?utf-8?B?MFNzQ004bW9vV0Y4MlNVVDBCQWFib0VRdHFxTjJNc0dUbXNpZVE2anBQbzdi?=
 =?utf-8?B?aUZjcDkrZ2REQ1JNcTg4TTNRQkpxNW4vNFZpMmNpTy9wUUVISVhFMkhSTUhS?=
 =?utf-8?B?TWpCK1lUUTBPODAzV2NIdzQrVDQ0czNzSXVpdkVnK1JWcHVwcDNyblNPb0d4?=
 =?utf-8?B?M3RId3I5c2dMZm9WS25FRmJDa2gvY2VTWGlXUkxPSzA0TzdKeVdYcUVDVm96?=
 =?utf-8?B?cHVpaXRmNk9YSHJyQjZncTJEbnpVY1g4ZVZyUi95RjVhZUhDeXh4QyttTHB2?=
 =?utf-8?B?dVh1cnNWTjlRSUVZM3ZocVZ1eTQ2a0JIUjZ3d3dXSWdGeHZnTjNOZmFLOW9u?=
 =?utf-8?B?MFlmNkpBd0xzWnFhNVlUZlRqOU9JUk1meEFEY2wwc2pTRHN2ZWwzTm5rU3ht?=
 =?utf-8?B?T2lkZTNxcDVTSjhVR0czenZnYThUeXJKRGlXVXRINzZLc29mcUVSbHlXYjBD?=
 =?utf-8?B?bzdjaDhkTUI3RS9TcWdSZHRwWXpwL2xFWjhLQlFrSDYzTHE5QWxYK2QyWUpk?=
 =?utf-8?B?Tm9aUmlOMC9hMmlPMGptSW1yaUZtVXk2R0cvVituenVDbURpNFIwZWlGZnll?=
 =?utf-8?B?UDdld1krOUhRRXdYeW4yRk91UEJDWjNjSkxTR3I0K3VIQ21zVEdHb3BZcEk4?=
 =?utf-8?B?YWNGQ2FwOXNDQlJrdkd0R05xL0hGUEdSc1JVczR1TGlySHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U09mNTNpc3IvUlhZNHk4QVZlbzgwWVY1RHk3Tm5LTTV3Z2dTeVk3SUY5N1J3?=
 =?utf-8?B?eXJOb1RIeW4zOHl5b2lLWU1BS1Z3QjEyMlJKMGpqT0VMbXVod0ZoZWV2U3Zy?=
 =?utf-8?B?YkZDVmhYUzN3VHRmUk4xc3ZxNEUvUlJiRy80L1VYUzZDQzRHbVA3M3R3Tkta?=
 =?utf-8?B?M0pWMzhDSFhXMFcxYmNXWVhyUlBveW0zSG12aENIY24vVmo5WlJpdXB4eXJU?=
 =?utf-8?B?VjRsQ1VlOWtRdUwzUG5VZEU5ZzhZcmVRcklZeEZiVlVFdE5CZW1McXlIL0g0?=
 =?utf-8?B?aVRadVNYdTVNTGRWR01PUG1IRFRWSWE2MnJqeXNlNHlEekJ6Vldsck9BLzA5?=
 =?utf-8?B?b1BucnRpNjEybFhJRUxhU0paVjhhM2tEVHNKRFJqVldXT3B2ZWhlT2VOeUZF?=
 =?utf-8?B?cjZ4ZGJTWGZ5TzcvZ2UzcjZtZjdKeEVkOEZyVFNieHF1VS96VHMzSlZSOWxH?=
 =?utf-8?B?ZlM0RHlQQ1lieG1VU0pYY1g3c2lIc0REb2gxVkpxemNzK0E2UGFCNlE4S3dn?=
 =?utf-8?B?NmRaSlNzbDkreGR5OU9ZQVFsSlF3YmZIQk5ubmNJSXgxc1NRZ2pMQ2xaWmds?=
 =?utf-8?B?bW1oVFNwS2o4M0xyYU9xTHlXRGlLMjhvRG9ETFN2SUd4T2dSRjJTMSt1Rkwx?=
 =?utf-8?B?VExLNzNMa1FjYmlVWGxuWGxtNDhXeHpYMXpoUStQcHBNSVBlcS8vNTJTRFNX?=
 =?utf-8?B?SVBiNG9vRGxHcnNYRW9hbExianJiK2EzQkdFZm01a2htSlpSTmZDT0dUN3FU?=
 =?utf-8?B?SG1Pcm1lanVxNk45L0FDTEt5bW1zME9WeDdRWWhtdmlhU1ZWd1M1amk1RFNL?=
 =?utf-8?B?MDlsYUt0TGt5bXZKenZON1daanl4R2FGSUhtZkNYQUFFY3RFM0tqbnU0dmRG?=
 =?utf-8?B?dmozdENQNlpKMXRWVmJGQW9ZclpBbTJVUzJ5RWREQnl6T2ZVcDRsNWZLQVpp?=
 =?utf-8?B?YlR6ekxPaEtOS1VVaElyb3M4VzhnUE9iWklQTW1jdUxoM1NaUk16b0gyKytS?=
 =?utf-8?B?VjJ5M3ZGQ2pyb2c3Sm9jeURYK0ZGWGlERzV3Y2dJN3ZPb0pTVUlLTVZSbUl1?=
 =?utf-8?B?cm5OQmprc2pSa1ZqSmgxZ0I3V0hDVG9sRzdES0hoZ25BZHNEaC91OEoxSzBM?=
 =?utf-8?B?OHZ5SzVWSFZGdzdxekY3ekE4VGFyL0FnUlN3bmZTdEVmTG42SEZhd0Rzb0pH?=
 =?utf-8?B?MmZobk4vaWdJcHVobWtzam1RRGpiNTBqY0JpNnRMbWpZZzlaNEhxVHlOK1h0?=
 =?utf-8?B?MEtZZnl6ZGZkdlZhSFNacE55VE5Sa3V2ZHFBWkNJUnRkVG9WVkgwamVvemEz?=
 =?utf-8?B?TGIveDNCMU9jL1NJT1l6anBzMlp1YXhKdGNENUtLcEMxVkxCRkF3U2VBWjVq?=
 =?utf-8?B?TlU3dm5HN002ZEFyVkZrNGNCSlh4M3pDaEVFM2gvNjlWbkoyQkhDN1oyMmNK?=
 =?utf-8?B?cnRnbGt3NkZ1OEYrZ1RXd3V1QW5RazM2L1ZUUHVBbHRLME03OFhPck5BMFBK?=
 =?utf-8?B?ZDJQRVFKczNhZ2RiQVRMbjJxRmZMdlNWcU5EVFpkamEybzc4VCtQaWtMemNr?=
 =?utf-8?B?RHdac050Q0tpUWVoQ3ZZMnNqMmVxZDh3ajY2RGEzVGdJQ2dWUjNIWUt2eHRB?=
 =?utf-8?B?YlM3S0VsaGh6Y29CbVRmcEZUZjRma0ltUEZyVW1ZeEhWeGM3WDhSZGRGYmNT?=
 =?utf-8?B?WGpmWUMxY3RBWDEyWDAwRnQ2SUtGdjlBVkpZOG1DdThDZ010NjNmUGlFZTZO?=
 =?utf-8?B?UVJJQ0E2VEJZeE14RUl6QUR5WnNmRDBqY1dNSEluaDVvS3RFeWpDTExHMVQy?=
 =?utf-8?B?bkNZV3M2VVNyVUNKVURIVHZodHFZVzJPZHVwMWJyZlAzaVhWMUErTjBiaWRT?=
 =?utf-8?B?d2pMRktoSm9Ud3lhY0tHK2src1ZMTitZUmhRTlZHbU40ajJsZWZheGF1Z25L?=
 =?utf-8?B?THc5bmZiVHRWOVZ5NU1NOFhSc1FRUkFFRkpJTFNyVVJtK0pxWkU0S1EyQVFI?=
 =?utf-8?B?eUJWcWh6em1sWGtMYXhVN2NJYkpUbHV6VnJEdjZ6TGxWNGJMRjFVZUYveHpu?=
 =?utf-8?B?L3ZROHR3cFZFdHdVNFJPTGFaR2t0eVZjYWhmUmVtRUxuZmpxMG5uYzBERC9x?=
 =?utf-8?B?MEdzdHZNUW96ZVp2VjQ1QzE4ZExMU0NNQWV4TlB1ZVBZV3RiYWJsTUR5RWVD?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fae779c-44b5-411a-5a8d-08de117d2491
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:10:31.7293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1dWdetPoJXMEf5K47Ml0EprJ6JYxv3fvKt0v8CDa2IqRG8BwX7dMH11cONj1oGBAhBcWbOW0gSG4awZMuGuBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7956
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

On Wed, Oct 22, 2025 at 09:00:47AM +0100, Tvrtko Ursulin wrote:
> 
> On 17/10/2025 17:52, Matthew Brost wrote:
> > When a burst of unbind jobs is issued, a dependency chain can form
> > between the TLB invalidation of a previous unbind job and the current
> > one. This leads to undesirable serialization, causing current jobs to
> > wait unnecessarily for prior TLB invalidations, execute on the GPU when
> > not needed, and significantly slow down the unbind burst—resulting in up
> > to a 4× slowdown.
> > 
> > To break this chain, mask the last bind queue dependency if the last
> > fence's DMA context matches the TLB invalidation context. This allows
> > full pipelining of unbinds and TLB invalidations while preserving
> > correct dma-fence signaling semantics.
> > 
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec.c          |  3 +-
> >   drivers/gpu/drm/xe/xe_exec_queue.c    | 18 +++++++++--
> >   drivers/gpu/drm/xe/xe_exec_queue.h    |  3 +-
> >   drivers/gpu/drm/xe/xe_pt.c            | 15 +++++++--
> >   drivers/gpu/drm/xe/xe_sched_job.c     | 44 ++++++++++++++++++++++++++-
> >   drivers/gpu/drm/xe/xe_sched_job.h     |  7 ++++-
> >   drivers/gpu/drm/xe/xe_tlb_inval_job.c | 14 +++++++++
> >   drivers/gpu/drm/xe/xe_tlb_inval_job.h |  2 ++
> >   8 files changed, 98 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 0dc27476832b..6034cfc8be06 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -294,7 +294,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto err_put_job;
> >   	if (!xe_vm_in_lr_mode(vm)) {
> > -		err = xe_sched_job_last_fence_add_dep(job, vm);
> > +		err = xe_sched_job_last_fence_add_dep(job, vm, NO_MASK_DEP,
> > +						      NO_MASK_DEP);
> >   		if (err)
> >   			goto err_put_job;
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 90cbc95f8e2e..d6f69d9bccba 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -25,6 +25,7 @@
> >   #include "xe_migrate.h"
> >   #include "xe_pm.h"
> >   #include "xe_ring_ops_types.h"
> > +#include "xe_sched_job.h"
> >   #include "xe_trace.h"
> >   #include "xe_vm.h"
> >   #include "xe_pxp.h"
> > @@ -1106,11 +1107,17 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
> >    * xe_exec_queue_last_fence_test_dep - Test last fence dependency of queue
> >    * @q: The exec queue
> >    * @vm: The VM the engine does a bind or exec for
> > + * @mask_ctx0: Mask dma-fence context0
> > + * @mask_ctx1: Mask dma-fence context1
> > + *
> > + * Test last fence dependency of queue, skipping masked dma fence contexts.
> >    *
> >    * Returns:
> > - * -ETIME if there exists an unsignalled last fence dependency, zero otherwise.
> > + * -ETIME if there exists an unsignalled and unmasked last fence dependency,
> > + * zero otherwise.
> >    */
> > -int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> > +int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm,
> > +				      u64 mask_ctx0, u64 mask_ctx1)
> >   {
> >   	struct dma_fence *fence;
> >   	int err = 0;
> > @@ -1119,6 +1126,13 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> >   	if (fence) {
> >   		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> >   			0 : -ETIME;
> > +
> > +		if (err == -ETIME) {
> > +			if (xe_sched_job_mask_dependency(fence, mask_ctx0,
> > +							 mask_ctx1))
> > +				err = 0;
> > +		}
> > +
> >   		dma_fence_put(fence);
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index a4dfbe858bda..99a35b22a46c 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -85,7 +85,8 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
> >   void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
> >   				  struct dma_fence *fence);
> >   int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > -				      struct xe_vm *vm);
> > +				      struct xe_vm *vm, u64 mask_ctx0,
> > +				      u64 mask_ctx1);
> >   void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> >   int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index d22fd1ccc0ba..bba9ae559f57 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1341,10 +1341,21 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
> >   	}
> >   	if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
> > +		u64 mask_ctx0 = NO_MASK_DEP, mask_ctx1 = NO_MASK_DEP;
> > +
> > +		if (ijob)
> > +			mask_ctx0 = xe_tlb_inval_job_fence_context(ijob);
> > +		if (mjob)
> > +			mask_ctx1 = xe_tlb_inval_job_fence_context(mjob);
> > +
> >   		if (job)
> > -			err = xe_sched_job_last_fence_add_dep(job, vm);
> > +			err = xe_sched_job_last_fence_add_dep(job, vm,
> > +							      mask_ctx0,
> > +							      mask_ctx1);
> >   		else
> > -			err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
> > +			err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q,
> > +								vm, mask_ctx0,
> > +								mask_ctx1);
> >   	}
> >   	for (i = 0; job && !err && i < vops->num_syncs; i++)
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index d21bf8f26964..7cbdd87904c6 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -6,6 +6,7 @@
> >   #include "xe_sched_job.h"
> >   #include <uapi/drm/xe_drm.h>
> > +#include <linux/dma-fence-array.h>
> >   #include <linux/dma-fence-chain.h>
> >   #include <linux/slab.h>
> > @@ -295,19 +296,60 @@ void xe_sched_job_push(struct xe_sched_job *job)
> >   	xe_sched_job_put(job);
> >   }
> > +/**
> > + * xe_sched_job_mask_dependency() - Determine if a dma-fence dependency can be masked
> > + * @fence: The dma-fence to check
> > + * @mask_ctx0: First context to compare against the fence's context
> > + * @mask_ctx1: Second context to compare against the fence's context
> > + *
> > + * This function checks whether the context of the given dma-fence matches
> > + * either of the provided mask contexts. If a match is found, the dependency
> > + * represented by the fence can be skipped. If the fence is a dma-fence-array,
> > + * its individual fences are unwound and checked.
> > + *
> > + * Return: true if the fence can be masked (i.e., skipped), false otherwise.
> > + */
> > +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64 mask_ctx0,
> > +				  u64 mask_ctx1)
> > +{
> > +	if (dma_fence_is_array(fence)) {
> > +		struct dma_fence *__fence;
> > +		int index;
> > +
> > +		dma_fence_array_for_each(__fence, index, fence)
> > +			if (__fence->context == mask_ctx0 ||
> > +			    __fence->context == mask_ctx1)
> > +				return true;
> > +	} else if (fence->context == mask_ctx0 ||
> > +		   fence->context == mask_ctx1) {
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >   /**
> >    * xe_sched_job_last_fence_add_dep - Add last fence dependency to job
> >    * @job:job to add the last fence dependency to
> >    * @vm: virtual memory job belongs to
> > + * @mask_ctx0: Mask dma-fence context0
> > + * @mask_ctx1: Mask dma-fence context1
> > + *
> > + * Add last fence dependency to job, skipping masked dma fence contexts.
> >    *
> >    * Returns:
> >    * 0 on success, or an error on failing to expand the array.
> >    */
> > -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
> > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm,
> > +				    u64 mask_ctx0, u64 mask_ctx1)
> >   {
> >   	struct dma_fence *fence;
> >   	fence = xe_exec_queue_last_fence_get(job->q, vm);
> > +	if (xe_sched_job_mask_dependency(fence, mask_ctx0, mask_ctx1)) {
> > +		dma_fence_put(fence);
> > +		return 0;
> > +	}
> >   	return drm_sched_job_add_dependency(&job->drm, fence);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> > index 3dc72c5c1f13..81d8e848e605 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> > @@ -58,7 +58,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job);
> >   void xe_sched_job_arm(struct xe_sched_job *job);
> >   void xe_sched_job_push(struct xe_sched_job *job);
> > -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm);
> > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm,
> > +				    u64 mask_ctx0, u64 mask_ctx1);
> >   void xe_sched_job_init_user_fence(struct xe_sched_job *job,
> >   				  struct xe_sync_entry *sync);
> > @@ -93,4 +94,8 @@ void xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot, struct
> >   int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
> >   			  enum dma_resv_usage usage);
> > +#define NO_MASK_DEP	(~0x0ull)
> > +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64 mask_ctx0,
> > +				  u64 mask_ctx1);
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > index 492def04a559..f2fe7f9fbb22 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > @@ -32,6 +32,8 @@ struct xe_tlb_inval_job {
> >   	u64 start;
> >   	/** @end: End address to invalidate */
> >   	u64 end;
> > +	/** @fence_context: Fence context for job */
> > +	u64 fence_context;
> >   	/** @asid: Address space ID to invalidate */
> >   	u32 asid;
> >   	/** @fence_armed: Fence has been armed */
> > @@ -101,6 +103,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
> >   	job->asid = asid;
> >   	job->fence_armed = false;
> >   	job->dep.ops = &dep_job_ops;
> > +	job->fence_context = entity->fence_context + 1;
> 
> As a side note, hardcoding the assumption on how scheduler allocates
> contexts is not great given recent efforts to make drivers know less of the
> scheduler internals.
> 

Yes, we should probably have a helper here — maybe
drm_sched_job_finished_context?

I was planning to roll this change into [1], but that series hasn’t
gained much traction, and fixing this is a fairly high-priority issue
for customers.

This is documented in the DRM scheduler kernel docs:
entity->fence_context + 1 is the job's finished context.

[1] https://patchwork.freedesktop.org/series/155314/

> But what I really wanted to ask is, having only glanced the patch briefly,
> could xe performance problem here also be solved by unwrapping the container
> fences at the DRM scheduler dependency tracking level?
> 

This is primarily about preventing TLB fences — which originate from a
different context than the bind queue but are still ordered on the queue
— from becoming dependencies. The process involves two passes: in the
first pass, we detect dependencies. If none are found, we immediately
complete the bind via the CPU. If dependencies are present, we defer the
bind to the GPU.

> I am asking because amdgpu recently posted a patch to unwrap in their code
> for potentially similar performance reasons, and if now xe wants something
> similar, or even the same, it is an interesting question where to do it.
> 
> Also, I have a patch (not sure if I posted it so far) which unwraps in
> drm_sched_job_add_dependency() and converst the dependency xarray to
> unwrapped dma-fence-array. Initial idea there was to allow scheduler worker
> to only be woken up once, once all deps are signaled, but now if two drivers
> seems to be unwrapping fences maybe there is a case to be made for doing it
> in the core.
> 

I don't think this is the same problem as the one above, but it's an
interesting idea in general. CC me if you post this one.

Matt

> Regards,
> 
> Tvrtko
> 
> >   	kref_init(&job->refcount);
> >   	xe_exec_queue_get(q);	/* Pairs with put in xe_tlb_inval_job_destroy */
> > @@ -266,3 +269,14 @@ void xe_tlb_inval_job_put(struct xe_tlb_inval_job *job)
> >   	if (!IS_ERR_OR_NULL(job))
> >   		kref_put(&job->refcount, xe_tlb_inval_job_destroy);
> >   }
> > +
> > +/**
> > + * xe_tlb_inval_job_fence_context() - TLB invalidation job fence context
> > + * @job: TLB invalidation job object
> > + *
> > + * Return: TLB invalidation job fence context
> > + */
> > +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job)
> > +{
> > +	return job->fence_context;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > index e63edcb26b50..2576165c2228 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > @@ -30,4 +30,6 @@ void xe_tlb_inval_job_get(struct xe_tlb_inval_job *job);
> >   void xe_tlb_inval_job_put(struct xe_tlb_inval_job *job);
> > +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job);
> > +
> >   #endif
> 
