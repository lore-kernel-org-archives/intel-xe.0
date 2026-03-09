Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803F9FCA195
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 21:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4634610E5C6;
	Mon,  9 Mar 2026 21:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvJwHdBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2CA10E5C6
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 21:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773093183; x=1804629183;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YFXxhOinHJ/0Hs2U+zOvojSQ4/B8oYlNh5I0tGEMl3A=;
 b=GvJwHdBgXulQP0nO23bASYGAExnHLmbvy7OONBBGfRSSP+aeRegVtJpI
 R6yiebqnUsKFXYzHayunT2K9tthh1mUimX0d2x9YwHbViNtbiGIWNIOtn
 qn1ljqvyE9wn7PVvq5B9AJ/lSR/q/BtVGrOXACXrp4WpeKkasVoQWjZj+
 L2D6qx7596K/6pIoETCHEPwzJcsK4rEbRSbvylp+z1TJ4mHhbueW+x6TN
 G4WA5bX92zOH2uQ6gWwT73QI/O6K7CAgeO4WprFz7mYXT1ov5Xc8EpCNh
 bBRkOIy7UctSuxMR6epReu2BRQGeR53t+SZ1Fwks0iexaUa7dBs8am7BS g==;
X-CSE-ConnectionGUID: S8DFo+w2TTW0IHsPIw/lNw==
X-CSE-MsgGUID: Qy+KavKzQV6G6GaEglMD5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84839118"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="84839118"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:53:03 -0700
X-CSE-ConnectionGUID: l1gn12jyQy2pk9Yk39R++w==
X-CSE-MsgGUID: Jkt0fMUySBOyMhZ2Jo7fpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="220014479"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:53:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 14:53:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 14:53:02 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 14:53:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8V54FnA0DJ03Sn5AdWHqDyCQ4oNIhYoAan/zVnjbbDNCenPqQfhvRExTIRTiOCXow2Rm7C9PwTuh3of04Pi1iwcODrWvog9NMo/8tq3N6aSn0hNEXk4bgFivYYJEmqXqJbyNqDLXzZ7KI5sJej9730wfcQpfiVuSUbr7TYYhtdrUgzmkmveiY2ksr8ugOC5ZmHAwOkTmq7U0Q3xWwQNbUq0d3fmI25GtRgJnMZHIMOsPODJ55+kGPwJDlHOfba2R+6FTY6zGHJXXquvw33to/63IdPT3WQl9mOPTG99wi7XOJrDfZs9ZKKHVtNc/YyVd2d331m/GzVuIqVc3WQbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UryJ9EyjxRt7grJ53dbLNnYTJgu69wrlONQi3XPf2Jw=;
 b=DUwInWtN1Ew4EZgEjaA/cLJ+b4gW8v4RDiRtuMjVNupNP1eCbI2CFupZ4jY0Qb/tROsM1/Wf1+XdQvUh41uguB7+U+cwWC7GGjrks+RS7ECsM3/7FANg+ZCRxLPRncBbD6hPphR8lEzOnRiSiT9E+9FJWprhSz+r7pitnDRYR3GmvGWfpD1ov+ubB40wHMeKGxEgFDW202kqmzhTuRMlGR+TBFJW44jztcmOCOqEEqR+sPiZho0dtRC6dJuepZeDBl+odFy9akPJzWulvFXjwAMApn0SN4fbnwmk4CU3mCrpx6uSITYk22sII1+BPyKaYH/E104yT/ows40tay/mFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 21:52:59 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 21:52:59 +0000
