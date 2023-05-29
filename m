Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622A8C77B7A
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 14:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1861410E2B6;
	Mon, 29 May 2023 14:07:30 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6357B10E2B6
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 14:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685369246; x=1716905246;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Psl7ao/bIG/PUAD7o7oxjR/m1Y9HcZdH7ACnmtmSZf8=;
 b=NkPHzv985EzHezDSQcDOpctL1WqM9nCbqmrcEqF15AXIGDCdYx4Lmjtb
 FAgKxbWnDVAoiuKcJF0rYesHIVuuA5WxZRiwRHJcldmIr2gmxOGWF0Y31
 4kITbv0gqJqs6vzii4hMGj7FdeIIW9XQdEGmH3SS4i4rIqAfdRwFppzag
 tSmQFEroUsiG9cxuB7zzLSkz95KV1iOD3JLfX+iRcdgeNgD69mdyoBdZ0
 o89XkKUCvwChVXbynbGpCdgiJ1uLNPJCXBqm5g0tqpU2/Mj75/PPDZ2zV
 3XD7thhLwlkpNBgoRnhgD5gZYD4rS4IMrmcnD7Rbf1SpdZKjTvV/+w3nf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="339301937"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="339301937"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 07:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="880408900"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="880408900"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 29 May 2023 07:05:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 07:05:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 07:05:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 07:05:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 07:05:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpvSddwzNVDyg3EziscS0YG+ilLud12aVliwtEPv3uUabL0HUful7Zzi1V3yJVVuXc+J47UylfHyAH+8/+HBNVSzjhDG6gxWMVUqMeBSEAT8RQfDD09UTrF94Zrc6qCSvW8siRncmfSvYwTCJAawcXs7+2qL+8A1UcXWk6jCtx33y6FXzNkdqZbakkHdfxoBPzbELhWLYr16IHycLCxomnJQaRQQo1OK9iVph1xy3bcUR+6gMHUPGAmFLQ7vtPNI9OiNHrh9MyIHbahLiMIoolokxVYU9N9gMEq6zKPv/iepPwXgDiw24lCdaYP14wTJmGXc69IGo60dkAe7slodqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Psl7ao/bIG/PUAD7o7oxjR/m1Y9HcZdH7ACnmtmSZf8=;
 b=G3qNpns0qOZUJ80GP6ls8zHJrRhlqxp8JSUOwAlfSwIBmPnzhaygC/kyQRduLvs2otSrjlohbJ7cZk7Igp9aiEujGDy8CF43DuiFby1MzOD9qt+pVlV/NXT/B9gzgaT8tsjBiD1tiLwteTZKeYsrp8/2jQ+fD+omerUcR8YgtVw5D4Z1NETJK5DDL7+mNVhV8BbaGiSj2j+34j4kr5w8AAI/FbTWwmDuwY01rRwPsLJ6CYCpKZgOBRWFoJEjW4FwylAaQ6PnwA0KKAN6deCDmileXti1OQY0/LcsJ7Bs9Gp5C9xW51PTxUqQ2RD6/wvoCismPd4fs2JC0Nhpbatn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CH3PR11MB7913.namprd11.prod.outlook.com (2603:10b6:610:12e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 14:05:36 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 14:05:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <gbs47mikaccbwfppxwwbaw4nskqi2ldpavapjwjmsfehcltqik@pkslkh7abf3x>
References: <20230526004235.745730-1-gustavo.sousa@intel.com>
 <20230526004235.745730-2-gustavo.sousa@intel.com>
 <gbs47mikaccbwfppxwwbaw4nskqi2ldpavapjwjmsfehcltqik@pkslkh7abf3x>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Mon, 29 May 2023 11:05:31 -0300
Message-ID: <168536913124.1394.8384901576748395865@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CH3PR11MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 598beab4-9643-4409-6e30-08db604dc61e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LAlyduIhJSUL/xaca+fpS3JsaitI4UPXTrqvNj3/P/PfrJ6e2UBmEk/EUG4+oen3L6CO+tLndVWv4G/JxghKfiLbKbYdRg82fO9/KcUWMYkPp4LNqt95OPSWL5ijjXfmTlu8mHncNWIZcuiT723QPOpzlkz/M3/ySEAYo2en+gLvB7cb8nOwpDEXM8obafbmnyC5o5M7SjqoURQ827rBL8ne3VhaC9YMHuXAG9kUFmWcu7bZ1Oqe0TLYJMvcK3gL+UkkP1jMTolQaMSR/uQbw7zJNayd+Mj+vNZh6QpLm39hMwzZCwkkokiOkYxTcye3q7IYW6n8zK86O4LKq/Hu83eiLyyIvfKnSEKgf4+rU5cNWh45ITTmcrOWb8MAOlTxl2t9n74JcwV9TlV+iIm3yD/iCCSfKqw7dcKy+qfJcUge/4e3xPxXINCnSYcXRkCbWcWRBt6vw4rM6dErTzsTh7NMfuj8VI2Ke7rQy61/bMYd0ld+tb/qhb/+EiFwJPPyV99L1lEbpw4eIF7zRDGehg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(6506007)(6512007)(9686003)(4744005)(186003)(2906002)(478600001)(26005)(44832011)(83380400001)(86362001)(6862004)(6486002)(8676002)(33716001)(82960400001)(41300700001)(38100700002)(8936002)(5660300002)(66946007)(6666004)(66556008)(66476007)(316002)(4326008)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0wxTnFBd0hIR1R0R2dIYzdMaC9BK25pbTVxQmdpdHd0c1hxcndvbTRFSUFS?=
 =?utf-8?B?cE1mRTNPYjBrRUdIN0M2aTRSbGpIU1Bpald1SEE4U3JvSEJKZ3BEMHdZQnhD?=
 =?utf-8?B?QjdxUTM3Y3Y5dkpQSjJ4UWxzenNCUnFNNmJSb0w0b2RMQmpHU0tRUSsvcjFW?=
 =?utf-8?B?UFBacGxDbnFtQkxzaHJVUnZZdzB3Q1pvelFKVDU5TXpvcXphVm5Gc090V2RS?=
 =?utf-8?B?ZVdCZDZMcTU2cG9qNVFPYzJ0Mks2U2Q4UjhhZEZ3N1RDN1VJWEI2aVhialVp?=
 =?utf-8?B?UEFMTVhic0lZam5hWTNTN1FUVEZEK2JVUDVmNXJYczNxSmhWMXZ2NVBTQzFu?=
 =?utf-8?B?bE9SN3VPWTd4K2ZiSlFOdXNQN1d0QzhVdkEvUWtzVkhKQmx5YW5weGdNTC9G?=
 =?utf-8?B?VVNnVGR4eHlITzROSUl1OVh3QjBYK1pVK0xhT0JtVU82RjE4eUJ1RnBMcjMv?=
 =?utf-8?B?WHQvcTFwWjN1MzZUa3FjS0JiWUNoaDI3Tk91TEhqSFpHeDBBOHBIOW9DcTdw?=
 =?utf-8?B?VWpjVnI2WXE1aDBUV1UrZlNzRDZmSW5jVEJYVEdkYTIwLzJmQUlYdVdVU2pL?=
 =?utf-8?B?N0Z4QmFraDBUZ2RKcUxXb21HSUZlVUduY3BnUEJmUTg0em0wRk1SUkhsUkRB?=
 =?utf-8?B?OWlRdmMxaWI4aDRqZ1VQR3B6VE1sRlU0VUlIWGFWZWoxd3hXT0Zhdml0N2xy?=
 =?utf-8?B?R2ppMFE1NGNrQjlFYlVKeGFXOFo5cEZoZXRDTzJnRnl0Z1AxdHJqMHI1R3J2?=
 =?utf-8?B?OFArWlp6d2V1amdZVEFJcXF5RVJtT0hDdHVmZm5PakZaVEJtWGFoSm1oWnhB?=
 =?utf-8?B?Wi91THVRc2RSeXJ6ZGFGMmVUaU1PQ214dDQ5SUp3SWYxUm8zbmNLWExXMnFu?=
 =?utf-8?B?cE1zMFNDQWRqa2VvZ0NtUThjeG1jUVFoRTBvY2k1SmxscUlYeUROWjhpa1RU?=
 =?utf-8?B?enlGUXZ2djBudXIxcjc2V2JmeTBITWh0YnNJblJpbTNGRlczUHVEUjNocXRE?=
 =?utf-8?B?TitER2lPZDdCOVJuS0VhME5yamxYb3M3YUZzM3FuemZNdnVRMmVGQS9oc1d3?=
 =?utf-8?B?dTdOS1dkaDl0bVI1YWMzdWkxV0ZWN3l6WmYwM0dHMGphM0JQckl4WTJJQysv?=
 =?utf-8?B?OXErZkx0NFpYR0xEUE10TTBmRERJMVd1dC9UR3FJaXhNOVk4M2dGVzZMazk5?=
 =?utf-8?B?YWVGbWhVajBUWldhbVJNWUdwMTFERmVkbm5mMEJLMkdETUpqbzE4YUpZSEhT?=
 =?utf-8?B?RnlxSVZNSmVvQ1JnMHBEei9QbkM2T200MnB6VnZ1Sk1rT3pyRDczQnkrbmRF?=
 =?utf-8?B?RmZ1bjNFUnFyWk43STRmQjhHRVlQUS9SZ25uenczeHNkeUloK2NTdVIrYTVO?=
 =?utf-8?B?NWpkcWxucTVPWERKbUVISFVJak5GT0N0aHhuS2FlR01MSWpaVXU3Wm9NYjUr?=
 =?utf-8?B?Qkd2T2plMDBiZURMM3J5VWxneVNhZXlvNFBQYldXODRZUjc5b3VoUng4RitL?=
 =?utf-8?B?WHFxOWdMQ2tsUDhFZ0NKNXhscXptVExic3hiNWpyS1NIYWtvOFBrajJwVVlT?=
 =?utf-8?B?SlB2bUZ3bS82SFZVemNOT3daTWdjUFZ1bmJQMDVZNG9UVFh3dVphWHhVSHpu?=
 =?utf-8?B?YjB3TklhT2dGamo3TTRqTURyNTFWdDVjNFBmM3FHcjRvdkQ0U2ljd251MUZX?=
 =?utf-8?B?YlVHUCtmQ0xZa1czc0c3M3NiRHoyUGdYQStaTmdLK2VGNzFOaEtMTWRNZ1Z1?=
 =?utf-8?B?Y2ErUnhPMjE1OEdZczN4VXptTDcwaVZZVnlWa05sUmdwWGRZVkZtUlFvYm5v?=
 =?utf-8?B?SUV1ODhKWnN2YkQ4T3AzWTl3bHVxTENxeFFJempOb1I5NnhEdmZDQlo5Qk4x?=
 =?utf-8?B?WmtmLzhDb2t2TGRmS3RScEEvN2NzMEF4QXo4aE1NaWtieTZPQXlsZUtWdzVD?=
 =?utf-8?B?eVRuNG4rYm8wbXJWaHFwa21TRzJISkRKUG9vRVhhSWhndUhoOURRaFFvSytm?=
 =?utf-8?B?WXIxbTZKOElYa001MVl5RHppRkJVQy9udXFkYW8zcjNsVFR2TmhnbG81SCtj?=
 =?utf-8?B?bnJPZjNyMkFFTmNKY1A0WGpDUzJVdEJmWUp6YzJDWStCWmh2QTd1TVFDTmk5?=
 =?utf-8?B?bFpoZ1lmWG91L0dlMXRMSzBiTTd5ZkFGeU5UeFllU1pMcTlsVXZvZUtaSWFY?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 598beab4-9643-4409-6e30-08db604dc61e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 14:05:35.7376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCPZRnIDk7FfGzItYM605pccJH4izalL01s8LUplssktyQoCNwa0vGf56q2q1qx+3/HZknhOzOZmte6GjL+M3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7913
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] fixup! drm/xe/debugfs: Dump register
 save-restore tables
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-05-26 13:34:59-03:00)
>On Thu, May 25, 2023 at 09:42:34PM -0300, Gustavo Sousa wrote:
>>Remove repeated header inclusion.
>>
>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks! Pushed.

>
>do you know a way to check the header includes that we could add in
>our CI Hooks
>(https://gitlab.freedesktop.org/drm/xe/ci/-/tree/main/hooks)?

Well, if we just want to check for ordering and making sure we do not
duplicate includes, I guess a shell or Python script using regular
expressions would do it. We could even have checks for grouping and for
checking style (<> vs "").

That said, for more advanced stuff, I wonder if there are specialized
tools out there that would also do them. For example, sometimes we have
some files using stuff defined by headers that they do not include,
which, IMHO, is not a good practice in general.

--
Gustavo Sousa
