Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED131D1AD50
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 12:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CFF10E6BA;
	Wed, 16 Oct 2024 12:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlLVN7e7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B71510E6BA
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 12:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729082351; x=1760618351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pXWPu5N/a2Egz1xtcmixBmCW4eX6LS0CysHhEnxQGOQ=;
 b=JlLVN7e7cLhzZn86vHkRX94NbfSkKtKlzeUT2wdwRC4y2wmJs2RVSlv4
 jK/EIRrYStDDyF72T2hWvSCO8OA8NQR9uBIuuTH7omn+YqfPY3C5hQOfd
 Uj597uOLsOVd6dxUQn52lcBsaSQRaA6e1UPpJf99ELkBwboUqbDh0/G+b
 FDvED2m4kXo3TTVb3ug6YLXpre+W6jk4J5O2jmXhgCUi62IhFv/ovhGFh
 Vjyn0ZHShZuy7bcSXiP89tLubCD0flYNgyaK7sW5a7zI4dBeut7oHNdQQ
 mt5eWLMl/4LY8gwXxEwK2BX7XrcAFN4K/1jD+3YYlSYWJc7TFzCGhA9Mu g==;
X-CSE-ConnectionGUID: 8gfDNCNeR3iJGslET9dYnA==
X-CSE-MsgGUID: YFZvcANHTQymA0gTE2O5EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32215587"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32215587"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 05:39:11 -0700
X-CSE-ConnectionGUID: GLDHhzAxTPGlATg7E6Fteg==
X-CSE-MsgGUID: 1xC0fJ4QQ2K2l1/0K+fXFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="82759727"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 05:39:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 05:39:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 05:39:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 05:39:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9XHxqx1eE9kX/9uMrfbKfdqrJECq2hWUX7+9GEa2it4FJTL4r6UbE744rw/UyV0UfD8qbl76ZeAa3zCcPq4vcgc/b9iBtvaBi3Cw3wpnOlhOvA1RrWhaBI0W3qCCgTwTL8rVABek6M13aQK/qHe2cc3423SlxJFQCWEUH2vubW353f4s3z/ZApfbSn9SUZnqiwTeiw2eF6VFoPOaqRwr9u6rTkZwJcJL0PQDixPGyb75ITwQpQ4rMhaA4/WxfiE0AaZFsB0KfVH1roxo0IwTIZYSxDdiZcC040xYvhTMhNbzZQ51PUPcFo1DYW2rICydwBBI5lbSM4bXBhGOUjRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORePNnR0ovJSgpyaxYiTTWefVcOpYHAw4w/j0vGnXcE=;
 b=M466oBGiL2H1M1wYeKq3tnfPRi6kmgAzp9QZilHrdPmhV6HT+7BocRNaW4pgYTy8ClGmULjaZMixTpixpDFzVt4dlBrttOiebExqzcNQbs/ycZ/ARBuuJZT7dH+K94zPooV/ZDAr1wOl4uXB+H2oiu7ge7fTZlSPSA+oTZp9nu+0xjdUwZv1KM+TbNz5LtRQEQ53y/M5ijIEO6eDeP1GIzApsOeyvepkMCsYaNC5HRgUCQobLg+Jq6TABYDVd/q8QICIkZXqN+Znk6ghqGXwgw5bSIc/PR48BM2Ei2iSxsBw1xWTrDyIG7UzYipZC3yF9zJhU9aW0bzT6xN9TWhsBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB5890.namprd11.prod.outlook.com (2603:10b6:303:188::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 12:39:06 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 12:39:03 +0000
Message-ID: <0a8e3aeb-b6fe-42f0-9fdd-afc323b3a5d7@intel.com>
Date: Wed, 16 Oct 2024 18:08:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 21/26] drm/xe/xe_reg_sr: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-22-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-22-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b7b25e-790c-468b-3501-08dceddf845e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0pNbi9rL3FJRVJFeHNHUFkvYWpYcm1wZEU4MFdDMCt2Snp4YWt3VlhaSnhy?=
 =?utf-8?B?UXMzejdmMVE5UFo0bGRLT0pUNjRwRFRRYnAzbDROaGRNMXBIQ2lpOXZKQ3VN?=
 =?utf-8?B?enJGZVdxVUt5NXd5TVpmTTloS00vWWpTRGxxRS9oQUhoSm12UzNtLzFJUk1G?=
 =?utf-8?B?emhzVCtrSWdsbDVJS2ZjcVlxYTlTQ2ZEMG1QNkdScDV1cmc0YU1Sd3pndm9q?=
 =?utf-8?B?UVZUVVBMK1RuY293cmlkSjY2K243cHF6RjY0S01URnVKQjcvWmFoeDdDbzkv?=
 =?utf-8?B?djBQY0JsWXB4RDZpTmNXVzFyQndsaXNVeFF3Y1BKbytmQSt5Q2lRUURyY21k?=
 =?utf-8?B?ZFRwTDFScSt0b1FqamJhbm52ZjJsZEUwMlovMWdjQ1FZVFdjZmZhYnphTGUz?=
 =?utf-8?B?ekRtL1ZCeFJaam9vbS9tZjJXeHl3bzhQU2FFT0ZtNnRwbWdaWEJRbm9HYlJE?=
 =?utf-8?B?SmpaVVdqa1BaRjVaZmpIRVhRaFJjblpZek14YVlKaUZDWi82MnpPUHphWUhZ?=
 =?utf-8?B?SEdsQXlzS3Yzd0FJMVFGVk1aVzBQcmpQeTJ6TFA0eUxIdHNYRmpoVmkzNXFD?=
 =?utf-8?B?WTBUUkVocXNlSy81U0FKV1FoL0dtS003ZVJxdG5BL08yWHRkZnNwcHhRVU5j?=
 =?utf-8?B?RUd0MUkxUER5M1Q2T2czSjlvRy9MSURaeUFzWC9xUVhDcFdwcWxWb0piWmtt?=
 =?utf-8?B?SGYvdHplVE5zWXVzME15MzZwNTRoR0dQVFZmQjNxWHU2aHFHSnFkVmgzRWpP?=
 =?utf-8?B?bk03MmV2WlRaeG1RbEFRSFcyckQ1QlhyQVBIWUt5RGlwYUJVYTJ5OTkwVVpT?=
 =?utf-8?B?Uk1Vck5sWFdiWkxoK1d1UEtxOWZKNjJxZElGV2N3bjZZcmlqdzVGcER6eFlm?=
 =?utf-8?B?NWRqYkhRdWpNRFZjZnFLQW9yRS9kNnhzeVVJOUdBcmtUWXhFK3dmN1ErdVVJ?=
 =?utf-8?B?ZUxKdEZvNFI0UWhMb0U5STFicDRGMUJPQlV4enhBVlVKc0wwY2NqSkExK09R?=
 =?utf-8?B?ZnE1a1krVjJ5VzZ2UVNvckpReWFlMDV2YkpqUy9nZllsVjl1VEgrcnA4MkJK?=
 =?utf-8?B?L1Fxc0RURmZoblIvc1NLeW5uaFJtRmpZUGZCMWFFMlZLTlNsTlhYZGRoNmJB?=
 =?utf-8?B?T0JXcjdEVXdDNFRnVmZyMnNBeTBWbW9GRVI4clBPM09uNTVtaG5xc2JmQVND?=
 =?utf-8?B?NjM4aDJYeHJRNU5CMUtma3ViNzhWSUpyZ3RrRHgvUEQvWUwzbVVucjQ0b2Y3?=
 =?utf-8?B?bXEvUnZ0LzllUSsxZDZEQk5TSEhDYzFUTG5LVzNsRU9KbG9ENUxVcEZCUExT?=
 =?utf-8?B?WWhCeVZLRXQ5MHhLd2FHMzRmOW5LK0ZkdFNGeGRkWEdPUm15NE1HbEllTDVn?=
 =?utf-8?B?anpPRzVQNVh2ZmJKcldPRm96U3EzNmJnbmpKT21EWWc3eUxwY0dSNXVRWVBN?=
 =?utf-8?B?ck9LbGFJck15OHUxalRqeVl4dk0xSjliNUZjTlNObWFlU09iR00yazFOTmd3?=
 =?utf-8?B?aUZBTmZLT0dMcW1EVnpKb0tBZ0JxMmdtUGZ1b1NzVzkvMS9BTWY3Z0JQbFVI?=
 =?utf-8?B?ajdKUWNaa2N2VmpPOUtZMFRxbHJoekFhODduNlZPTnNoSFB5YUF1QWJaSExE?=
 =?utf-8?B?UnQ0Zk1NZ0pVMkxkQ3NIb1NiNjg1OStFN0hsUDJUOWtzNThqaGN6dlRrSFRX?=
 =?utf-8?B?SWhXSzErYmFVOHczMWFhTzh2YStWTWJUU1pPNWdNRThTZkNkaWVKYlBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVcrRXhJcHNiVy9DeENQRFFySGlMY3c3Tm5UMnRUSHRpQ1hkMkhRbkJKM0JV?=
 =?utf-8?B?YURkd2RiMjFIWVBhR3pjMFFxTlhyNXdzMEpsS0pRL3hncjNjYWF0c2pqdWRq?=
 =?utf-8?B?WGZkVWRGTWVwQmNUeU00d0VhY21uZllGSjIwMWR6ZlZLVzYrWDZnVUdWN2k1?=
 =?utf-8?B?ajlaVzhOSk43STNveWFVV2FkR3ZCSWFvTzRCNWpBUVVmM1p0OVhWN0tkMHZz?=
 =?utf-8?B?VlJXNkVpcHNmOFlCK0dUNjQrK1VCRkw0ZkxLTExWdHBSU08yK0FXaW1sVnpk?=
 =?utf-8?B?WStpS0x0ak5WY1pwSHpMUGhUcTcydGVzSjF3VnBFNjlKVUdhUWRidUYvVGNH?=
 =?utf-8?B?Kzc4ZVJYVnVzbjZ6cG52M0ZqRHRXanVCRjVFdkVFay9HRWpEMGtBK1liNnd4?=
 =?utf-8?B?SmhFZ2Uzd1RPQjRCZlVGK2QrTEVwNWZnalV3bmZpcy8rUEgzSHhhQmhoRVh0?=
 =?utf-8?B?OVJlU29SNVdUWkN1QnVlMTNGaFloL3dhUVNEc21MajlGZ1dWM2syb05Cb0o0?=
 =?utf-8?B?clBYcW10M2pYMVJpcFI4T2hMU21jQXpKNU9NLzRQdElYM1cwMElpaFVFWU9T?=
 =?utf-8?B?NWpKZ3U3cmgxZHc4QkMzSURGRy96UzlOR0IyclBHdm1OOU56WXZ5cms1bTZC?=
 =?utf-8?B?S0NaUlpDUDNISi9rY1VzNHZEa2lEWUtIVXY3WWN1RkFhRlNOY0hqcUZnaTJj?=
 =?utf-8?B?WFZ2bTVoZEFnMis1Ti9GdmRhTHhUNGRja3cxa1czOG1ic3cwYW1qQnh3Tkxh?=
 =?utf-8?B?MEZUTVNWNCtOREJGT3dUTGR0REwxdklpbUVlS2xlZkFRQm5QV1RuZ2dzK2wv?=
 =?utf-8?B?aTUwUGpTNlZmV0FBbUlNMy9aSVJCWjMvdHd6L1RuNzFOWXdqTk9rdEtYVHBi?=
 =?utf-8?B?V3JiUlJpRWJ0QnVheGwxSlg0bVNEK2FnRGc3YUR0dDY4UEY1eVhWalhFazNV?=
 =?utf-8?B?TXY3NG9MOU5sK1pYbmNtVThLWVVUK0s4b1g3bXN6cldyS1VFSGNPU0h1alFN?=
 =?utf-8?B?U3NUUFBrN1UxZ1ovSUllMiszeUhyV042U1lkQzczeE5qRGd3Nis1Rm5paDJz?=
 =?utf-8?B?RWhuM2xuTUkzOUMxdW43SktyNWpQM2Y2c3paeWdETndGQkV6bEhOYVhuWWNQ?=
 =?utf-8?B?ZmtOeFBMaWxENlVtSUU1WVdoWlhmVXh1SUJLNG42SWRDZ01KUGNJVHRobGVI?=
 =?utf-8?B?dWlDOVQyRE42V3o1RmRBRHZQZGdpNVdSbXVFNGM0Tmt1V3FnSkxqaHcrOElF?=
 =?utf-8?B?YkNTak5iKzBnU21rVWNmYkRLNU8vWGpMRXJFR0dYb0dhSzNsTmNYcXNKdHFx?=
 =?utf-8?B?SEVRTmYvZitDR3k3clJ6NE1WdVExQ0cyb3dQRDQ0NHdEM0dJd3ZhTmJreE5j?=
 =?utf-8?B?cCtDaUxyb3QweXBTSlB0QUZueFJIYVlEMEZ2Z1Nyclp6Ui9IUFZBWU9ITGFJ?=
 =?utf-8?B?MjhqZ0lJMk4weGNHWmJMYlM5dXduWURlWFZlcXl6cE1XL2Q0Yi9HenpZMjZ6?=
 =?utf-8?B?UmlmREFxUGQ1QTlLbEtyWFhqbXZmbFNjUHprMWlOZG0xL2ZYNDhpV1BiL0Vn?=
 =?utf-8?B?UjB6NjUwMW5CNDBLT2duM3plcktVcmFxZHRwTmhiQlQxK28zODVFZXBMR2pR?=
 =?utf-8?B?WFVsRkFvbFFwWjlLOVFRUWQvaDlwT1RvdW9pRW4rTEphdFVDejN4TVRaN2hQ?=
 =?utf-8?B?cWNHMjFvVEg4Rmt1dTdoaUdDRmxPRWpVU3hFMXlOblRhVkxBOXkxVUlXZkgv?=
 =?utf-8?B?K0pIc0lxNWkzcUpubm1Gdzd3Z1BXTElUR0dzWHBiODEwWVVDU3dHYXFOVE9G?=
 =?utf-8?B?VzNUUFZQbHFldWJZZkEvZWtlZFZDcUwzclEvSjRZdWJDZWlGVmdxRFVvOTlF?=
 =?utf-8?B?RDQ3dWo2U3F5ZXdlZktlS25uSlBwT0RlR0pNODI1U1lDZXhlSCszbDVDVitw?=
 =?utf-8?B?NzJxQlh5eXV5MENzQUxDblNZaURsc09iRXJQa3lmOHBzZUVMWVZXczltdk85?=
 =?utf-8?B?bFFRZlpFK1BVL29mMGxKbFpOaUpvRWFNVllnODdBamI4T3lYQko3RzVYYmNq?=
 =?utf-8?B?bmNvYjViTG1UZmdHYytNK3VTT1VISWJIUU5uay9ETERhdkxvbDBzWjJmdS9U?=
 =?utf-8?B?RTNKTWlBQmxmTGhlVzZJTk5TeStFZzQ2cHBFc2hCc3F1UlBMYURlRG85SDY3?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b7b25e-790c-468b-3501-08dceddf845e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 12:39:03.6806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFbZxQl8ui/y64tmSTkZceVRDPG8Wv5c8o+FmyCJa1BMCP4TO70a28zXXBw/RXUw4ibbNa1uyABQVgmjOJI50g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5890
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> With xe_force_wake_get() now returning the refcount-incremented
> domain mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does
> not necessarily indicate success. Use xe_force_wake_ref_has_domain()
> to determine the status of the call.
> 
> Modify the return handling of xe_force_wake_get() accordingly and
> pass the return value to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
> 
> v5
> - return unsigned int from xe_force_wake_get()
> 
> v6
> - use helper xe_force_wake_ref_has_domain()
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_reg_sr.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 191cb4121acd..e1a0e27cda14 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -188,27 +188,27 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>   {
>   	struct xe_reg_sr_entry *entry;
>   	unsigned long reg;
> -	int err;
> +	unsigned int fw_ref;
>   
>   	if (xa_empty(&sr->xa))
>   		return;
>   
>   	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   		goto err_force_wake;
>   
>   	xa_for_each(&sr->xa, reg, entry)
>   		apply_one_mmio(gt, entry);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
>   	return;
>   
>   err_force_wake:
> -	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
>   }
>   
>   void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> @@ -221,15 +221,15 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>   	u32 mmio_base = hwe->mmio_base;
>   	unsigned long reg;
>   	unsigned int slot = 0;
> -	int err;
> +	unsigned int fw_ref;
>   
>   	if (xa_empty(&sr->xa))
>   		return;
>   
>   	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   		goto err_force_wake;
>   
>   	p = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
> @@ -254,13 +254,13 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>   		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
>   	return;
>   
>   err_force_wake:
> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	drm_err(&xe->drm, "Failed to apply, err=-ETIMEDOUT\n");

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
>   }
>   
>   /**