Message-ID: <0e6bca01-3a66-4941-b7ad-03803d410193@intel.com>
Date: Mon, 9 Mar 2026 17:52:56 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Attempt_to_?=
 =?UTF-8?Q?fixup_reset=2C_wedge=2C_unload_corner_cases_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260224163555.218750-1-zhanjun.dong@intel.com>
 <177292957159.330391.18402526467924619694@a3b018990fe9>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <177292957159.330391.18402526467924619694@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::34) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c480ce-689d-4acc-6cbc-08de7e263a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: EWr6glpLk92wpWZn9nsBWrYtFcBBFnUPpsJ3Iwpzn+HAtREqIExeEgp1A3rqZPaKHaBLtP0Dkudr66w7KEdLOmyZE0y1RT8QmBTtucaSQg4/lOvTDfP8uPiA+QvNDhDtKaY3I/DEanWztnrYo/CtIOnmE2zqHfGzMNbKQxsEVmo6rPDxZKvK0UAAr5E2pSWAyobfXsHSeDIBf6F55EsTCg1Et3cIlCkFh5fGbwBCONW+kWL7JZgjUsk0BQwMdKLecYKEOQqTq3YKyrjHHKcmYk3jQ3gk5yx+IINcc395StBfP/ePMA1YqfBDwpojZ0+1nnmkyxujgaOBNaiyrdtr1PIk68KVuhsZFTa0t5dqAoVQ3D6HCidTjvIQrQ346pFEsvlkF3FCkdVfg2doul80BLbCbfsSudk5Iw7kIR9HC3LzfowEyzm1cqNsvSbgHh9cPZ+exYKaBEeVVqyhJ3lReYOHP9fuuVK7tDgEdwCsdluShP1q7RNf5DBAc3qDlIXczDZUVMIXS7VOgxsrnJ6igaT3LOaRkSahGfcWd2RMVsAb6mvy+cSPkFf+1RoNVsBwgyh7yE3QyRVYTv9AD/Adz9EX2IPu5zJe4oQJpkRQ2VkCG6e6l0ZqZq+qqVRm5FUzJbc2l4fzTtyQ04dl7xo27C77Lfaeepzr0tcXwGSh8jkfYZMNLUb0532HI0jM84y3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk5DN1pQV2E0NW5OQjFPOUxDV2psSkk2eW9hbUNNRmNYL3BIU0VvQ0V3bEJI?=
 =?utf-8?B?Y3VZbm15bkxsUjNpOFB0Ny9YYUlkOTdrVXg1Qm9xbzNyM2NsL1lWdUVJUGRu?=
 =?utf-8?B?U3NDTVRvRDFVS3pEODRBUDdiREoreExicDZTY0tEK2xDSXF2czRDTEFKdm16?=
 =?utf-8?B?ZVluTnQwNXM2MTdldHkyL2JXSjFMYlRWVVkzYWpmbE1mYVNMUXdtMEw1eE1v?=
 =?utf-8?B?K2NVZytRWGdaODBiSkVFVEdjdkljbkxWbmlscGdMZEdMb3RaOEtMdFYyb2pk?=
 =?utf-8?B?Q3pDTmJjcnNoYjliZ2RnNkNkTVIrODBOQmJGUFVHY3BlQ09YbEJlQ3g1NXh3?=
 =?utf-8?B?cnVZeTRwZmY4NjQ2eTNVdlh0aGpHQ2JsaktKcmZ0UGU2Um1LT0lQajloVHdY?=
 =?utf-8?B?ME1tMzdQYnVNL1lkU3ZQNXYxSXpsTUZMc1V6anZCYVNHSEt5WmgxMXpxcE5D?=
 =?utf-8?B?enRzdUd0M08rYWV4ZUFmSXkwK1h6ZEF1TzBCWUlJUkhmUFJSeC9XU2lYdWNQ?=
 =?utf-8?B?NUJaa0k3QXJDT2tPZGdqUGtaSVJOcmRUTUg4bVV5R3ZCZzhIY1lGM3ZEVGF2?=
 =?utf-8?B?eXVPbXBWdm9DdC8xT01ONzd6NWg0aDRaZTFNMkJPbUN4d0ZSalpDSG9WRkRM?=
 =?utf-8?B?Ty9EaWU5QnRmUmdLTVNxSW5JaGNBcnk4RVcraGV0QmRoNHVLK3lldWZpYXFv?=
 =?utf-8?B?TWJOTW1POWJSVnRKRkg3aXJNcUlZa0tSQnMzbmU3bDN2N3ZobVpXa2EySnY1?=
 =?utf-8?B?YTRZQnk4dVowVktXcVJUMk1aUys0OFBTN2FsRzQvNXB1ZFpnc1lRV3NjWnBN?=
 =?utf-8?B?WEtYNTFIMVV3dVc2d3Z2NVIzVGNZRWhVdFRtbHR2OW1qN2cvdTd5UllBMWtG?=
 =?utf-8?B?akRIU2JmODVybXFKUjVYTVRnSTA3VEQ5MUFpTXdDUXovZ25VSUJyUU9taTRO?=
 =?utf-8?B?U2tMcGd2TWgrU3ErVURRZ3YvbWcyYmsvanRmUDZVMlk2TlNMczdJSnVNK0Zt?=
 =?utf-8?B?MHFDcXdYTDVmYUhPTHBpQ0grcVljbm53MTZ1NXlqdE1JRW5ISkxCTmhwK3VZ?=
 =?utf-8?B?OFg5VjMvNXFvUkxBMks0Nkg2a2JqZlZzN053SnRBRTRSK1lFK3FsbjRnZlpD?=
 =?utf-8?B?cGw0T0lMaUtLc0ZIcTd1Sjl4ZXNUeXA2emowZURCaG5jcFB6aDFvSGFzcnM5?=
 =?utf-8?B?UThaTk81WDh3M2Z5ZmsvOHBtcS95TVFlU0IyMThtYmtTam9tU3FLUTJEK1lH?=
 =?utf-8?B?T0ZNZXd0d3kwZklNZWZQTXg0V1Jqem5DR3dhcXRLRGJMU0VTT0NUcmJMVlRQ?=
 =?utf-8?B?YnZMMG5NYTRjMW1BekVBN1Q5OXN0dnp5UCtUMzdsUHdLaHQrUzhzUjRMa2Zh?=
 =?utf-8?B?dVhZVFBQR3VITURiSlV4cG1UQzY1SnYzc2dWR3lGZktBWDZTaXVFb2pIazdI?=
 =?utf-8?B?b3Nwa2VYQ3dJNUhDQkp3WVVjNnQzRkxmM2luVGhWZmR0WnI3cWJkNG05UjJI?=
 =?utf-8?B?L0N5dXlpNkYrWUQySm5lSjF6a2g1U3ZMdEJGblphRVJmbDE1SS9rRTU4RTNa?=
 =?utf-8?B?bDllZ3JTekUvU3FXTTJ1SjhiQ0tmN0ZMQ0lvSUhHcXdrUm92ZmtGOElnemF0?=
 =?utf-8?B?bjlXWTUwVlBlUDlDL1JibklhaWxEMzRzRmo3L044aURHZlBpcllVKzlKTG9B?=
 =?utf-8?B?SzFLbXdVVE02Nm4zMHphdGxmNDdmOEt1RDRqQVNxQ0VreC8xVnEvdnp2VXhh?=
 =?utf-8?B?ZUViQ1NVeExJQ2ZYcXdKMmdoOXpzZTI5cmhVcTY2dWtQNU5rUXZRRkc1TU5m?=
 =?utf-8?B?SENIbDBJOVBIKytUM09obkt5cmc1NmNRWktydFpMREtiQmgyYlM5WVZ5dHdo?=
 =?utf-8?B?NWxrWVpvQW9GSDNVTk1CZ2F0MWVSZHRydStpVEMrVHZJOXFvR1kram5IdlBV?=
 =?utf-8?B?Q1YyRVJ5S3VMdDBnd1l0Y1YrR01ONGhMN2lHNlAzbFFqWmNDdGhtL0FveGlR?=
 =?utf-8?B?eCtVb3RmV0ppMG9hK2ZiTzZlVUdDell4ZGlnUFdqZjFQclE3QjhyU3hGWEdO?=
 =?utf-8?B?VExwWVdFaVRhQ0hkSU83a1Rnc2FUdnB2TE1qVjQ5bWRVV2c0ckxVQ3hZU0w0?=
 =?utf-8?B?UWlUQWhVakhaU3MrZFhDaERqejVjd2k5cmRIdHJWRko1WmxWRjllWVVKQ2NC?=
 =?utf-8?B?TW5HdFI2SklPZ0diRU8wdmZCTEc2cUE0dFZxSHQxVWdtcjlqdEZONitUdG51?=
 =?utf-8?B?dzI4SjVHaHp3VDh6SDdCcmhnT3hTSy9lL3ZDZ3N5S0kyTVdqTXRGMFlWMUE0?=
 =?utf-8?B?VXY0cWpuYVR3REc3T1lzTExBRjJRTmdmaW9kQXc2YkxnUXZjRU9zZz09?=
