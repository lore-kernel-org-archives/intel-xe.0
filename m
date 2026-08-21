Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25800C5DF8E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 10:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA08510F109;
	Fri, 21 Aug 2026 10:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WySgzNHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D3010F107
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787306682; x=1818842682;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ixv+pyKBRktm6lnVAaV7f4cHe3oaOtPzLpBCPnspBFQ=;
 b=WySgzNHFf79hKSKFJ9bpbb1H5cidN8Xdnx80WvEkUPYYVXWOIJMr6GCH
 f4cFlK9+KljLhUeeAp4pnt50d4GN6d97eeKbYZKPkaSnyfLmuYLqmVX81
 A9Q+F/NcaUYsMstU3AtWlDq6K/UOumiAKjA9WWXGyCNb0CegpPGPYJAkF
 8l+DQz8a4HSsKD7PiMfvQPE9uYqBMdYgS5UxvmKf+iehyv9xVWNyMHghc
 FgUWmtEnMGNr1W3OM4NH40BGBugx34ypXKQWbAyMPFE4waKtG0m8f9o45
 /sJHgZmYpzH6E0eyArRKiq+eQ/EhlU925yPWg2vAUzabbeAS74P/m7FXr Q==;
X-CSE-ConnectionGUID: WyE3dIdGTaOW/xlexVA3oQ==
X-CSE-MsgGUID: C9cNx0nfTsuLN29WyYu+mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="113392551"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="113392551"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 03:04:41 -0700
X-CSE-ConnectionGUID: q9ZtGeXKQQGq+4fna2InEw==
X-CSE-MsgGUID: MXrnQOioTFKbIMKMQqc/yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="268232256"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 03:04:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 03:04:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 03:04:37 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 03:04:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vjc3HXRH30DmsOrfREyqBnALJBAXV59IqJAwbqMJMmb1x46SswJ/K58RcM/vcGjJC/A61M/sbCQ3H0HKVF2vDMlBExLtG52AgDOaulM2vbHkQ+dRFhidbIBl13++U5Q65g8DK9WRGxFrUB6JwwBwp6vlorNJVkk/8fczcBWIWTLDpgzCJwy0tgaAoJHOAtwUo4VMq3HNO4hFdj+SYDGinYm10vzfgQv3pqZtE+D85pFxJ2KpIRaKlYy35+LtGeG6VXqLjKS8n6sTx5e3/G2Iph9f2nKuGY7E6ahfXlrvLte/c2V0gN9zGQ+zhTmpQ+lFdUZz3XJfOqH3Y7sW7VSFmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTjBDeqo/ZojFNtWAxQIBCszWWsPblV3Z2vaRKH3a4Q=;
 b=ilsM/Dc9f7dR+CCljcqQUVDmCBIK4JZaT9E93pBXIoO+3UjcvxfSCfNOXmU3uK7puNV5jx3XJW5GIwW+cQUV8arknCEQKXUpQ84QZJSvmf0oQP5Bmu4hGHCdkUCaNtjdU+BGT0qtZSz5HWVipYT1oaWIqZrOPrRE2o/MDifJjCNWjLPuK8pq04SBWFyvUjjkFeNeMO3Syw0qjW68/5JObgcOkScF7mzHuoMFXLjkwMdPRNDAgqadABTe8xgqm8U9s7hXJWQVzrUwSHTlGzKKZXJaLpEJj8CkAhKn9+Agz82NMqU56uTKj3KUA95oqKiIz4To4UVrTd/F9+EGbKfxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Fri, 21 Aug
 2026 10:04:11 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:04:11 +0000
