Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6898AC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 10:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2835410F4E6;
	Fri, 14 Aug 2026 10:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emZyko4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7027E10E4CB
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786702703; x=1818238703;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ae5PTF5hCqxRrNLrVUgieIiWMMVW7olu9XsZ5RpKtKY=;
 b=emZyko4mew8qe2fYRT4wpFsgoKoZ7uDHAHGgNnbnWw5da5NgjgnqDvgT
 CKhcd9OT2imrWGFm2W8jYx3mHdVyZvSHGavqf+7sRXR49IJmtTgppGg76
 KSuQYjaYEdQeLtgcmXcRMk3uQpbs8aVP9kbxCSKMruvNO6Jhjp7QPSnlH
 ShNNFmkVfSGPAXBqJmkBcEqCy9xYBvqrkCID8j1kisVnNwsgHcvoORzC7
 c8TRqg8/ZCJZq/BGx6s5eIpYV/dslFZi0KgrzVEreGhtGxdlybjYLRafv
 8WBuIhu78rq61aJ0jVwq0V7edrMlxU7Vew77bzMvQfPSCzB5JBaCM9mC3 Q==;
X-CSE-ConnectionGUID: /iS0EyAuRteKmNxDx+AbwQ==
X-CSE-MsgGUID: RUx+4KhdRg+Cp26NUS+fnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97945718"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97945718"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:18:22 -0700
X-CSE-ConnectionGUID: TuqgO+hcRKu3BML7On6BjQ==
X-CSE-MsgGUID: HGc4y4iMRbW7LiIWUf+gLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="260405401"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:18:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:18:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 03:18:22 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGGcveRplJkObHqhQux0QPvA2s02Pnh8X71nuS0DTi+Io9iC7PQPiqQ40N74QIK3toVV6rCFqrnpZnxs2J7WftTOXlBGT7zEc6RKVdA9pikqKgf4uFHE6h51xonYRQopcvv1l9YHh1pzEpLVB7JcmCS5zZnSlEORSWPk6KcwXIh8YnYwpJkq/6nH19GvgS3jVYhb2GuqGdMAqm2tIQPEEiuZjiBQVnbWo8m000ylB/WoWxrcn7DkL95hQrc1dBOfTY3rWkqABYYH+b4cXP0olqx57M+HPok/ESrQalsE+jBf0r5KqV4CnwgNTHuyvoKl+bllJWRDqn2YtKBGSQNqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1OV0+Wl+EmELOTHBm3+ZGaZEDnvpw+N/oAmo0OA9Y4=;
 b=YHIf3TBQE9EnBJPG4x/DMlfeUB0+DoqWVi9SEnmo4ysho3i2rIj8nn2zSJK8lO95djeKxB9rBmLgFLuPrbt3tLDm00cD+4ceTq+0XgFMBB1lj7le1yHCdQidQj9dkO4xD1JlYVwGTPQFXmm8mMA2Sk0LffPH7QeZrXLYMQOCrufPE7E17w5nu0ZOaRRXXnjrhW3UrUA+e65JqlNnuXeD/fR3WVTGeBjffxvkIbJ2K3kztNgRWXWswy5RzWTOQfGpeZGlmZb1H2JaAbcGLsl9NIXzTb1eeCxqy1YW0BQyPk8rvX+icw6+SZ4MxV+FIfRWFtHBPc97QMyAxjX4DOpZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 10:18:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 10:18:14 +0000
Message-ID: <68b5e0a0-03f9-43e8-aa10-2ef1e79d52df@intel.com>
Date: Fri, 14 Aug 2026 12:18:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] drm/xe/survivability: Report 'Runtime Mode
 enabled' status using SIGID
