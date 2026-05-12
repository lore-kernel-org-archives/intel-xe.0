Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08354CD4851
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 05:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9796210E10F;
	Tue, 12 May 2026 05:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfuGKSct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B12510E10F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 05:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778563629; x=1810099629;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=+C3pNAKvAj4O8OwBaipajzdWUQOjJ/nBSW91AzENwRo=;
 b=UfuGKSctwfxzihL+NhBMe1RE5BxxqLQX7NcmUx43wFN0xk89+7eNQdxw
 FexD0PRewiocX5clHgJ1uwN5Wdgozpu4ZGwPQP+ybHAddN6BhTIjifLEA
 adpEV1Ynje82GsDSGZDP5PXVFii8zv+pBQBK9S0rihUZo476MX26GhiAg
 8EO3XgLfSdLyfD6XSNc2jHObcEh7u3sWuBbHrhw628xWL68vhYGCX5uc5
 GNas4he+aFjuvI86eYMiL36E7ik4GA3/28SOAYHJZmNF3moATvoLyjy0E
 oOrJkPjRWq0UgrFicsoJbu8DpOIARglqZT65XAMqUmwIR1RS37MET9EMc A==;
X-CSE-ConnectionGUID: jH9To4JTS46j0zHLFB259w==
X-CSE-MsgGUID: wM1KyE5kQRePQqQwaE09zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90929195"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="90929195"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 22:27:09 -0700
X-CSE-ConnectionGUID: AFfB4AewTOyr3V6MQMBKGA==
X-CSE-MsgGUID: /ylXIfkgTJa+tnKbWoupkw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 22:27:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 22:27:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 22:27:08 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 22:27:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELdwwb3DAJLehONGIEpQf4b/9NmkkyCBGOkVNu/t1DD4/zqFIEes6f12CPnKPqWqOkvIb+RTxrNYALRMyttpA7f4nL9r7391ewaNYaNpiAJl4y2aRROqQdI0O7Ho5kYUXPUKobhNVLiJP1xiQWqdzrrvAMngchsurxh+5adk5XAFtyipgv5UrEppdomPd8/Xi3eoIXh2gj4Oy+ckHFNGeRd0y5NSVAa5wcR4PPuKQJ8QfPIdSfILBh6mUTwNyNIhUKC5IXGPtrZv3Ya9eKg63kBxnguAVGPxYfT7PbTwv28OcoD6IiUOzx73mTInPniX2q0ARmnEeYmjWtIbEN691Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//2zdtGndUXGEeB2nqufrCvJiTFdai5EQRIVy2/tJ1o=;
 b=Wn+OwQA70xs1CKL+M5zi1a2YKEZ7PWveZq032Ziu0iu6HmKXSAgh/BNhFXlWgv2E7KBz6MqYC4R5/NjjmqkyiVkkVnbWorUpm4blMLulKX7aQGxf66M/JlOstUfq3hCKbg5maDBBHt7aGVgdvTRHAfiTtWjZvlJOZfZLiUscRDmYwEVPp+N3yS76DDwtHlzlR4WdEXgUlOqx+Ezl0mDbZDpvbaTMh95CyFmzsMp/90t9sHuvn2ifUsLeJGok9fO/12MtJU0tEs7LK7bolWHgPzrRWjoOgXjYIp9MknpMP1YDaSw8my/dUTk71xV6QCRJJzQWy/B6QMQDXDCjlflNwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 05:27:06 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9891.008; Tue, 12 May 2026
 05:27:06 +0000
Date: Tue, 12 May 2026 10:57:00 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re_fo?=
 =?utf-8?Q?r?= Refactor functions implementing the blt batch buffer (rev2)
Message-ID: <agK6JD-T5t41amFZ@bvivekan-mob1>
References: <20260511123746.616662-5-balasubramani.vivekanandan@intel.com>
 <177853137200.58917.1057195695448194023@5ab824fced77>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <177853137200.58917.1057195695448194023@5ab824fced77>
