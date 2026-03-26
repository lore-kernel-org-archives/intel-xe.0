Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E4E10A88EC
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE5510EB36;
	Thu, 26 Mar 2026 17:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPzVhxqw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CB810EB31
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774546298; x=1806082298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tw3I2U5puxGZprukLaQDdZHPddhKAgbKMYUv8UexFEk=;
 b=RPzVhxqw+h//lU0O2MG2xrwS6JYQJ5vzm+7Y+xG6SLVPnao8UN3ntlua
 C0TVeZyRA0dpstR6gDQ+5+IvQGxVkOCas3+8nozBYv3EgsKxgYr/ye4DJ
 jGeMqYD6PufFkcNhGuUvehJUavE4SwrO6v5WSiGWFB1Z0//tp+7SEFpUr
 goB91eo6lQzNOnF1YnMvKld3rx/IDbjCAb4WV7Ugs90uPEbrgzJ3PGsXp
 tyjmxxe4a0AivIxQvFhWkzVrs+VDKUOijaJo5AzMD57+fxC8Rw0Kyhnaj
 EIQNV92Fovr+o9g5FxvqtNqiQ2dpOzGK3lsb5y8xud8uFdzw1E7DgxZi8 A==;
X-CSE-ConnectionGUID: ShtfEpNRQoa/dRaGxNTVOg==
X-CSE-MsgGUID: 8u1TWzEYR0SLQRnaGDnOjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86307139"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="86307139"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:31:38 -0700
X-CSE-ConnectionGUID: v8TZ4f5GQkGJH8Dvk2F/6w==
X-CSE-MsgGUID: PyC3AwDLThefF5jQE0x2IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="248449407"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:31:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 10:31:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 10:31:37 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 10:31:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UI5N8L2+To6X7SBsBPL8Y5PzNf25BHx0uEDGXfK+9GE3C6K0y4OVePH3xsZ8qJcB5CPARBGbRPH8pWbMDdzH3zztSS4K6RS0mnpF9mn89nCmLBwkrrAweL3o+2oo9VRjllQplYOoOzd+susFKvXIzjmTHlQsBS7oa2FGyNK1xt/NXUOcrLYcgULRfcoCgfbxlvvpQ73hIwbT1STQZ+9nYKINDmgr17zHCg6ZKy7ovCls0DVU/W6AgPYyBG6pwmO5ZEOClRuR4bBn++uf4a1e+oAyiBULWT7D1k7eyQ6mT8CI2cqRUCVDBmHfwe4v08IgXJujhhJAZnMM+ayIOIWWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoKcRe4J4rEL3ScX2vATlpGuqHsQ/LgDyhNAQseDZUM=;
 b=HovIe5byJsF1OFRGOmc/H4LMi13dpAUxrXpbtu9xjo4e8MM9bKlh1TsFeTE0GtUcpnM1+VXR4Vdn7pCedYBxCt2tZuEk+2U1ezHK3IOt1qYECPFN2GGw9NUsZbzeV56zpffX5eOYV7H2NLF3Yeu8vxzxkn3LTQE9YhaeTTjoqTusic2eWP1P1rSkaGF/YmnIokfrYSour7uiE9tyiIIEQrkGnAhU1OKiykyFNo5xO+V8DdkRLNH/9CrM8KPLRrkYvVdssPspeQxAb5Q4hI5B3IqGt54wAiBqSqhl2NNLpqkh3XjBHlFsDwV47CbWfP+EVlib3m+r3jsVH2oCNsb76w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ5PPFA0B9CD929.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 17:31:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 17:31:35 +0000
Date: Thu, 26 Mar 2026 10:31:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v12 7/7] drm/xe/xe_pci: Enable System Controller support
 on CRI platform