Message-ID: <c38eea74-aae4-444b-a0f1-d5a6ac9dd946@intel.com>
Date: Fri, 21 Aug 2026 12:04:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] drm/xe: Introduce helpers for xe_vram size
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
 <20260812124313.1377582-13-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260812124313.1377582-13-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0174.eurprd09.prod.outlook.com
 (2603:10a6:800:120::28) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 8177c347-fa25-491b-562d-08deff6b8c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: weQPD7qOydi2+A498QsQwvy80wXHM1Ca6MgF/rDb0/PgiKORmPvNmWZb7kAFwV8m/ZpBMdplF3mezye9KNTE1aZNj1q2Y18rbbIhGhTfgxXXL2+dBaR9H7Fj/+MOoapW5AgWJkoU7OjYYRlHezBxcz3WJo+8siVN8x80+7+t2itckKFdQxqqfhiF7NpPblmUsu0+9Fw9pM5umNYDs+Fm4N+YS1VV6Bh+3CfmblIZGT2GU7QBJMmD6G7FmbOnk1xhZKKxk9JprCMKIPn0yuERA+VW8pJYD6ruW+YJ1ZuG2hfcAl3PuFRZ5at/udstdVBY+Z2oyQw/bwn9tUvdwzWoACUhq8yyHkR0tUiyaHdbUgk7NPf+zif+cEbmHky0rNvsx0fm3DPJkoY/5Na4XmBqSLffOe4uaf6RVlkQxAC9VvQMVYT1dmlrCoo8HkXOntb6gJxKnW8iggld53fWoVlGzICak9tqHvuPMOtEn1lOjXwRXCz/KRxBunPygIqgvjD/J/HJhnEfo8R5rDSuTCk7pghPnm/dKa15IruNMTjKNGcYMrJWumWexyw84thrOLMLu7ko1rHTYD93SKeKFGZWqepuMSs7S+8VJLy97365mBczOE9FHWTew4/w3IKL1HJYA1abGA0QvJwLatLmqPXokcZh2YwmRaNRDQNfVQX5sfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGtQcTFPWmZ4SVQ5aFlNVUlmK2pSYkljenlCM3p1OGI2SmY2N085NzQ1Tmoy?=
 =?utf-8?B?WDlDNVBlRC9TTmx1UjRleDY1TVQ3WnppY3N1S1NNWk9HZ2pjZnhDUlNKcy9l?=
 =?utf-8?B?SEMxUGdmUWt4TmVONjZ6MjlmYnlkZU1mQ04zUG56OWIxUDE3Qm5tVEpFV2Q4?=
 =?utf-8?B?TmVBM0M1OFVxdDBuNzJ6SXUxckpUbXJ2b29DckdxZXNrU0hxL2p2Y0w3eVZE?=
 =?utf-8?B?MTdsdWlaNlMvNXF1QnpmTmhoZEk5ZU1zWEdaelRQMWVDUkFMRTlSWkFwZjRS?=
 =?utf-8?B?bWhkQnkzZUxiSVNZTWZNTFpMelZWT0grUzFOTm5EUWEzV3dFUEIzK25mWjQ0?=
 =?utf-8?B?NUFPUDhueVVWQ2w0QUdPamMrQ0MrQ2MwOEllTm1qTVUzanhWN1NmUmN2WlpC?=
 =?utf-8?B?V2NjTWZXV3UzWEp4NGZFblZWMUYxMEVpUW1CVnNrOFg3WlNPZVZkeWhQd0pk?=
 =?utf-8?B?NHEyT3U5TTJ2SjhmZjM0bzZCdS9vRGdoTlRCVXFjdDNUdGtjYXhOc1RvSXky?=
 =?utf-8?B?K3U0MUc4V1pFREZNTGQvZlJOTkFURlRxQ1hHWFI1UnRZT2tjTE9ydzZTaGU5?=
 =?utf-8?B?dXBQNWFhSktRNS94WkVaODNyZEd4Tk9rMjNMQmhEQjN4b1RqaGhySVRCSHVI?=
 =?utf-8?B?cjVuazkzVHFaZVZ6U2lDa2w1b3QvcXVRcGRJTXpBb3M1TndQZ3lXTHRiMnow?=
 =?utf-8?B?UGRPSzNobUh5VHovUlJIN0NhcDY1SjVqVUJJV2dmVjB2dFRUL1NhQ3VkU3Nt?=
 =?utf-8?B?WVZGOXh6UVgyYzVUMnZBd2JJSWt4U2hMZm0vUE4wdHRIUU1CQmNOVGJWU3ZD?=
 =?utf-8?B?dkxXbkVHV3lsZUpURW9nUGhMK3dQRjFwOTViZUt5NXFXQkhZN2M2SGpLMExE?=
 =?utf-8?B?STl4OW42M0tMWkNNNFlCR2ZFeWRieTY0UTBVVlpybEVzZDYvUkJoNmVkQW9z?=
 =?utf-8?B?V2kzNHpXYlBZWXZXdWVVZ002b2RvRW9RKzJxVEhFYkdzSDF4NmdRYWJsZG9t?=
 =?utf-8?B?MFFMVkZjam5aRTYxWVk0VDduZ1lOYm1ZMlplNkRZK1lMYzdQRzVGNW9UbFBE?=
 =?utf-8?B?K0lxcHJhRUtKQUdDaWxKckpleHZrWloraUZ3L1RLVkdhU1JnaUZoZnJTYnFa?=
 =?utf-8?B?YzlXU2haa3BDQUxETWp4bTBtY0YyamhIQVN3OWJsMFhMeTUrb3BHKzdpZ0lD?=
 =?utf-8?B?UXRuTHpDazF6UHZTeFlIZW40TEpIQnpFdGtadGxJL1piQXhMMnpGcFU1MmxG?=
 =?utf-8?B?bDNXZlNZSVZQZUtRdnZzejJoVldUaGNuSHRWamFsSjUrckFheGxKM214bFA2?=
 =?utf-8?B?YzhvTTR0UzBvSWlUQTZDZVhGT3NlL0xiWitBREZ4bHRMeGh6SklaWGhrS0lU?=
 =?utf-8?B?eGNMblZKR25PZ0FONXJhNUt5U1hPUXVGTE15Lzdqb2I4LzBHQXZqTDRBUERY?=
 =?utf-8?B?OVZhajdCeWpFUi9lQS9PZ085M2NTNHlCOVpSU0xIVWZFcTRob1lCNEFVZWpi?=
 =?utf-8?B?Ly9VRjBtbmttaXNJN2VCQnJhTzJwVWhGL0hBbjNMR1BXZzdua0VxQkx6dDJr?=
 =?utf-8?B?a092QytMdStxeDJZbE9UcG5VMUhZWnk5NFFrek9semlrRHVXMmNHbHU3ZnQv?=
 =?utf-8?B?c3pRSkQwK2xKNzR0VjZsUkI5OUUrWUFUVTRZUWJBK2JDTUR4dHZNY0ZWc0lm?=
 =?utf-8?B?TGZ1MVp3UUJyUmlZSXltbUJxN1JvVUJtQnoxOFdqeHJET1pOajdMMXdyZThi?=
 =?utf-8?B?Qm5vb0ZUc0RmVmMzS0FHYjZqc1NIWFVnK3dvaEZ5bFFMMFYxMHQzU2hhZGpm?=
 =?utf-8?B?QTlZSTlBSlBHajMzQXExZTFTaUFqVkdhSDZ2TWVuU1YycUpEZzEra09rNkVY?=
 =?utf-8?B?M3pzdFZPWnQzK25zQlNNeFIzSklmUkliQzAwUS80SkFCeGRaNmlwTjFLbG5M?=
 =?utf-8?B?S25NbmNsMG5EQ1diUkdaN2syYTFRTmszcFBGd1hMVFJaMGIzV3IyZEdKVTUz?=
 =?utf-8?B?M0RvajU0WWNCUmFhcG1vOFZxaHdhaWQwaG9TcFNUdCswblphRTVvQ3NoZnZ6?=
 =?utf-8?B?MDBFSTBNZUFQYTlZUEpsaGc2QlBDcEtmTXIxOS9rdGtPWWNIMHU3YVNEWThY?=
 =?utf-8?B?WnYzSVhWeXNpS0syZFptMzZQaG9paUdDOW0wem5ZN1ZrTzRKQ05sbms0bWtK?=
 =?utf-8?B?UEVzSlhHOHZueTBwZWJxUFZYeEUzYjFldDFvcjFVaDE3N0x5aEh1bTlwRWFn?=
 =?utf-8?B?ZFBsb3R1RXdKcC8zTDJkeVNVTVgwVTBIU3BFSXpPSFlBU0laWnc4NnNWSG5k?=
 =?utf-8?B?dGlLcnRtT2xGWVVvM0cxQXZ0ZWJUVm9qbDNFNTg3NFBDRi8yOFY2dWJTMTRy?=
 =?utf-8?Q?0+Zu5mvFS/dVVRDI=3D?=