X-ClientProxiedBy: MA5PR01CA0246.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::13) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH8PR11MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: 3048e61f-ee98-4aad-2419-08deafe71b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lD9U75y9gYDqeAA9XqPXZi0gSN6Uh2G/NgZh3nE9JFSNJ1r/MxzVe+paS8k00TZAosCB7e0+f2+Nm4O9/xbQQjN3LPZs7an44eKhf/AqZPNu2+1gPHw5Qu29kYtEPs/3oso+2MvoqItCjwaBLMcnXz72+pAXi6ZpMCIbW2BkBG2ZPk4kUYq909LSskq9PbnuReljz64jtG+rm56gAtIGQfW9X3QDJuUXmEzHxvMY7Ot6oZZYVvLl84KZH4R+AjT2hHk4J2hchWbUv4dfj0X+WH92eoZtmc66vpZ/UkQB7Rzk7cN7+N+nQwhJCY9kmZ5SRGOCKCvPltveJTn1zUJ9hWPH3Rw9ihvwKRgjhpEp1D/qeDxnAMoiIQ99X1Rg/DbZgDs/chqsNrYl5dsdDCzrAIOy73tt3YAIHOmyzLdhVz/gzNbAXfjYIgqDwhi4mVDgmDtSeAFcdvFe8s5X4EUxr6+VA/yFBqFQhdxcODvvE/UErbi8XvwwVU7ryrwb3Gol+esdfs7J3OHAM+8uPQKIKcYKfqccpfhbY3LQD7NXVbOYGCzeW4semtKNTmybO7VwZC4KQ3xY/cSMnQTTqCOd2SKgYhI4t0sOD8AjlRTyDc3/lqTPPxLCXUz2j8TLlJ+wc6vuT7k8kB95gv+PiDNc9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDR3d0NGbnlkdHBMZ2FNbThvK0hVTkNiZnJaSHFXUzVKTTBDdU1pbDQ4Q0ll?=
 =?utf-8?B?WVo5bll3eVVhUGQ3ZjdMQmFIZkxJRzRJaFJkc3E3VHUxc2pwTHd6K05DRWsv?=
 =?utf-8?B?Q2VJbmZ6YWlLRG8vbGxtRW9VRTJXZGh6SVpibTZOSDZqQ0tORFNnMGtmdDBQ?=
 =?utf-8?B?MWlSWGRHRE1kekZ1bjhjc0FxcHVnRXdUbDR4UWhhSW9mL0ROd0UyR2tzTCtW?=
 =?utf-8?B?ZUdIZ0ZYbFlSR3B4UG9uVGhGSTlMWGdnREhobWYvNTY5ZHRyL29YTXNEN1Bk?=
 =?utf-8?B?UkdHZW04RHIvaTlXUGN5ZUFzZHpPU2pDTUh3Y3hCRTQ2TXYreXlZbTZNeE1G?=
 =?utf-8?B?RjNJdVhHc1RibFJQQkZXQmRYZXZ5RnI1K1R4ZURiU2dLaGtMZ3RPY3JBOWUy?=
 =?utf-8?B?cFBlZVFjZ25EdFRiRGlqNnZORUZNU0NSRTRmcldHRDBiTzZuWFFDSS9OMDU2?=
 =?utf-8?B?MCtYSXRudXk4M3ZLcnd2Q1ozN1B6V3lnMFhqSkd1N0I0TDEvUUVRMXFrelJi?=
 =?utf-8?B?N09HamdNOEg3WWVwNlc5WjJwd3FJaWJZcit3anFTbDBjRzdTWitZaVhRVnYz?=
 =?utf-8?B?MlFmRUM5RDdXd20yTjRpWUFiL01VUEl6RTBmaERubGZZMG1qc1FtbFo0eTFm?=
 =?utf-8?B?WUV0Znp0YXBaWlhsQmFEMkJ1aDFkZ3JxR2ZFNGxTUnpMT005YVpSZ3NYMEt0?=
 =?utf-8?B?UFdKdWhpeVRLeGRGcHV3SktRMER6L0lVOWlpc2FqUjlTRzRPSTF1VnRsODhX?=
 =?utf-8?B?Si95MGtaNVNvbjg3SDJZN0ljTDVDTVpnbUZzblNudjU5K01rbXF2TFVZTmRD?=
 =?utf-8?B?cTZLWG1iVUoxZDNKQTF1TVJxRnJ5MmgzK2V3T1ZQVHJNdlFkWGlnM1BRM3R3?=
 =?utf-8?B?WnhCNjRWcUkzeHpicDcxNk90WlFxN2lqcGFMSzI3NTlrbERWdWRpUDVMcklt?=
 =?utf-8?B?ZXJmUHZBL2N4MXUycFY2U2RQR3NZTWZCWWZSSjd5dGFVdzBXVHJGWW5XWndk?=
 =?utf-8?B?SlM0OGUxV25RWS9CaTQrWFBPbjFESitRNDVHYjRXTHJjdlNYazF1ZDVrUmJE?=
 =?utf-8?B?TkJaNWQvSGhGOHI1TUxGdE5selFybkRoQmI4SE9uYUhHYzlqU3FxclQweEc5?=
 =?utf-8?B?N1lxWmZXemN1QStCeGlxWWVSZGV3ZE9qTDNIUE44UHN5Z1pkRkpwZWpULzBU?=
 =?utf-8?B?RjcyazJzZjM0N2JLcDZadWVoSDVBcktTUDM0cVVKOTZPdXRyb01LbElwNW8v?=
 =?utf-8?B?QVk5Y21HMVNnYkZ5QWsybjNqYWQzT3hTeE5jVWZJelcwbEVxMWJudmJrT2VK?=
 =?utf-8?B?TjRqVGU5RVZMYm1ESG1EQ3VkNk41d0ozZVpXdHVhdDI5YmlPNG9VWWp5T1Za?=
 =?utf-8?B?TjdCWFl1ZFFGZnVyTnhUbE5jTVg1c1hvRVRSSmtKZDErSjZocFdMRHhjRjlo?=
 =?utf-8?B?NnRTQmgzTm9BY3c5SGZjdmVwamo2dnJ2eU5hSCtsYWNoVmxmaXlDRmJ0Qjdv?=
 =?utf-8?B?VVFId0gwS05Tb2FoU2wwQnptU21jdXUvL3I5bVRsNUIyQnNHZUpGenJyMlJC?=
 =?utf-8?B?cmhOWjBCeTNBWWkzR3J1SGVIeGhHNHlianM4cnpKeUR3ZzR3MEYyQUNXVFdx?=
 =?utf-8?B?QUJFMllLSDV1bXVmUnlDa09xQitXZkp5cFZFYXFQdkN5S3dwNnFrWFFtVmMr?=
 =?utf-8?B?OERGOU9XRFRjZ0NKUm83YTB1V091aTBQL2FtYzduTk5hVTUrWng4M05PSjA3?=
 =?utf-8?B?VTdxa2xsTW1rR1JPNVBEdCtUc3NHVnBmSGZ5MEJtMXJEdjI2TGRtR0ZoaDQx?=
 =?utf-8?B?KzUrUzlnNzVLOHdrSkZqQTVGQmFPN0k0T01NN0NscGg2UVJXSEpDRVk2RTZH?=
 =?utf-8?B?QnRsRVVWMU5mZXo0VkFIZldwTjEvMm1xU3BjSkJkV3g3TktNQnNSS2tOSDFq?=
 =?utf-8?B?VXJsZTB2NHpCZi81SDNJRkt4WS9LTjZqYWpTUFJaMjNQRHk2ZnYzbEtFUmdx?=
 =?utf-8?B?M1ZzRGMwQVRwTDlpNlh3eVk2Z2E4SXFLNjJLbTlvK3ZYYTVUdGJqeVRQMEov?=
 =?utf-8?B?S0paenlEQ0tib1QyQm9ycldyYnU4b3FpUERsdEdQQkdleUtLekdWS1YyRFE5?=
 =?utf-8?B?Q3dISTFDRlNKNjBjWjJ2aHQ4b2VnRjJ6WlZEeU02b29MOHpkUDhVdEhZQlE5?=
 =?utf-8?B?ZCsxMk9xcGFYU09rTHlmK2c2UElzWGpZRG94UDZqdlhIODIydzhBYTBQS0ZG?=
 =?utf-8?B?aUtDMWkzT0RuZFZoN0NWOHpTMmo4U0RiNW9RbHFBQzF2NXZ4THhxd1BLYmVE?=
 =?utf-8?B?aTVsV0JIYmpVOWdvc0pRYnUyd2hMTjd2MVlEUVJJNWQ3OFZlN1lGOVdYTWZD?=
 =?utf-8?Q?QBbueXKWf9twUksoEfY/1jHVlGQMyJ3B9ypoU?=