Message-ID: <acVtcQzID6Wb9bB+@soc-5CG1426VCC.clients.intel.com>
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
 <20260325120030.510480-16-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260325120030.510480-16-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR04CA0151.namprd04.prod.outlook.com
 (2603:10b6:303:85::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ5PPFA0B9CD929:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2f02e3-46e9-48ed-70bb-08de8b5d8726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: sHfqhKS7WK1PB7LaMEMw0YJI1U5UwabtQYLqyPm4eCHlilNLzzVP1U7aRyu6VhuKRy0FF4QmYtctjR0GA+QcuHfm1vaXFwftJVlMCnhYI5ZoL6ZfFJ4JPgtHDnfFxgi0+aA/bUxPCet0D/WwqZuWJGoL+7vFkOCseUWobVthzU+Xg1CwjhCIULYdI80YblditT9N9/Mr6uJShchekIlvuEVu2bVq8ccO4U/V7UrXdEXhia4CwqUw4xvkj/gr2qw/HNomOpwCawKbRT9jHLxSBkLSFI9sGQDLGjkj2pakF4peyAQOISScoz5EBrvQ8bE9C8XCmOaebB+fPhCQUCOAQbd9yHSkfnRphyU7NJuHezJzXTBgXU6ZlF4Vb0zGBbyjTnuqSdYHYvM4L4oHVPn80nG8BvjnXpIAkBRmn4bwVY5ouBxQ0Fn1qMUiQYv0gXS15ikIR7pIChKvF937ywlXWn90vLMq2P0MRq54w6M4a/As8I9EmARBg3+h4dSFbGtq5OXpUuF6vcAqV02hvoGoZs52LNJYFGdThAhcoID1TmjEK0R7gJq91BkDllkog25yVgGlGwIxH+tTMpliP3bc9/H5ykMP7NVR4d3MiO3wwwCSD0c/tTXKVBLXvxTRFkYk9nJzLxI/1HHJkflPlJrvB3+PqIv16x6yJXRA3LTfgY2i22jv7XIP7foNtFV2bbW1DBgWXOFJUFc9Kj7quJZ6gsFJvhxeAsBhkEphTkQgug4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVcyRlpzM0tvaTNUbG5PclJWNVJxU0VxUEZ0dEJ5K3FhOHNlZXFVWFlTN1Vo?=
 =?utf-8?B?K1pNR0t6Ujd4dCtQS2dsNTRyR0NnVnVPMW9abXp3cjYxVlVNRVlUdVBmeE1L?=
 =?utf-8?B?QWpqZll3MndvSlU0cmpwdDRiRStobzRrdzc3eVRJaWg4VGdRTW8xYUN5MmxZ?=
 =?utf-8?B?cmNJUEpNWnM0SEF0SEZUZHlmNERZVDBjeTdwcFRpRHgvbEtYWHh2Y1lMa3Fh?=
 =?utf-8?B?Rlh0VUhIdFViUXFPd0dNRWtXMEZwekE0SEtocllYaUxSWnFNRHMvYzZPR1pn?=
 =?utf-8?B?RHpYNG1BbjdEa1B4MS9mZWRrak1ObDI1TnZCSzNWUkZJWmdaMUpoYlFCR0ln?=
 =?utf-8?B?eUtHM3VBclF3cmU5L1BvL05kV05HYXVGTU5WMGZkU1NLUDBuV2FEQ3BWTlBz?=
 =?utf-8?B?NGdsU0pjMXJaL3YwMWFxK0VGNnUrTGRPckVBNFhyRUZwbTRQTGw0QVV2N3BH?=
 =?utf-8?B?MTdIU0cyK0xkZGIxSEQ4YXlIY0hiMGpnVXFMNjJrRzByZENWQXo0SlI1U3gx?=
 =?utf-8?B?djNpREJ0L0xzdnlVVlgrNFl0Y3BmUEc0K0cwQVFVbktQL1JEZDMrVjNlVlA1?=
 =?utf-8?B?K1ZjV0VJbkRNTGtXTFNpRjQ3cDM0Wkp5aWFTUkJwd1hnWFJmQ2JlaVpBZFZ4?=
 =?utf-8?B?VGEwd1hoOTlNYUNzNGJJay91YWNMblE0RGV4Ui9xOVdDTGNqTUw5R2dtdlR3?=
 =?utf-8?B?L2x6UjR5YlJaQnZWa3E4SVN3cHVyMlhpVXF2NXA5VjNjcTBYL2ZBQm44QkxJ?=
 =?utf-8?B?NVd6ZXJaeG0wK2IxTE9GUmFsMXJYZ0NSSGY3VFhGbU9GSkRXbXZJelQzMkxj?=
 =?utf-8?B?QkY2ck9neEpDRmJoNWZTSzFZS3lRQWYzKzJhaG92NFVDNGZLck5yeC9tb2lF?=
 =?utf-8?B?TWkvSEtya3dyQkMrbmkrRXFYM21MNFVnRDQzeDFrcEZQRlF2Mk93RkwreG1y?=
 =?utf-8?B?SDh4dXA3TnRTUEoxdXpYbVg1KzFQdVdTckdSYVo5WmRTZEN4cm0rZ3A5QkFE?=
 =?utf-8?B?U0k4SjZBdkhjdkRoUzJvMFBxQW9xVldwOHZpMjdob1pQQThsd3ZYcGpHekRF?=
 =?utf-8?B?WGZLcXd5TEorSmFyaytVc2h3bDQrK1MyRk5vRkRQd3lEZW9pRHVIWE9qNzZ5?=
 =?utf-8?B?RUdjTEN6SCtPN20vSVI2R2x4SmtKaXV3MjBqRUFXV21UU2dWSG1KRHVqZ1lV?=
 =?utf-8?B?WklCMzRoQ2x4dUNWSGYxS1dRVTNocGlHVkVlZVBBRHBqYklYOThjRlhpNlBt?=
 =?utf-8?B?NE9ETXhZYVhsRnNVV2FqR3Z4aXV1MUlzaFBxTERnUXNWMTFyVUw5emh6N2J0?=
 =?utf-8?B?WHo1YjFRQi9DZ2FSK2RqeXNzejFSQ0YwdTh1cS92cEpuM2hTOUkreGoxMThH?=
 =?utf-8?B?cDVvZk9OQnFDdjROL3RxbDJCd1MxbUwvdTJWdjU1RzdkR1FNUUo3NmJDd2xq?=
 =?utf-8?B?OVJpSDdubVZrTnlBN0R3UmlzdDh3Nlh3ODRxQ1d4RFVkcHJnTk00SWVwSnNv?=
 =?utf-8?B?WkRWSG03NTJWTlNGdzdOZURkclBSRVBKbEZ2cjdtVElQTFp2ZDIwOTNaaVVa?=
 =?utf-8?B?d2RrYkd2RE96Zk9UbC9XcThObWsrZ21TK0ZZRlVabk1lWDdGQlVJalZmQmNH?=
 =?utf-8?B?SE1ST005Y1I0L1RIalh3OG9hVnlqaTFiWjgydjlhcks1MUhHL2FBSHNsSElL?=
 =?utf-8?B?SlhCQ3RrTnFHdmtwQ1VkYS92MkQ1aGJuYVFCNXJhaXhGZUZwWUZhSjJITU8y?=
 =?utf-8?B?L1pQclJRYnhKZmJkd2FVRU4zRU9QZk0yR0FJbTVDRGRmQWdrdk52bEZRdlVJ?=
 =?utf-8?B?ZWoxNmtwVm9RQVErK1R6VHJYQ3VMdS9UUGJYUFJHQWl5aEcrdHE1Z3BMdUtU?=
 =?utf-8?B?UmZUb0dEMHkrMnIvTnRKdEYxdmZRRGh3ZmRLU3k0WHc0cjBpMGxNdTdPWXdk?=
 =?utf-8?B?OFkveEw1SFd5ZGtDSkcvaFovZnJOQVN0YUxWTFRXTnp5dTBNREJzYW10YUlP?=
 =?utf-8?B?S0x0RldUa3R2cE9UZ3hqOFhXQXpNSzQ4bzdYcDM2bW9IKzN4VHI4bGxsODg4?=
 =?utf-8?B?aThYTnJOY29rV0lCalFha21Va1pnWCs0VnkzTnV2VmFTdFNNOWdEVkpnVEJQ?=
 =?utf-8?B?ZzV1S2lzODFnSjVsc0NPWTRvMCtoNm1zRStsNUJFK0RNM1VkdmVDdXlpY1FV?=
 =?utf-8?B?NnpreFpXeTFFVWxQcVh0UHFOOFNnT1hLOUZrVHpHaGtKdWxNd3lXQUMyRWRM?=
 =?utf-8?B?OFpTQWMxL0lGeTRsUzVqbno1VU5rSzMxR3ZiQ2RsRWQrckNiQU1nZElQNkNJ?=
 =?utf-8?B?L0NWWVBZYTFBN09Uc1FUMlFjZG5GNDVHUUdCbDNVSi9KbnBrcW5EeVpFOTFI?=
 =?utf-8?Q?wudvj7Y9y4cmluAmfTVeXl7ZmNY7IBdhZWF7N?=
X-Exchange-RoutingPolicyChecked: mtAyMGqENbuly025AnO/uQfYglkvPXuFwM697H4FF3W80i1uRKpp4wvVZ3+1QxvgO7K9mqqp6iT9IInNqvU8vp5bm8ecs/LLGKAicjKisR5bh/p6ntXL+xwv8QsfY2SB0xC/HvGu+oL9OSohWorPnCRQ5fqJLeVow5Enbj30oeYyMVzDu9150eVb+BI6xVR/dDxL2Ej6aBJsZhOaVQYcfWwA0NlleOktKzEs0eSykVjfAn6DB7vvrhH/8DhdU0GFllXf2w6CfmLsiZXzoaVH0ZXvj5PSa2+rFiu9Aymgi3vSlLm0iVUdPgr3pusZCE32qENKZRj7gvKEChy7+ZPF0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2f02e3-46e9-48ed-70bb-08de8b5d8726
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 17:31:35.0993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivSI2xYJi5+oFMUysSzQK3csxHN+n5+Oh7MfgEhSsuYD5/34uz6W40lCROpdRYetDoprTal8cYqiFE5CH9VB54McWXy8k2yN2Q5mArr2G2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA0B9CD929
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

On Wed, Mar 25, 2026 at 05:00:34AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Enable System Controller support on CRI by setting has_sysctrl capability
>flag in device descriptor and runtime device information.
>
>This allows sysctrl subsystem and mailbox communication to be initialized
>on CRI platforms.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v8: (Matt, Michal)
>- Reordered patches for logical flow
>
>v10: (Riana)
>- Cleaned up commit message
>---
> drivers/gpu/drm/xe/xe_pci.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 189e2a1c29f9..f5dd77b6680f 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -465,6 +465,7 @@ static const struct xe_device_desc cri_desc = {
> 	.has_soc_remapper_sysctrl = true,
> 	.has_soc_remapper_telem = true,
> 	.has_sriov = true,
>+	.has_sysctrl = true,
> 	.max_gt_per_tile = 2,
> 	MULTI_LRC_MASK,
> 	.require_force_probe = true,
>@@ -764,6 +765,7 @@ static int xe_info_init_early(struct xe_device *xe,
> 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
> 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
> 		desc->has_sriov;
>+	xe->info.has_sysctrl = desc->has_sysctrl;
> 	xe->info.skip_guc_pc = desc->skip_guc_pc;
> 	xe->info.skip_mtcfg = desc->skip_mtcfg;
> 	xe->info.skip_pcode = desc->skip_pcode;

In xe_info_init(), you could disable has_sysctrl if it's a VF.

if (IS_SRIOV_VF(xe))
	xe->info.has_sysctrl = 0;

Then you don't need to sprinkle VF checks in sysctrl/mailbox code. Just 
check for has_sysctrl everywhere.

Note:
Ideally has_soc_remapper_* should also be set to 0 in xe_info_init() if 
it's a VF. Note that xe_info_init_early() does not yet know about VF/PF.

Regards,
Umesh


>-- 
>2.43.0
>