X-Exchange-RoutingPolicyChecked: j7GAub0NS4lgBJNDZhwhMitC6DZ2E7DXX8fZh0bGNHtKfMpdCN4ZiiKz1NfTtC5wZUSJFybxRHRVrZFnCy8L8c8nZp+Kc8MsqmB4yX6eZZ5mmnGePhham7D1JyvavYySEMulnqxAH0sgUrdw2Q7c2nPGQ4fxB9MJ2Jfk3aMSJdVf3NVeKk3+C4TyS46VKdR83IgsKJseaUiJncH12YSDcAwEu4wLTIb2ObqqCPggiPNQYL38nwxCb5RefyBvrlz3rOpLjmS5xtvIB7gxjvGwAq1bGmFOTBH1Ac3pQgNEBh9QOwu3wTptrdrXyJlTS5DrK+wy+SN0cgz7TCrFrOT41g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8177c347-fa25-491b-562d-08deff6b8c2d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:04:11.4048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtbOGNcu/bTMfxkXtNDnvBcD/dK8kXPfJU84UI6kVJkre8OkuEqNmPV/LIocgwIkZ6FmgpivH8ZL8u9hKvzX9EpxBRTKsbYSk5Q8QG00jMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
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



On 8/12/2026 2:43 PM, Satyanarayana K V P wrote:
> Add a new xe_vram_alignment() and xe_vram_needs_64k() helpers to get the
> VRAM minimum alignment (4K vs 64K).
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V5 -> V6:
> - New commit.
> ---

...

>  static u64 pf_get_min_spare_ggtt(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index dc975f595368..9af98f08b0e5 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -289,8 +289,7 @@ static int query_mem_regions(struct xe_device *xe,
>  			mem_regions->mem_regions[mem_regions->num_mem_regions].instance =
>  				mem_regions->num_mem_regions;
>  			mem_regions->mem_regions[mem_regions->num_mem_regions].min_page_size =
> -				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
> -				SZ_64K : PAGE_SIZE;

it would be cleaner to post s/PAGE_SIZE/SZ_4K change separately
(to collect right acks) and then convert that into a helper 

> +				xe_vram_alignment(xe);
>  			mem_regions->mem_regions[mem_regions->num_mem_regions].total_size =
>  				man->size;
>  