X-Exchange-RoutingPolicyChecked: Ogdlp+mZE6DY44AhlkbH3qYZxx8uqiQpkwL7h+pv7YGMhaLFgNIzGro/QfO/QWicZ0z1uLMIfK6d6Rv1wc13EwwSdITzZuwminz043NpHEaOp4sZOrFrkyStCsStksIrOUacWscfVupmnQjoUPnj3yO2WZwO3HpSBqmZ5W2HIOdWfP+uOR8F7A+Dmzo+p15C6gSzYE1Zs4ssY4mtgGKDkp6n/c2mmJgNxdXZmu6akL2zt0xDxIhYsCGXIgMrNiJjtjpiVsPIwEoEcdnHuXzzuWI/AwqKh9HUQDOo8wesgfja+Al7XFrwoetNE3JirASywlTQPiDgIyx24ueZ9LRPMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3048e61f-ee98-4aad-2419-08deafe71b11
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 05:27:06.3574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4xhUVvkYgQA5/0tOus8+Xv0x83Pu+lMgWr5YNtuGWEWPQNx2WKZUkgvf3Ayeza+2X7kbShGbpYX6vgmaZxxBHxbq5TVgOvUm70gBsZTu8yuEme/Ct7dBX+zMH/OAj/t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6682
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

On 11.05.2026 20:29, Patchwork wrote:
> == Series Details ==
> 
> Series: Refactor functions implementing the blt batch buffer (rev2)
> URL   : https://patchwork.freedesktop.org/series/166104/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565_FULL -> xe-pw-166104v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-166104v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-166104v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-166104v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_reset@long-spin-reuse-many-preempt:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@xe_exec_reset@long-spin-reuse-many-preempt.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166104v2/shard-bmg-4/igt@xe_exec_reset@long-spin-reuse-many-preempt.html
> 

Failure is not related to the patch. Same test is passing on rev1 - https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166104v1/shard-bmg-2/igt@xe_exec_reset@long-spin-reuse-many-preempt.html.
rev2 is a non-functional change. So it is a random failure and not from
the patch.

Regards,
Bala

