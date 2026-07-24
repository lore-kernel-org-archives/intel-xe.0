Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70D8C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 18:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623E110E07D;
	Fri, 24 Jul 2026 18:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDA1/FWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951AC10E07D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 18:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784917599; x=1816453599;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MU/OJw+vZVnPxt+RB9jUJP+Sn5/dkf1DpBu6ENReuIQ=;
 b=PDA1/FWnvosWjaU4HTV7Nqu1DIytOwTWyxJBhUuGngSBcxS52EDcLTLa
 sqZJQ6FmMRxwJMDl5ak2noPpn3L6GEOULqeDcdLh+9zDsAvFVDt5dK8vd
 YAG/2LcHmducCc7zLPB84oOwYozk1/9TQE+YRRpYo2UmNUGP0HIHlRzBg
 XNs5AwYJt0LBWBjGgN+9s4M2bui4I4+duwl4lBNM3k9SI4lS+uTV83p1A
 PKpAyleT7fGzpoXITTIKzmTE9ZyHLBQDpZ5xtOlgCx6eGY24npn95leYK
 EGH/wYpAo34EdwBKQpSIK8bqUVbosK5YFRIvzCOwm99X/mF9i/zgs4B1a Q==;
X-CSE-ConnectionGUID: FT8h1a2gRQuf+OLZfNRilg==
X-CSE-MsgGUID: vgYy6GQ9S92xS8beLPW4ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96740674"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="96740674"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 11:26:39 -0700
X-CSE-ConnectionGUID: +NLzhmRBT5u04ZSHulclsA==
X-CSE-MsgGUID: ihbCiorNRaGNT8cyhW45Qw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 11:26:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 11:26:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 11:26:38 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 11:26:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBe5gDJHSrLEDKvjTselCFles6Aa/WtFSewiiI3ptLo8oS3lZw8KUpcCoQScbv9qoaLjdKdB/1z1REbFPdXvRPQuGQTIlR9ZF/YIZ4AGRe+qd/hLJZc5s4x8tMRaehQrzUkuhtf0z5x2iaXHE3kTPj4dWjU7YY3t8h0reO2ESOO6J+OK2YeWoBT6WFipOSe9r0g0Xol2aez8wb8Ij/jY9FwCOL7JQeOB2qJuE8cx1nAeQhY2l1izeAo9iNp6rhzsr0JIm3T7pMWjhuUq33JCBRJHshDbkQcXxltelxwaTpxsoKFil0G/TkKxMe5DOHxNX33LKi2NqhXFz6LkSiEqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWTDGPRCrQDzvBenO4QNeCQuYJ6sCYbNiCcffw5PQXs=;
 b=MICugBG5D7VkuEEewnI4U9OTEwvFBmh9pkxjplfxDcBUbyrItAvbeeTtyuz4tF+B6OUwzPAAfMtF0/V1p4G8JT/pu9iShlL9xvAefVNJXURA0jlyY6wvy8oRipiMVuEI1Uwd5Ev/alLWPZCd/rRnsW1M8EUWEG90l94ZTQzV5GJ5FxASu/8S3w6EmErzIVTutHA9z7FF4fDl1nzWSJ4GcQr6WE8xWq6R3ys/yrP6Zxup3iGo9mqZwN4aAzIBFGJQfXGeFfh4lhNHmJAZubkb+9xhYivYFXXZCR84Z/pSTyRCBZWRC0O1SVk2VZ4ZFDYbAbk8qS0q7/s2vmmUCiEHSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB8720.namprd11.prod.outlook.com (2603:10b6:8:1aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 18:26:24 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 18:26:24 +0000
Message-ID: <81ba3341-9bda-4c17-8fa2-b17490d1d913@intel.com>
Date: Fri, 24 Jul 2026 20:26:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
 <20260724114939.1560743-10-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260724114939.1560743-10-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0057.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a89dc4-139a-475b-f60f-08dee9b11183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5L38UvpojtjZfSmoAK2dnMhA0UglKOrAqCHTcVzXoCr0mkd2HUacD1H6RBmAykTlNZqQ3QqXFD+wKl9KQKdgvva9UI+br0MEpo9Eqtq9B4qBC0wtD9m48ImAQ5vRpkvivuPIi14GN75fKSJM3HepofaOEFbbv7jnF/3fBso4dnJ9dUPvDtTO+mGHR0o/p/ijgL8drcKS0lT7Q7sw7qZrYmY2qgjBG3VI0QEr6XbrpOtwBvkezkq9Znl+5s+DjgB3CxfxWvgJcrI40R7W/Rq6RnCwcRSmmTTd8GcsXO6bMatH1KBS7GHxGVnoDwZ5rac04PUL3q8j6hvsLNfuRwMXjt2r4Z1Myfe5YjiGRAD1Btb2Xr7/c7QCQlXRsZXDR3X0YZT+tZXdBLZSYrUrgJOLPd5bya06M+yLFEopbMcP29POmbWZBOg7vDcY35YK5snfsPmgxjHBt/Gv4+bPGxFZzDMfWhvVGz+F9qSp8QAKI0Ao/esPLUFxbuSqNgd2X9izo0nSkuEaReid9njlDi9Uxrjw66TcBoGpULlv+R6bJ97B+TPDtZz1yc9bes1riGde9MwVX6jfkKG1lMbnCHcx0QQyEyCaXbBhgchDZ0aUdCDaIvKcTQLkKqSszme41dunobDa3JxzjHzP7Eb60PLgRE4s3KR4/zQPTNGW3MiACAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2tKRm5wTzhkandvSXd2RFRKNW1KdGVyMS9sdEhPWGwwZUY2RE02UXdqaWFW?=
 =?utf-8?B?Y1Naa29wdmZpa3pleVVERjFJYW5nSzBWZ0FMM1ovWFdEb3JuUE5rb2hzTkVS?=
 =?utf-8?B?dGx5UHhpYUtTQnR5YzB2S2RZYnR0SVdPNERNMXZlYjc3Yi9pK0FSMkU1V1F4?=
 =?utf-8?B?RFRveWQ3ZmtGdURueW5KMTZYU21mbkJER0UvYkI5VUFzSlNXR0U5Qi9tM1dY?=
 =?utf-8?B?TENCbVZFZkp2VldXQWo5d1FXbEpRNkZSR2xMY0FDUUNuNk9PR1lJNWk3ek9N?=
 =?utf-8?B?NlhzK3BHbHI3VG9ZdU84a2NtRFVreXoxc20vNWJSc01OY3AzbTZ0OHBlNnFv?=
 =?utf-8?B?UXBtKzRsaGx1NDY5cnByQzlVUW53NCtTSnhKYnRDZUEwcGRabTRrd0tYaW5l?=
 =?utf-8?B?cWQrV29CQTgzOWkyNzFGSXU2WEg1NTllTXJXUENUTEdVbVlpWUIrcnJrMXU1?=
 =?utf-8?B?ZHpiUW41Rm9wZUwvNFBVSHpDendiSmQ4RVRmL2tsMFAyRkhUb1RQejViN2hl?=
 =?utf-8?B?VVdaOVQyL2tNbDRreUcvZU1PVHRNekNVbmhmKzdpeDM2bXJwejI3SWxTZVhJ?=
 =?utf-8?B?RGtQSklSRFkzdjV6ZlA1dTFnRjhJcE9hYi9EUmYwN3hLN3U2WUZNakJ4K0pC?=
 =?utf-8?B?Y25vVlNKQ054Yy9jSWlsWmdUZURWdEZRSUJ6OHBWV1FnSlZ6K0x1N2l5ZGhj?=
 =?utf-8?B?cHV0TmdvMTI2ZFVGV0JRdmNDVnFRVEE5ViszRnJxSUEvMUwydW9DSTZoUlI4?=
 =?utf-8?B?eXY3OWQ1Q3owWEpMR2V5eUJoeElCWXlRYUhIZ0ViUldHZjBpMU95NGJ5KzNs?=
 =?utf-8?B?Y29WVTJvZzZaM2ZEdFNWZ1NjZFZld2paTGlVZUJ5OGd6c01wK1FoUzh6b1NI?=
 =?utf-8?B?L2VBUDhOa0gwUG5PamkwQUFlUnRjOW5NcGJFR1hBZStZWkhzUmM1dlNiRDg3?=
 =?utf-8?B?M2hDQmE3R1c0NCtaWnpTUEZZYVlMVXJJQjJhVlJTL2FSOHBLSTZpRHVVZ05u?=
 =?utf-8?B?d2JyZWUxOVRqVTFBT0hHSHhpcDlzRnlvMWMzUDdVMm1XelVkNXptRDl0c25y?=
 =?utf-8?B?aDN1WVpCOUloUjZ0MHQ2d3lCWmxyZUFCdFdRZHVzSWo5UEFmMmlnV0FxUE1r?=
 =?utf-8?B?RnEyak5JOEtsRktuVit0eFFCZUw0MWNmNHFRc3FKVFpwd05UZnpVUngzRmNP?=
 =?utf-8?B?OWk5Y0JrZjRtV2kxR1BJYkErWWM4QzkrNGJHMkpWL1VJa0RNZXRhY3ZzZFVi?=
 =?utf-8?B?ZUg1bUE3dFUzTzZPOVd5WS9ZR3BEYXQwUjVMc0JUY2g2MkhqMXRMMEJqeE5n?=
 =?utf-8?B?NWwrdnBuWDg3V3pQaGVDS3FFRmI4VnNrUy9TRnp0OVp4WGVDbjBDbmQwNUFZ?=
 =?utf-8?B?NjdmY2FsQjNyeGRaMW1LT0c0TzNpN1F3MFZUL2E1cHhaUEU0K2JFNTUzeUR0?=
 =?utf-8?B?b1l4WVZsQ3p0TWJhY1ZyL3Erayt6ZUk3RnpJNmRFUUtqRlRkY0NwcHhmWXBE?=
 =?utf-8?B?NHNBT3Y3dnhJRjgxNXZnU2JxNC9MNURKYXlkV29CTzFKTU9OQ2lpSHFHeXpE?=
 =?utf-8?B?ZXJsVngwUmV2TEpFRmZHR3FUc0pnZ01rRDFLZUJoZHJaUzFqQk1KN0prNm96?=
 =?utf-8?B?K1BmT3lNZHl1TTMyRVFTdzRyUVdaTlhlTnF5eEorT3RiMkxOc2grdUZ0Rzln?=
 =?utf-8?B?c0ZHakVxMi9Qa3lQMDJIaWl6cUpMTTlGbjlnQWk2V050dWt0YTh0VFRFay8v?=
 =?utf-8?B?TXJ4SEpaTTBRcW01YnVQb2h6c0ZpYUVlQTlDNXpseGtGQkZjMU5Vc3ZrcG9o?=
 =?utf-8?B?SUcyRk1VUnZSTFVUeUM5ajlqUUN0VjcwdHVUQWw1eHpKMnQwWG5wUXZwZG8y?=
 =?utf-8?B?ME1iWXhzMlQ3cmd5cDY5RTA5THZpSjZXUkRhaWZYSThUUi9FcytQN25FZlV2?=
 =?utf-8?B?NUZYUlZoRFQ5UDEyWHF3bEpsaWt0RUhjb1EvUXp2cmluS3pBcWg0alQrOFdt?=
 =?utf-8?B?V2FYTWtTNGp0N3lPL3VPTEhnWDNpbHBjSkZqZ0dySTVBTkpsYVdEbUhSZlZ0?=
 =?utf-8?B?SlArRU8vQ1g3VkNiOEFSU2Y1NmF5ZlVzT29LVk40RDh5M0JwbVFSUFUwS3hR?=
 =?utf-8?B?djErMDZacjJ2RDBDSTUrUkJGZ2tGcmRBVGdSRTg4anF6WUZCckhYakJzVVdt?=
 =?utf-8?B?VFJwQmRxbHFNOHB0UW9jRXRnSzMreXlsUXNLV29FcHZRT010Ni9KR21NZGJM?=
 =?utf-8?B?Q1VIU0JDZVlFWjkxWHRhQW5wSFNGZS9ZR0xDL0Q2UVV1dkxpOTdwMUx3RjBn?=
 =?utf-8?B?L2x3cGsraWQ3QkExczRZazU2a2VYZ25xWDRlTE9mQkVqMy8zZ2hOd3BuaUUv?=
 =?utf-8?Q?Z1X2dSIhJULO1cdg=3D?=
X-Exchange-RoutingPolicyChecked: pJhnwVH0QCVIFMCg9lQI4gdGkax3rCch2WuDqIwdb2uEWBew6M8g+OzZGUoou4ylRtCtN5NufZMG0sNG3ygq6LtY1uRQpepv4rFI+Xw7XBP2nhO0A1przutA6ScmnPYhfS/cwFf9gC8r4SF/O3afN2Uh21O7GKlUCThG8Ll3ZRs66XaYww8zmftayPQAyJvkl4+QagU8zLNVTI7Qclk3IePAE4hcCbiL3xU3vkBS7Qqv17X5nl7U8V9tiGhEubzXgy8UQpYqB7eGtPXuDB3JwV0ItS9ysX12tBzfl/KBEj0Etp1pMLTNGzISO+rpDzqeVwRE9/iRMlpt41ha2ZUXjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a89dc4-139a-475b-f60f-08dee9b11183
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 18:26:24.7185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wi1GPltdir7yZ+kHfivyzUDQlHfm5Rs1qbBjyP0BAPEDXl+WNaS/vpUz8WKe15Rn4NmUgQE9yvtNAgg4OvDbOaiQ0R7WtIO/0EJHQ8VWOGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8720
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



On 7/24/2026 1:49 PM, Satyanarayana K V P wrote:
> VF relies on the PF to provide a valid hardware configuration via GuC
> KLV responses. In unlikely event of PF malfunction or misconfiguration,
> a VF may receive incomplete, zero, or out-of-range values for its
> submission contexts, doorbells, VRAM or GGTT assignment.
> 
> Add KUnit test cases that use the guc_action_query_single_klv32() and
> guc_action_query_single_klv64()static stubs to inject bad KLV responses
                                 ^
missing space

> and verify that VF can survive without crashing for the invalid
> configuration data received.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V2 -> V3:
> - Renamed the test names. (Michal W).
> - Fixed review comments (Michal W).
> 
> V1 -> V2:
> - Renamed the test file (Michal W).
> - Fixed review comments (Michal W).
> ---
>  .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 213 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
>  2 files changed, 217 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> new file mode 100644
> index 000000000000..abc2dcd6f0c3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +
> +#include "regs/xe_guc_regs.h"
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +#include "xe_vram_types.h"

do we need this include?

> +
> +#define TEST_VRAM		SZ_8G
> +#define TEST_GGTT_SIZE		SZ_2G
> +#define TEST_CTXS		1024
> +#define TEST_DBS		128
> +#define TEST_GGTT_START	0xdeadbeef00aa00ccull
> +
> +struct config {
> +	u32 orig;
> +	u32 query;
> +	int expected_ret;
> +	const char *name;
> +} vf_ctx_testcase[] = {
> +	{0,		0,			-ENODATA,	"none",		},
> +	{0,		GUC_ID_MAX + 1,		-EPROTO,	"overflow",	},
> +	{TEST_CTXS,	0,			-EREMCHG,	"lost",		},
> +	{TEST_CTXS,	TEST_CTXS / 2,		-EREMCHG,	"reduced",	},
> +	{TEST_CTXS,	TEST_CTXS * 2,		-EREMCHG,	"increased",	},

can we test also valid cases?

	{0,		TEST_CTXS,		0,		"good"	},
	{TEST_CTXS,	TEST_CTXS,		0,		"same" },

> +}, vf_db_testcase[] = {
> +	{0,		0,			-ENODATA,	"none",		},
> +	{0,		GUC_NUM_DOORBELLS,	-EPROTO,	"overflow",	},
> +	{TEST_DBS,	0,			-EREMCHG,	"lost",		},
> +	{TEST_DBS,	TEST_DBS / 2,		-EREMCHG,	"reduced",	},
> +	{TEST_DBS,	GUC_NUM_DOORBELLS - 1,	-EREMCHG,	"increased",	},
> +};
> +
> +struct config_vram {
> +	u64 orig;
> +	u64 query;
> +	int expected_ret;
> +	const char *name;
> +} vf_vram_testcase[] = {
> +	{0,		0,			-ENODATA,	"none",		},
> +	{TEST_VRAM / 2,	TEST_VRAM + SZ_1G,	-EREMCHG,	"overflow",	},
> +	{TEST_VRAM / 2,	0,			-EREMCHG,	"lost",		},
> +	{TEST_VRAM / 2,	TEST_VRAM / 4,		-EREMCHG,	"reduced",	},
> +	{TEST_VRAM / 2,	TEST_VRAM,		-EREMCHG,	"increased",	},
> +};
> +
> +struct config_ggtt {
> +	u64 start_orig;
> +	u64 start_query;
> +	u64 size_orig;
> +	u64 size_query;
> +	int expected_ret;
> +	const char *name;
> +} vf_ggtt_testcase[] = {
> +	{0,			0,			0,
> +		0,			-ENODATA,	"none",		},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE + SZ_1G, -EREMCHG,	"overflow",	},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		0,			-ENODATA,	"lost",		},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE - SZ_1M,	-EREMCHG,	"reduced",	},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE + SZ_1M,	-EREMCHG,	"increased",	},
> +};
> +
> +static void vf_testcase_desc(struct config *c, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", c->name);
> +}
> +
> +static void vf_testcase_vram_desc(struct config_vram *c, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", c->name);
> +}
> +
> +static void vf_testcase_ggtt_desc(struct config_ggtt *c, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", c->name);
> +}
> +
> +KUNIT_ARRAY_PARAM(vf_ctx_testcase, vf_ctx_testcase, vf_testcase_desc);
> +KUNIT_ARRAY_PARAM(vf_db_testcase, vf_db_testcase, vf_testcase_desc);
> +KUNIT_ARRAY_PARAM(vf_vram_testcase, vf_vram_testcase, vf_testcase_vram_desc);
> +KUNIT_ARRAY_PARAM(vf_ggtt_testcase, vf_ggtt_testcase, vf_testcase_ggtt_desc);

