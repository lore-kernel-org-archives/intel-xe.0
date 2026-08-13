Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F4DC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 09:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5C010F21C;
	Thu, 13 Aug 2026 09:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2dsKfUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE31F10F21C
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786613323; x=1818149323;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YDShpueXP7bwkdNhtQV2pz77M73VlUUHRqA0sKQvsIQ=;
 b=N2dsKfUq8uPJha5PR6+yjB7GQX5DMFYFiUcgXBphzNn8aU333eUpB3fo
 77x1aH8EKlRmBOFbI0JPDjDkjgemhHPAIrDLjpaFKrnEUXC02g6RNlxND
 /nOwhBTIUUdPrNOLzQj2pgePwYZ9J9VPuR2XSPICx51ol2n+tjbqt4xuI
 xE/N5OiZMWITHBgLuqx8OvSD7W4yrkzGRFqTi4z/SojnzWP6Qagm9g3wi
 AZGYFk6m5Nj3M/1Q3dZUOY2kKTwEe5ElihJ5dk3PAgI8HI/cemy9YKVhS
 QduB7Qe2ugMVv5DyoWJIdVOEYVz28HYnjZYqjzdgo8JFB0FD9TgsyYR/x Q==;
X-CSE-ConnectionGUID: JNFFUTMPR/qJ6iNhc+Ov+A==
X-CSE-MsgGUID: omzWRI/NTcCFKNd/x2g4gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98698200"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="98698200"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:28:43 -0700
X-CSE-ConnectionGUID: gipcRJWgTle2g//cXLGOmw==
X-CSE-MsgGUID: /EfhEFPMR4ilEELuauXpfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="267408517"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:28:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 02:28:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 02:28:36 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 02:28:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V12347XdlwinzYUr6wIlB1wyDumtcWHbHHIWR8DK/6ZbXbnxz9Dn1djf1BQ9T2Rr0xo0NrYLeAprDfORGXeumMdOw39AVjOb2GcrD5JypyRI+comSds89mraMXupTcex/g2zG5aUIcaBKydstiHPr1qYnkld8E9r7HMBgUgNmzbAFbNiSLdxAYZq/uKqnI+W1VLj+Oy/M2LZEAFNDijsU0m0/8Bdy9sdLwqcZY8v6rw5rn86q3EbEfd6UwONCMQEQrOGwrp8SNZVoovfu3rk708jzqxvxEyrKhaowfzX5L03QmrhWSoPOHVb57IX92nL+FR/nmgLJwq5Qn0I5neIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpA/5rMKSCF+nmEx+q/hcsi2SrmAB9ptfB1Kj0RvzoQ=;
 b=bBQtmyDhmt6OHcoQ9ab+1OHscmO5z8j2sm71peBm2jc85mRrEGs3XpIBKhNXeyIt4TfWrXKd07eps1VVphhjAzTk/2My/qmlvePtVuKt8lviz9sd0lKyYT6whxL3gple44kNiH65txTTEgqAV4OdeP8JSyFBb7t+9fFGjpEfeeTTbJjCvgdYxwKozi5tc+V/HNyX/AmEWBjC5MP1AvzXLnzbRfPaKTnPkyFG5J+I/z/VWJd6ru13J2zv4dMJGDrNa2XO6p7BYbd9lxQF1+GjWmYhegeUvdViqN/giQu74y0CiwFf0quaJGcsxDMReMp5Mn4GQLspa3hz2t4maqefJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV8PR11MB8747.namprd11.prod.outlook.com (2603:10b6:408:206::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 09:28:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 09:28:33 +0000
Message-ID: <9658c1e5-03ed-4521-94c8-c8bd23e65c99@intel.com>
Date: Thu, 13 Aug 2026 11:28:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/32] drm/xe/survivability: Report 'boot status' using
 SIGID
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-21-michal.wajdeczko@intel.com>
 <d587a47d-003b-4d20-9412-0ca47c8ce5b3@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d587a47d-003b-4d20-9412-0ca47c8ce5b3@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA3PEPF00000512.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::666) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV8PR11MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf1c43b-b811-476c-87cb-08def91d3e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 0/lI/yN8dl021UPFDV7xxtGnDaQAWTJMKu29X9QorwSTSLINifJBdkI5Bw2zSxfBQdUv5EBwdZJA+NvCEmsdu+8FlM7NtaEfgWhTSWWB4AW9I18rqikGA7k5qg04hUJvJbXQzY/7oNaE0oM05tsNL9z4CKScRYIO2nAOoWQFlqSLk4HRmBUaBb+mRDMJ7ByqHWNXimYt+82vUv0FgQ83Ki4lXISdGMIAQsoYU2VmWoups5wNEW74TfDdkTKkhcge/pXZ5CMY321im1eBFF8TrU/1svJYfOfWZIN/5JllptT+svG51OsJN6Lo1JtS+d0bdCJqYAb68BJnQZThQlHKj4Rc82W38EDbXVUjjUUlWbfuqo3yAga9Ve97Fh/ttZmV0tMiWkcV7QuTbKcI1QYcA6UZ5qasb6MwCtGx4XaAXLVBx0GlVlxIIKYS2i4giyd08r0CLHemMUWo1csn1xWuivC4BMLBsSKUG0GvCYBSvkQHGnOd3P7e8q1Y++XZMNDx2Skn3ll3w1vvk7qYHSBkmnFE7DpxwlgBQtI5q+CpgqRuNEFtHxx9ji7WKQ28r3PUy9p5I59LojDDOCMZUn4QaOkbbx+kHHZaEfKJ2+UPmyYc8G7sZrV6ssp9+cgsyes6gsmXDbALOEKoQTOoL1mulpC9KBi70TzK8FPCR8DkBlY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzVKbHdHamVQS1B1VU9Eb2FvOXRMTHk4T1o3YTlWSUwzWHNTWHR2dnlLcUda?=
 =?utf-8?B?TldPdENRUFE4dEw0NGMvOEYveGJXaTFWRjdHTk9kQTBjeDRYLy9GSmtSVG9U?=
 =?utf-8?B?NEJseE1TZVJ3bGpRUDZvdUp3QTJvVTVRYXdEcHRHK3VzYUFaNTd2NjI4T1Fo?=
 =?utf-8?B?NnVXUFcrblZsbUsrMkRUUnZyaE9jQlRubWw1RkJMZkMvWGRMeVR4K1oySHVC?=
 =?utf-8?B?V0M5WmpiN3N6cGVHWlIrckxrQy8yMkhSc203U3RRMlY1YlVyL0JxQ2lURW5y?=
 =?utf-8?B?RmJ1aDdYVElsVHpsLzVneld1dE11NStsVjg3b1JUSGhJWWdNb3lySVBoS2NX?=
 =?utf-8?B?ME1KazYvUlJEQXVTa1lTOWdCYnVWQkhSdWQxa2VNMW1TMFZGUk01ckF3UkVZ?=
 =?utf-8?B?K3BLd3RiY1p0V2E2aWR1cjNIYVlXNVRIOTBQUU4vUnhVUHZNTERrNEV3ZE9X?=
 =?utf-8?B?bzU2SFBHci9vSSttVG1UdlY3L0NMOUtyNWQvTkVPY3JSOEpVUVZ3akRTWEZD?=
 =?utf-8?B?U2FxTTRRcDBCNGliN0NJZWd6UEJrWGhnUktqb2hqd0RqR0VoSVlUSldqSU1R?=
 =?utf-8?B?cUFCeUZIN2R1S0RrYXFaSmswMVl3blRsV0Y5YWFxZmxNVmlIZTlLVmdibTJX?=
 =?utf-8?B?VVdkcDE2STF0UjBJczRQNFM4NTNQNDV1SGVlb2RpZVZadmtiV1FNYUpCLzZv?=
 =?utf-8?B?dnJHSUxBM005amZIaVhlUHc0SDRNRGZwN0pqM1FvbUdVUDNXc2FPQmY4M08r?=
 =?utf-8?B?czNXOG9HdUlmMWZvVkRiSHFENXRsNGVQSXZCaDBXeWlOM2RXMUN5WkdQaXVp?=
 =?utf-8?B?TmlEb3UvYU95UTdURVAwZ1cvUW5XbUxjRCtsMzV3ZXl6N05GQUpwWU4xZ1FZ?=
 =?utf-8?B?bUdlbUZrR2VTWi9La2dxMWR2M0Z1bEFVYUNwd3FFSDZuR1VkZDVPeWlicllq?=
 =?utf-8?B?MVRjcUIwaWFqUysyTmN5cHF4VldZaVJNb0YySTJ1SnZvUmp4bHNhV3JkdU9X?=
 =?utf-8?B?NDFNM2JoSFRsZUhhUXhxWHdjOExQQ29SY25FVGVFOHhXSmVjdlIzSzZzb1pH?=
 =?utf-8?B?aFUrQnVISStsZmlwdVY2aUYzV3lFWElGMmZaYjUrelVtWnhuelFVRVJQdG1P?=
 =?utf-8?B?YTZiLzc3cFROQ1o1Mk9pVmRvdTB1YnVEWHl3MWY4MGVCOHFYUWVjY0JvRTc1?=
 =?utf-8?B?NEN3SFhkRndQY1hPU01wUmNlaDM1RXlHSGRwVjhNWlArK3FPY20wdExxNml5?=
 =?utf-8?B?MEFINStINmJxclhiWExabzRuYjBjdlUvSjJ0L2N5M245SURMZUR6QUl5ZmND?=
 =?utf-8?B?ZWFWU3pzdmV2NEpYZ0NyNWRxUUlJbHZNWTA3cVNFTG82Q3N5RDdIRUJQck5S?=
 =?utf-8?B?enJwVnU3eUVXM3g1d2dZa3VMRlZmK1lNZllwdDBySUdMakIybUxuUkhKWlhi?=
 =?utf-8?B?aUR5dDZ4K1VOdmdVa0VlVnBUd0RiMCs3MDk4NXN2YVptQjhmWWlZUEQvUjVo?=
 =?utf-8?B?dVJzRFpuK3BjK0tOSkJWZnNNNlkvb2p2WTlwbUF1ZUNVNnB0SThVbGlIK3NQ?=
 =?utf-8?B?N3UrZXkxRXdMNy9TdGdBbnkzWmZ5ZlloNlRGVndwY0ljTXR4MGkyZWxOekZP?=
 =?utf-8?B?a3VUNW9KVW5FQlM1cXJGTEFxK2s1eUpzS01FTStpMHhSeEJSRFVzM2orSERF?=
 =?utf-8?B?SnJGN0djTGJvNTkzZVBhaE96dDF1dy9zNE9ZZTBaR1dQK3gwdGQwcjlFWm1K?=
 =?utf-8?B?K2txQzVaT1V1dXh2bmZuQVZXVk9TNnpxTzd4NmFFZzl5Zm0wSmZpNWlqRURm?=
 =?utf-8?B?MGdZQWZwUFhrRExITmlObWZ5NFFUTGFxVmlIOUdSaG42YlYwbVRrOWNyQXZy?=
 =?utf-8?B?d2lrbk81S1VEc2RMU3MveFJuSEhFbTU4N2Q3NE9YdE9VeE1HMUNwZFBGQVEy?=
 =?utf-8?B?djdBeDZRWmhqc1dGdTNaVUY2bXYrbjFyTnVPWkZUN1BXQXd6TkVYalVyYUla?=
 =?utf-8?B?OWlzZ0pkOWlKOWZIR0hiSTBwZ0NoSUlkT01hZzhZQzBWbVp4aktZUnNKTFRD?=
 =?utf-8?B?QWZSMFhjSmJSQU56SktwMzdMS0lweWZTeWFZMTU1enVsVFc2dWs4ekJvNFBy?=
 =?utf-8?B?aEJXWHRybm9SZmFFTjdxUmpjQmNZbHRxdDBNQjcrTnl0a1Z4WUFOQThZMDUr?=
 =?utf-8?B?VGs5aE9GSUlHNTVUdlB3WC9HTUFsdEhYY0FnU1RDUlJuL1d4U05lakt0UVk0?=
 =?utf-8?B?SEFHV3V5dUlhaktvdHZ2bm9rVitTY2lWdkRKSDhQemN5cXdLcklOQUY2UzdJ?=
 =?utf-8?B?VDdhU2V6NzBtVUVYcjJkYWlmY2dwcm5ZWGpuVzk4U011WlhtTjlrZjBwT0pn?=
 =?utf-8?Q?XlyBcOosepwVGHQw=3D?=