X-Exchange-RoutingPolicyChecked: skikV2I/cs7k7HwUcj3msVJowX+B5eez8tvrPibn6lXlq/oe+xBI0ZXF5MLT9DwnwCKaEVriBS/DbtD+2wMe8biwGjlilqqOjN8Q2JGBxZ47AyaO2YtwZ1X1d4TD2R078BOMSyZLKxl0DJteQFqnfpwa6h4zO80RVPPi9SkV4iGSvn+Tl+XesvQnvAbTHtOduiABFC1PaiMhOdZtBHqUbbIk9WjdxLnGPEtpYmd7O8j4/4jbkvKrI3ueiF9lGehq62+SP/ctcFsaNu72CXJy94KjLjYMCbnfCjP6arBZQ28lH3rwMI5DL/XIFgpyQhfb9+fCkTmI5Qr1zSriCpx8MQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c480ce-689d-4acc-6cbc-08de7e263a81
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 21:52:59.2096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1i9GLWiKk5FFRX25HLLyCdZiZMI0MR0o6Z3B89Re16b/TzrvW+9C1zbyyPYoxN/a2s24h856CNb5IE6NoZ687g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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



On 2026-03-07 7:26 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	Attempt to fixup reset, wedge, unload corner cases (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/162074/ <https:// 
> patchwork.freedesktop.org/series/162074/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162074v3/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162074v3/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-4674-
>   a48305e6a2e6a1ed90df374101dd29542c105d8f_FULL -> xe-pw-162074v3_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-162074v3_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-162074v3_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-162074v3_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-4/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-
>         race.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-2/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-
>         race.html
This test incomplete is not related to this patch

>
>   *
> 
>     igt@xe_wedged@wedged-at-any-timeout:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-1/
>         igt@xe_wedged@wedged-at-any-timeout.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162074v3/shard-
>         bmg-7/igt@xe_wedged@wedged-at-any-timeout.html>
> 
This dmesg-warn about "GT0: GuC mmio request 0x5507: no reply 0xffff" is 
not related to this patch

Regards,
Zhanjun Dong

> 
>     Known issues
> 
> Here are the changes found in xe-pw-162074v3_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-1/igt@kms_addfb_basic@invalid-
>         smem-bo-on-discrete.html> (Intel XE#3157 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3157>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-2/igt@kms_big_fb@4-
>         tiled-32bpp-rotate-90.html> (Intel XE#2327 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +4 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-7/igt@kms_big_fb@4-tiled-max-
>         hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658> /
>         Intel XE#7360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7360>)
>   *
> 
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-1/igt@kms_big_fb@linear-max-
>         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#7059 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7059> / Intel
>         XE#7085 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-7/igt@kms_big_fb@linear-max-
>         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#7059 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7059> / Intel
>         XE#7085 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-4/igt@kms_big_fb@y-tiled-max-
>         hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6
>         other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-32bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-2/igt@kms_bw@connected-linear-
>         tiling-2-displays-2560x1440p.html> (Intel XE#2191 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2191> / Intel
>         XE#7373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-10/igt@kms_bw@linear-tiling-2-
>         displays-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367> / Intel XE#7354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354>) +1
>         other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-2/igt@kms_ccs@bad-
>         rotation-90-4-tiled-dg2-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +9 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-2/igt@kms_ccs@bad-
>         rotation-90-4-tiled-dg2-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-2/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652>) +17
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-9/igt@kms_ccs@crc-primary-
>         suspend-y-tiled-ccs.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1 other test
>         skip
>   *
> 
>     igt@kms_chamelium_color@degamma:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-4/
>         igt@kms_chamelium_color@degamma.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306> / Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-5/
>         igt@kms_chamelium_color@degamma.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325> / Intel
>         XE#7358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7358>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-1/
>         igt@kms_chamelium_frames@hdmi-aspect-ratio.html> (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +5
>         other tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-6/
>         igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html> (Intel
>         XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-0:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-5/
>         igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-
>         plane-0.html> (Intel XE#7305 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7305>) +9 other tests fail
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-2/
>         igt@kms_content_protection@lic-type-1.html> (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-9/igt@kms_cursor_crc@cursor-
>         offscreen-128x42.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +3 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-6/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321> / Intel
>         XE#7355 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-2/igt@kms_cursor_crc@cursor-
>         rapid-movement-32x10.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-5/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html>
>         (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/309> / Intel XE#7343 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7343>) +1 other test skip
>   *
> 
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-3/igt@kms_dirtyfb@drrs-
>         dirtyfb-ioctl.html> (Intel XE#1508 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-10/igt@kms_dirtyfb@drrs-
>         dirtyfb-ioctl.html> (Intel XE#1508 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-4/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#2372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372> /
>         Intel XE#7359 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7359>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-4/
>         igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162074v3/
>         shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-
>         a3.html> (Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3321>) +1 other test fail
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-8/igt@kms_flip@2x-plain-
>         flip.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1421>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         downscaling.html> (Intel XE#7178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7178> / Intel
>         XE#7351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-3/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         upscaling.html> (Intel XE#7178 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7178> / Intel XE#7351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7351>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-4/
>         igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-
>         x.html> (Intel XE#7179 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/7179>) +1 other test skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-
>         x.html> (Intel XE#7179 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/7179>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-3/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#6312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6312> / Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-9/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) +17 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-10/
>         igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-
>         render.html> (Intel XE#7061 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7061> / Intel XE#7356 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +3 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-10/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +24 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +5 other tests skip
>   *
> 
>     igt@kms_hdmi_inject@inject-4k:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-6/
>         igt@kms_hdmi_inject@inject-4k.html> (Intel XE#1470 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1470>)
>   *
> 
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-9/igt@kms_joiner@switch-
>         modeset-ultra-joiner-big-joiner.html> (Intel XE#4090 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4090> / Intel
>         XE#7443 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-2/igt@kms_joiner@switch-
>         modeset-ultra-joiner-big-joiner.html> (Intel XE#7173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7173> / Intel
>         XE#7294 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294>)
>   *
> 
>     igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-9/igt@kms_plane@pixel-
>         format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html> (Intel
>         XE#7283 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7283>) +3 other tests skip
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-4/igt@kms_plane_lowres@tiling-
>         yf.html> (Intel XE#2393 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2393>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-yf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-8/igt@kms_plane_multiple@2x-
>         tiling-yf.html> (Intel XE#5021 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5021> / Intel XE#7377 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7377>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-3/igt@kms_plane_multiple@2x-
>         tiling-yf.html> (Intel XE#4596 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4596> / Intel XE#5854 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5854>)
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#2392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2392> / Intel XE#6927 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6927>)
>   *
> 
>     igt@kms_pm_rpm@dpms-lpsp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-9/igt@kms_pm_rpm@dpms-
>         lpsp.html> (Intel XE#1439 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1439> / Intel XE#3141 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3141> / Intel
>         XE#7383 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7383> / Intel XE#836 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/836>)
>   *
> 
>     igt@kms_pm_rpm@package-g7:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-6/igt@kms_pm_rpm@package-
>         g7.html> (Intel XE#6813 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6813>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-3/igt@kms_pm_rpm@package-
>         g7.html> (Intel XE#6814 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6814> / Intel XE#7428 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7428>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-update-continuous-sf.html> (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4608> / Intel XE#7304 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7304>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-
>     edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-update-continuous-sf@pipe-a-edp-1.html> (Intel
>         XE#4608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-
>     edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-update-continuous-sf@pipe-b-edp-1.html> (Intel
>         XE#4608 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4608> / Intel XE#7304 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7304>)
>   *
> 
>     igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-6/igt@kms_psr2_sf@pr-primary-
>         plane-update-sf-dmg-area.html> (Intel XE#2893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2893> / Intel
>         XE#7304 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-1/igt@kms_psr2_sf@psr2-
>         overlay-plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +5 other
>         tests skip
>   *
> 
>     igt@kms_psr@psr2-no-drrs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-2/igt@kms_psr@psr2-no-
>         drrs.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +10 other
>         tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-10/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (Intel
>         XE#2330 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2330> / Intel XE#5813 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5813>)
>   *
> 
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-6/igt@kms_setmode@invalid-
>         clone-exclusive-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_sharpness_filter@filter-formats:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-10/
>         igt@kms_sharpness_filter@filter-formats.html> (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +2
>         other tests skip
>   *
> 
>     igt@kms_vrr@lobf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-4/igt@kms_vrr@lobf.html>
>         (Intel XE#2168 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2168> / Intel XE#7444 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7444>)
>   *
> 
>     igt@kms_vrr@lobf@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-7/igt@kms_vrr@lobf@pipe-a-
>         edp-1.html> (Intel XE#6390 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/6390> / Intel XE#7461 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7461>) +1 other test
>         fail
>   *
> 
>     igt@xe_eudebug@basic-vm-access-parameters-faultable:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-4/igt@xe_eudebug@basic-vm-
>         access-parameters-faultable.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1 other test
>         skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-ufence:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-6/igt@xe_eudebug@basic-vm-
>         bind-ufence.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +5 other
>         tests skip
>   *
> 
>     igt@xe_eudebug_online@pagefault-read-stress:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-6/
>         igt@xe_eudebug_online@pagefault-read-stress.html> (Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>)
>   *
> 
>     igt@xe_eudebug_online@single-step:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-1/
>         igt@xe_eudebug_online@single-step.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837> / Intel
>         XE#6665 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6665>) +2 other tests skip
>   *
> 
>     igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-4/
>         igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-
>         vram.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4837> / Intel XE#6665 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6665>)
>   *
> 
>     igt@xe_eudebug_sriov@deny-sriov:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-4/igt@xe_eudebug_sriov@deny-
>         sriov.html> (Intel XE#5793 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5793> / Intel XE#7320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7320> / Intel
>         XE#7464 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-1/
>         igt@xe_evict@evict-beng-mixed-many-threads-small.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-162074v3/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-
>         threads-small.html> (Intel XE#6321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>   *
> 
>     igt@xe_evict@evict-small-multi-queue:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-7/igt@xe_evict@evict-small-
>         multi-queue.html> (Intel XE#7140 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7140>) +1 other test
>         skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-8/igt@xe_evict@evict-small-
>         multi-queue.html> (Intel XE#6540 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6540> / Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-1/igt@xe_exec_balancer@many-
>         virtual-userptr-invalidate-race.html> (Intel XE#7482 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7482>) +5 other
>         tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-basic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-2/igt@xe_exec_basic@multigpu-
>         once-basic.html> (Intel XE#1392 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_basic@multigpu-once-basic-defer-bind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-7/igt@xe_exec_basic@multigpu-
>         once-basic-defer-bind.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322> / Intel
>         XE#7372 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7372>) +7 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-5/igt@xe_exec_fault_mode@many-
>         execqueues-multi-queue-userptr-invalidate.html> (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-9/igt@xe_exec_fault_mode@many-
>         multi-queue-userptr-rebind-prefetch.html> (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +5
>         other tests skip
>   *
> 
>     igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-6/igt@xe_exec_multi_queue@few-
>         execs-preempt-mode-close-fd-smem.html> (Intel XE#6874 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +21 other
>         tests skip
>   *
> 
>     igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-2/
>         igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-
>         priority.html> (Intel XE#6874 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6874>) +6 other tests skip
>   *
> 
>     igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-3/igt@xe_exec_threads@threads-
>         multi-queue-cm-fd-userptr-rebind.html> (Intel XE#7138 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +5 other
>         tests skip
>   *
> 
>     igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-5/igt@xe_exec_threads@threads-
>         multi-queue-shared-vm-userptr-invalidate.html> (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +1
>         other test skip
>   *
> 
>     igt@xe_media_fill@media-fill:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-7/igt@xe_media_fill@media-
>         fill.html> (Intel XE#2459 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2459> / Intel XE#2596 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2596> / Intel
>         XE#7321 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7321> / Intel XE#7453 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7453>)
>   *
> 
>     igt@xe_mmap@pci-membarrier-bad-pagesize:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-3/igt@xe_mmap@pci-membarrier-
>         bad-pagesize.html> (Intel XE#5100 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5100> / Intel
>         XE#7322 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7322> / Intel XE#7408 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7408>)
>   *
> 
>     igt@xe_mmap@vram:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-5/igt@xe_mmap@vram.html>
>         (Intel XE#1416 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1416>)
>   *
> 
>     igt@xe_multigpu_svm@mgpu-migration-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-1/igt@xe_multigpu_svm@mgpu-
>         migration-basic.html> (Intel XE#6964 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +1 other test
>         skip
>   *
> 
>     igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-6/igt@xe_multigpu_svm@mgpu-
>         pagefault-prefetch.html> (Intel XE#6964 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-10/igt@xe_pat@pat-index-
>         xelpg.html> (Intel XE#2236 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2236>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-system:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-7/igt@xe_pm@d3cold-mmap-
>         system.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#7370 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-prefetch:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-1/igt@xe_pm@s3-vm-bind-
>         prefetch.html> (Intel XE#584 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/584> / Intel XE#7369 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7369>)
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-
>         exec-post-termination-irq.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733> / Intel
>         XE#7417 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417>)
>   *
> 
>     igt@xe_query@multigpu-query-pxp-status:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-bmg-3/igt@xe_query@multigpu-query-
>         pxp-status.html> (Intel XE#944 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_sriov_flr@flr-vfs-parallel:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-162074v3/shard-lnl-2/igt@xe_sriov_flr@flr-vfs-
>         parallel.html> (Intel XE#4273 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4273>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-
>     atomic@pipe-c-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-7/
>         igt@kms_async_flips@async-flip-with-page-flip-events-linear-
>         atomic@pipe-c-edp-1.html> (Intel XE#6054 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6054>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162074v3/shard-
>         lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-
>         linear-atomic@pipe-c-edp-1.html> +3 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-1/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html>
>         (Intel XE#7545 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7545>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-162074v3/shard-bmg-1/igt@kms_flip@flip-vs-expired-
>         vblank-interruptible@c-dp2.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-6/
>         igt@kms_flip@flip-vs-expired-vblank@c-edp1.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3149>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-162074v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-
>         vblank@c-edp1.html> +1 other test pass
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-9/
>         igt@kms_hdr@invalid-hdr.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162074v3/shard-
>         bmg-7/igt@kms_hdr@invalid-hdr.html>
>   *
> 
>     igt@kms_pm_dc@dc5-dpms:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-7/
>         igt@kms_pm_dc@dc5-dpms.html> (Intel XE#7340 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7340> / Intel
>         XE#7504 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7504>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-162074v3/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html>
>   *
> 
>     igt@kms_setmode@basic:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-9/
>         igt@kms_setmode@basic.html> (Intel XE#6361 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162074v3/shard-
>         bmg-1/igt@kms_setmode@basic.html> +3 other tests pass
>   *
> 
>     igt@kms_setmode@basic@pipe-b-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-1/
>         igt@kms_setmode@basic@pipe-b-edp-1.html> (Intel XE#6361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162074v3/
>         shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html> +2 other
>         tests pass
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-2/
>         igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html> (Intel
>         XE#2142 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2142>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-162074v3/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-
>         virtual@pipe-a-edp-1.html> +1 other test pass
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-1/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5466>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-162074v3/shard-lnl-6/igt@xe_fault_injection@probe-fail-
>         guc-xe_guc_ct_send_recv.html>
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-2/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5466> / Intel XE#6652 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6652>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-162074v3/shard-bmg-3/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-1/
>         igt@kms_hdr@brightness-with-hdr.html> (Intel XE#3374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3374> / Intel
>         XE#3544 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3544>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-162074v3/shard-bmg-2/igt@kms_hdr@brightness-with-
>         hdr.html> (Intel XE#3544 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3544>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-8/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2426> / Intel XE#5848 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5848>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-162074v3/shard-bmg-4/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2509> / Intel XE#7437 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7437>)
> 
> 
>     Build changes
> 
>   * IGT: IGT_8782 -> IGT_8783
>   * Linux: xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f -> xe-
>     pw-162074v3
> 
> IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8783: b5051dc2e867005c758c707312aa9cf9d1dc3291 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f: 
> a48305e6a2e6a1ed90df374101dd29542c105d8f
> xe-pw-162074v3: 162074v3
> 