you can use KUNIT_ARRAY_PARAM_DESC instead

> +
> +static int guc_action_query_single_klv32_stub(struct xe_guc *guc, u32 key, u32 *value)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config *c = test->param_value;
> +
> +	*value = c->query;
> +	return 0;
> +}
> +
> +static void test_ctx_config(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	kunit_activate_static_stub(test, guc_action_query_single_klv32,
> +				   guc_action_query_single_klv32_stub);
> +
> +	gt->sriov.vf.self_config.num_ctxs = c->orig;
> +	KUNIT_EXPECT_EQ(test, vf_get_ctx_submission_cfg(gt), c->expected_ret);
> +}
> +
> +static void test_db_config(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	kunit_activate_static_stub(test, guc_action_query_single_klv32,
> +				   guc_action_query_single_klv32_stub);
> +
> +	gt->sriov.vf.self_config.num_dbs = c->orig;
> +	KUNIT_EXPECT_EQ(test, vf_get_db_submission_cfg(gt), c->expected_ret);
> +}
> +
> +static int guc_action_query_single_klv64_vram_stub(struct xe_guc *guc, u32 key, u64 *value)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_vram *c = test->param_value;
> +
> +	*value = c->query;
> +	return 0;
> +}
> +
> +static void test_vram_config(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const struct config_vram *c = test->param_value;
> +
> +	kunit_activate_static_stub(test, guc_action_query_single_klv64,
> +				   guc_action_query_single_klv64_vram_stub);
> +
> +	xe->tiles[0].sriov.vf.self_config.lmem_size = c->orig;

maybe:
	gt->tile->sriov.vf.self_config.lmem_size = c->orig;

> +	KUNIT_EXPECT_EQ(test, vf_get_lmem_info(gt), c->expected_ret);
> +}
> +
> +static int guc_action_query_single_klv64_ggtt_stub(struct xe_guc *guc, u32 key, u64 *value)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_ggtt *c = test->param_value;
> +
> +	if (key == GUC_KLV_VF_CFG_GGTT_START_KEY)
> +		*value = c->start_query;
> +	else if (key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY)
> +		*value = c->size_query;
> +
> +	return 0;
> +}
> +
> +static void test_ggtt_size_config(struct kunit *test)
> +{
> +	const struct config_ggtt *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	kunit_activate_static_stub(test, guc_action_query_single_klv64,
> +				   guc_action_query_single_klv64_ggtt_stub);
> +
> +	xe->tiles[0].sriov.vf.self_config.ggtt_base = c->start_orig;
> +	xe->tiles[0].sriov.vf.self_config.ggtt_size = c->size_orig;
> +	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
> +}
> +
> +static int vf_gt_config_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_VF,
> +		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 2001,
> +	};
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_TRUE(test, IS_SRIOV_VF(xe));

[here]

> +
> +	gt = xe_root_mmio_gt(xe);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	test->priv = gt;
> +
> +	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));

maybe it move [here] ?

> +	return 0;
> +}
> +
> +static struct kunit_case vf_gt_config_test_cases[] = {
> +	KUNIT_CASE_PARAM(test_ctx_config, vf_ctx_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_db_config, vf_db_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_vram_config, vf_vram_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_ggtt_size_config, vf_ggtt_testcase_gen_params),

_config suffix in test names seems redundant, as it is already in suite name, maybe:

	test_ctxs
	test_dbs
	test_ggtt
	test_vram

_vf prefix in gen_params is also redundant

> +	{}
> +};
> +
> +static struct kunit_suite vf_gt_config_suite = {
> +	.name = "vf_gt_config",
> +	.test_cases = vf_gt_config_test_cases,
> +	.init = vf_gt_config_test_init,
> +};
> +
> +kunit_test_suite(vf_gt_config_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 07f749bad271..b9786eab5c2b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1665,3 +1665,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  
>  	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_vf_kunit.c"
> +#endif