X-Exchange-RoutingPolicyChecked: OWL8Ys0K7nTzJXTX78jG+y4Za54YjZ7cG3f1OS19hVwC9iH/OdfxR3vsD5xRPfnLhN50XfkfkOImkFtT1h1Z1ptx5TQ9twiTmqS71/8g3hOA7Nw/sWcjyBD6QVYo76SwGlw43x1rOfzVUci75REEbIsI/ggjTVYaMPYw2s1I8tf6djTfOyNnjY13tDVl2yQpBvWt0kiqcQbFGGfOcAQ2MAi6QXbuh2CGf1OzCLfi3KYUrqCXibCL2uqu8czRbJ3Sm1SsEvs214DBAAQebsjOYRW+z5BfgLq7UENhEPzspnhHaaQKoJ/QcF3hUZxEDdZjNVNdOCoWS0VtgdslNQQReg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf1c43b-b811-476c-87cb-08def91d3e8d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 09:28:33.3028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QF1fdWAhLcyE0eCz98RQ5enU6tr/4Z1E62/uLU3CfeJuC0AIl7EeP1zXYE+vDKvnSZa5KG3cIxJjBbkLW0PIGjMCrOyhsT0pKeaJizcmiaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8747
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



On 8/13/2026 10:38 AM, Mallesh, Koujalagi wrote:
> 
> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>> Report 'boot status' details using xe_log_err_fatal/info() macros.
>> While around, move static helper code closer to the caller and let
>> it take xe instead of pdev.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_survivability_mode.c | 35 ++++++++++++----------
>>  1 file changed, 19 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 4c506027fa94..85b4c125a217 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -14,6 +14,7 @@
>>  #include "xe_device.h"
>>  #include "xe_heci_gsc.h"
>>  #include "xe_i2c.h"
>> +#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_nvm.h"
>>  #include "xe_pcode_api.h"
>> @@ -172,21 +173,6 @@ static void populate_survivability_info(struct xe_device *xe)
>>  	}
>>  }
>>  
>> -static void log_survivability_info(struct pci_dev *pdev)
>> -{
>> -	struct xe_device *xe = pdev_to_xe_device(pdev);
>> -	struct xe_survivability *survivability = &xe->survivability;
>> -	u32 *info = survivability->info;
>> -	int id;
>> -
>> -	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>> -		 survivability->boot_status);
>> -	for (id = 0; id < MAX_SCRATCH_REG; id++) {
>> -		if (info[id])
>> -			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
>> -	}
>> -}
>> -
>>  static int check_boot_failure(struct xe_device *xe)
>>  {
>>  	struct xe_survivability *survivability = &xe->survivability;
>> @@ -429,6 +415,23 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>  	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>  }
>>  
>> +static void log_survivability_info(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	u32 *info = survivability->info;
>> +	int id;
>> +
>> +	xe_log_err_fatal(xe, SURVIVABILITY, -ENXIO, "Boot Status: %s (%u)\n",
>> +			 survivability->boot_status == CRITICAL_FAILURE ?
>> +			 "Critical Failure" : "Other", survivability->boot_status);
> 
> Since log_survivability_info is called when survivability->boot_status == CRITICAL_FAILURE true, so please use "Critical Failure"  string directly.

well, that's the current usage and function name didn't strictly say "log critical failure" only

btw, printing fixed "Critical Failure" string followed by flexible %d also doesn't make sense IMO

that's why I decided to make this function more flexible and reusable if needed

> 
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> 
>> +
>> +	for (id = 0; id < MAX_SCRATCH_REG; id++) {
>> +		if (!info[id])
>> +			continue;
>> +		xe_log_info(xe, SURVIVABILITY, "%s: %#x\n", reg_map[id], info[id]);
>> +	}
>> +}
>> +
>>  /**
>>   * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
>>   * @xe: xe device instance
>> @@ -452,7 +455,7 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>>  	 * v2 supports survivability mode for critical errors
>>  	 */
>>  	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>> -		log_survivability_info(pdev);
>> +		log_survivability_info(xe);
>>  		return -ENXIO;
>>  	}
>>  