To: "Tauro, Riana" <riana.tauro@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-24-michal.wajdeczko@intel.com>
 <f203ca92-c042-46e1-be7d-773f63d9bb5f@intel.com>
 <d2bd1735-94bc-44cb-8fd2-dbde99db4ec9@intel.com>
 <5db999eb-2925-4301-ba60-8b90f56f8a5d@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <5db999eb-2925-4301-ba60-8b90f56f8a5d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0305.eurprd07.prod.outlook.com
 (2603:10a6:800:130::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb21e43-adf3-4b33-4b24-08def9ed598a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: NfYx01vAdZy1RNE3KOO8QPfhriubE9nH4GVRgaudA7S0gQvYBHL96yq4FUYGbwQi0z3c+Ss15LxVEzHL7ZcySWzIIgHjBFspkSiQjVyvHz2xClrcnY5vmHvv9XD9JjMM8o3XW519GD3nmGs7Hb50JZaKUc+/IvZiWmgFd8Qm6DI4PdKb40AyX6IFt+Yi41Yj+psSd5WBs+hFMt59uGtnWvRId3qrDxPz6var+UGhB5hOwZ9l/Ca5FzzimuwXc2rALMveEiGj3UPKt7GsnbyBBn/nX938hmbS7TS+k645GOGIlu6y4BLEI51slACbDUHX7PoYmRFkoiVzdJNFahlZuNMHhin1uLmrwyeXkMJJp+kvsXO0+a/iGyRUtbvbMDScIt/sxHWiqLvw6aQqAPs/EZw0Wbjvbi7oRGNEnO3rlqWl+Fue4tE7hDvqXruY2GDCnQM6wJ2emk5jul3hYpsbVzUxsewVn3H9w5EwFg+IzoSJ9ENMMWR7xNUYcktdyh0AZzBt6DDbTzfvPPBM96JyFRvodw1zXuWMoz+mWDsOquiTPC8jWxhZKlnTQizmLTC9Ek0gTGrGePa/+DRPTjtyIrxl1OHL81E3j25F9QZpQS1wpy25sbzKAe8IH1AGsI4z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2xLY1VtNmg2aG9tYXlmYlBZVWNqekxXT29EN3R2N0FDVzdUOUpnY3JUMlI4?=
 =?utf-8?B?V0R5NmJOakU4aENTd252VHVRT3V2anI3ZTU2K0YyZHIzdmF3cFJLcTZUNlZ2?=
 =?utf-8?B?czNTZkZaWml1TDBlaU1kUkUvKzR6Z3I0Y3VzZzNVWk1Da2FSNkFWT0tBUEJD?=
 =?utf-8?B?WUxoTlNkVnppTEdHZmVJNjNqNTgwMGxKYnhSOWt4d0YwSjZjN2FXMGpYdEk1?=
 =?utf-8?B?Yno0bzN3elduanVJRk1UWVZya3NyVjJVckpocUgyV0pRL3VpUjVPekN2OXZh?=
 =?utf-8?B?RDlRcm9mUEFqL012SE1SdVViVWl1ejdDSFFwbEltS2JSTlp4Y1RmMko2YXgx?=
 =?utf-8?B?MEluYTYvVC9QcUdjdVRvTXlxZjQrbGVhNzg0akp2NjlSbHJYV2JBMXNUeTZ5?=
 =?utf-8?B?Vkd2eEtKaHlzUnplVXZkVUtvbGM0Vm92dW5wNXFaN1ZBTk8vdjZiamhsNk83?=
 =?utf-8?B?LzdLajNPbFZhdnc4YkV1VHhTVkd4dHNqdnAwVXdIRW9na1JzS0pyL2NOajMx?=
 =?utf-8?B?VmpzbFhmclh0Wm5HWjRqNWU0RGpQWk9IeTlrMzRJa2hPVGJlT0VYZllXMlFV?=
 =?utf-8?B?aWtCVzhxVDQ2SW1id2YyNjE1ZDBZRmV0UmRpdzJHTFovWTd4TjJIVmMrQisy?=
 =?utf-8?B?YWRrdktLcDFKQlJhd0NJSTZtd0FibVZkZ3dIdk1JNFFzL3FFbTVNdVhVcGVN?=
 =?utf-8?B?REtnc2pQNnFQV1RCTEZ2ZVZvYUVNSERvemM4TkVmRWYyTExsbCtDM3VQNHVz?=
 =?utf-8?B?VjlVWVI2bFRnM21lYVExSEN5dlJKTWc5VzQ1aENHbEwxMkpydTg2U0d6dkdP?=
 =?utf-8?B?a3BNalVIOVBnc1hZMEovMXJaQlBiNDJUai9XWHJnMnNpeXRJRjdHYXRsdXNF?=
 =?utf-8?B?SjNKY0tuNU9jejE4M204ekJubTZLNnJjb3BUR3lTZTJDeXVKaUlBdXJqbEJT?=
 =?utf-8?B?YVNzTTNieXRKVXJ2MlhFRlBzVnhOeUxCanpvbWtXcHZkL3lkRWUyVHUvaVRa?=
 =?utf-8?B?SHo0TnVrbU12Y2cvYTh1c0dNK3NzWjZuUGx0ZVhOQUd4WkZFMTQ2bG1ZSDBu?=
 =?utf-8?B?VjZuWkwxbjlBMmYvNDdwVUw5U0Q4cC95dWx2c2xYai9obThETkwvejg2NHRs?=
 =?utf-8?B?cXZRc0tBcDFEcHVkVGlSbm81Z3ZmMXF6bUdoWkFOakdSK2hJeUwrd0ZxdlR2?=
 =?utf-8?B?V1R6VGZYMzVRWnBZSTBobENzQmxjQzlWVVI0cWZVNnE2cDZmZEJQdi9Qb25a?=
 =?utf-8?B?Yk9BaklmSDNkeUI5OUhHaGhScUVjaTcrRkZlUlpmaENXYmw0cDdGYXhQSU9W?=
 =?utf-8?B?YlpuSzMrKzFWSE05OUw3UzdBcW9EZm1XZGx2dnNkUjBLTVRVcEVXVytvMWpT?=
 =?utf-8?B?TXh6ZEI4LzZ2Nk10a2k5QkpDVjZrWmZQWEFTVlE4d25BRDBVYjU2bDltYjJF?=
 =?utf-8?B?WXNpS1ZJc04wMFh1eUc5WnlhWTkyblVvRDhpR0VCQUJMNGs3ajZFRElGK0lY?=
 =?utf-8?B?WWpXR1lqdDU5RmpnTU12bytteDh5ZEt2SWc3Z3ViYklOblpmajdDWFdqMDV3?=
 =?utf-8?B?ajc2anB4ODVKTjRiMjZJemhPYkF3YVZWYXlOckMvcVIwcG4zVkJRaVF1M1Jw?=
 =?utf-8?B?cCtkNHVDeTdmN1Mxd1ViSk43aWI2YWN5Y05oWmxCVlFPalNGOVFjc0N6N2xs?=
 =?utf-8?B?OUVaR3Bzckx3V3l3OHgybUluUXprQ1VjMUxocitYbU5ZeTRzTGlFcnlqcDgz?=
 =?utf-8?B?UEMvVFhLdlA1Kzc1UlhtY2QrYnF1Z1BLdzdjRXBMQU5haFVVSjZmNldUMWJQ?=
 =?utf-8?B?M05zNmJQSHNwNkdvbUk4Vkw4OHYzMlByQXRyTnBHYmVNNExSQ1o1VHd5VnBq?=
 =?utf-8?B?WmwyRDF6aEplblNlUWFUdjlER2toTUpLMFpDVlJyTTlaR1RiWk9tdjRxVmIx?=
 =?utf-8?B?aHVGcEdvaWYzVXdoZ1c1VkRMOFI5NHI5aGxQU2llWElUZyt3c0V6UlBVZm8v?=
 =?utf-8?B?bU9nbXVLOU9UUXN4Q1oxSkw0YkRqc2JYbEVhQWVRai8yU2FlNWYrSkQ4QnRV?=
 =?utf-8?B?azhiaXVzUEE2aE5nd2lrSlR6aWdiT0tlenBlZjR2KzNWcTNjWFdOUnkzRWov?=
 =?utf-8?B?M0JCSTBSZTk5UVc1alJCMTIvaVBBS1pKdmw4Q29kcWlURVJKelRQNlBXQ1Nm?=
 =?utf-8?B?NDliVnRWU0drWk90ZkduTVlmMG84RzR6ZGxhNGlpTjZEZndDWGlscEhqQ0NS?=
 =?utf-8?B?TjZiWUt2Q1Bickh4aXJHV2R4dms5OGgyMERhUFB2bEdpK1ZkZWpZaENQOWJz?=
 =?utf-8?B?bWhGQ2lPSGhmSS9HemFQZ1VzWlJDRFZNejgrbkJDSWtyNXBNQmM0cVlIWXM2?=
 =?utf-8?Q?1QxG5TCpd/Q+C41Y=3D?=
X-Exchange-RoutingPolicyChecked: iMEuPhggx/SMNNu/dc2ai1xRNffF77xJqASftT/BnqblJLn3NWaHxoFbqH9mo3ScmpmEnJ2qR4bWjujLBqZz9zfCTynf6tTJoBZNJxEiP2zumalCzaJII2dCc+wf7aqGevT0B2eYtLeO+hP2W3+2e3EwPd2GxuR5MtrjgyAp2tSpghHZGgVQtYgTrCafevgwMAI8sT3BmqYafrhAPkUoc7jzssFO8bkRVtlv0/amYwOaTThYMSonWND5bIrLSuVud8iUM2iQKQT9OOVgmvKU8QQrkQD+IrjUjFf5DEyg6oWu4yJdZR9xQu7cJe3MNfu0LpxAdFvdMkd+gzaHI3DGcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb21e43-adf3-4b33-4b24-08def9ed598a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 10:18:14.0269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gm6b39AQsQmJKUxYwx6Q/Tklp7oGkqIIKhwUfFnLb1aHdht9OprF3yaiB8D0OF1Sd3vg3yHBWLGbnuIBBhUw6fJc3wKxbLNMrWBNOhk7cLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
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



On 8/14/2026 9:06 AM, Tauro, Riana wrote:
> 
> 
> On 13-08-2026 18:16, Michal Wajdeczko wrote:
>>
>> On 8/13/2026 1:40 PM, Mallesh, Koujalagi wrote:
>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>> Report 'Runtime Mode' status using various xe_log() helpers.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> index ebd288986c11..5d3315ac735c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> @@ -18,6 +18,7 @@
>>>>   #include "xe_mmio.h"
>>>>   #include "xe_nvm.h"
>>>>   #include "xe_pcode_api.h"
>>>> +#include "xe_printk.h"
>>>>   #include "xe_vsec.h"
>>>>     /**
>>>> @@ -405,7 +406,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>         if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>>>> -        dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
>>>> +        xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
>>>>           return;
>>>>       }
>>>>   @@ -413,11 +414,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>       create_survivability_sysfs(pdev);
>>>>         survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>>> -    dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>>>> +    xe_log_info(xe, SURVIVABILITY, "Runtime Mode enabled!\n");
> 
> This should be xe_log_err

do you want to include any specific errno here (like -ESTALE)
or just use 0 to do not include it in the message?

asking now, as I don't want to respin the whole series
after I make a wrong decision based on dice roll

having an extra errno in the dmesg/CPER along with SIGID will
likely help us write better documentation with resolutions

>>>>         xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>>>       xe_device_declare_wedged(xe);
>>>> -    dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>>> +
>>>> +    xe_log_info(xe, SURVIVABILITY, "Firmware flash required!\n");
>>> IMO, we need to use xe_log_err (recoverable) here instead of xe_log_info.
> 
> Same here.

ditto

> 
>>>
>>> Already mentioned in original changes [1], runtime firmware errors cause device unstable:
>>>
>>> [1] https://gitlab.freedesktop.org/drm/tip/-/commit/a2ca0633a0fef925a0d8125d8f3e4495a5ecb310
>> but in recent comment [2] you said that Arch team wanted that to be logged as info rather than fatal
>>
>> [2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731
>>
>> @Riana, @Rodrigo, @Aravind ?
>>
>> I need a decider here
>>
>>>
>>> As I know xe_survivability_mode_runtime_enable function need to carry errno as parameter to pass into xe_log_err,
>>>
>>> however we need to create separate refactor patch for that in future.
> 
> Why do we need error no here? It should be 0.
> 
> Thanks
> Riana
> 
> 
>>>
>>>
>>> With above changes:
>>>
>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>
>>>> +    xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
>>>> +        xe->info.platform_name);
>>>>   }
>>>>     static void log_survivability_info(struct xe_device *xe)

