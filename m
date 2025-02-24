Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF66C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 20:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FEE10E038;
	Mon, 24 Feb 2025 20:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRANpHuA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E28010E038
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 20:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740430065; x=1771966065;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iKHh3vxBQuz+y53v39gb/s7trXDD88DHlJ5g85vZE+w=;
 b=eRANpHuAbUEcCxG3yNUSFafu6oBTN6dKEtRi6I59ZYXTJ5cWinMpGa7u
 4ygTtDhWrv3gkzylqgE4hx6cngVLOfgc51VJ7QsrWAs4hZxKQZJOJMfee
 NacO4yDgteEzTBT74UgtMhyvit9Xj4kx6PZJBdfKsmvAId457++y2T9E+
 YR6qLWsnuGl3VjSY5sLBTjZIyZSiND3jOavZacJerEQtV3UbblMwjGTki
 cL3s+ww0gX7xQpDkUydzxLrYoTodxelHqwUW3c6yeo7dEZ/uo+RVQBUsS
 v22COfTgvhrht3bQH6VeIuxqg2JBxypPaE1EU6O5anTVAPJKus8A77P46 A==;
X-CSE-ConnectionGUID: B7J9ZfDvQ0+hboetJ9KNDQ==
X-CSE-MsgGUID: zTZlA6O0Rqm2gTTBB3qQQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="66578371"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="66578371"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 12:47:38 -0800
X-CSE-ConnectionGUID: r4wEmclPS2msJ0RDVCq6ZA==
X-CSE-MsgGUID: Kf1XIllIQOS+TKMbfhYcxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="120785050"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 12:47:33 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 24 Feb 2025 12:47:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Feb 2025 12:47:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 12:47:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+syw56Gyb9iyleZ4mzvd7rIll3RuKCFl4RfbYU8VKv7cXalMy0AUPUj3z50vu6HSUeijXjn00xkveegSWdr5cPXj4fXgaIBSwyDb/pHvnkhh6IqpGaUreCcbdZuLiWddnxh8RALxXYo6B+GWTqMO916fuTc7b80xd44VwSP/uRKqSaiw/GHvAcGbgtz0ds4LFWgwP23IBzLDKJzbdd1lTT4ZMwoOd8J60EkvrZuBIKmlz7bYwAK1McjPR3O5TxbiYIWh6Pyqq3YumIq9yBQSwfTmYpK2kQq9Q5O9l5cIG9yEvCeFA2uzVqjwtsQRhUHOgTrYV3/8w9BWK5QSeTxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eziY0iEHvOU6zzJnoaBxLKIFNn48znh22Hpl1hzuEgM=;
 b=sj9lsRf0OIS521TGPMhUvRbdFn3UV/T6KkqXBUij/8Zl6xsp5Ksi6HaXOJwyH/0c4m7ryOBUmRVItXRqtAWijGPK8vI+8DcwOdUprU/GUZkrhL1AlRywIJGpqc6Ts8KuIhevbVDx158w5cubtROvrQWa/WEA+3D0vrZUF1i4ZL4jB3kNYg1gVdA07oi09dQrBS2d8o42HUQAFmZDgiR3BM+Ii/4DeeXxnEoUoCZr3TjQLQYreYXHaQBdzGPLGs+H4e+Ghucic3uD9OghaLIVg3eDO06AyT5slyUE9Vnlm5E4JazgxWcOtrSk3IaKm/feB6b4U+KETHCvNPaqMekCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4754.namprd11.prod.outlook.com (2603:10b6:5:2ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Mon, 24 Feb
 2025 20:47:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 20:47:24 +0000
Date: Mon, 24 Feb 2025 12:47:22 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/oa: Allow oa_exponent value of 0 (rev4)
Message-ID: <Z7za2kXHi4rd2CNF@orsosgc001>
References: <20250221213352.1712932-1-umesh.nerlige.ramappa@intel.com>
 <174022676882.744357.2803819277386187999@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174022676882.744357.2803819277386187999@b555e5b46a47>
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b0eb0f-ce7e-41e6-b048-08dd55147126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk5jTkNtUmtvUU5kK2JTdUdqZWMwVFhLYVBLVlRCVnJrMnRrM1IxdTU5RTNs?=
 =?utf-8?B?Q1A3OXQ5SmpNSFB0S3BDVk9PbTlHd0ZjcjB0MlA0QnhtSzIzR2pzcVRRNlVP?=
 =?utf-8?B?ZG9jWjNXQnBjU3lzaFc2dHBxUnczd3VLUjIraFFQY2xLNDhOOTAwMDBlWUNM?=
 =?utf-8?B?Q0FBK21YM0htL3V0V2dwbVlnbk10dFA1U1NVaHVRREVBVUVKRkdQOHhFckU3?=
 =?utf-8?B?OVZjT0RpSHFSc0IvWTlaZlRncTJQYkxORDlINndiUTY2RGVZNmZLNS9MVnY1?=
 =?utf-8?B?UXQ4WlNPRnBsTjN5MkZXSitPR3FiT3podVBsOTluNTBPTmkzeEpmemgwUHdK?=
 =?utf-8?B?bXRieWw0ODdWdlIvTTFSQ0NsWWFreG9mR05uZ1VRSXFQWXhPRlR4czJ2R3pj?=
 =?utf-8?B?QVBrcmQzVUQ3bHdLeENSZW9ZOHRvWFNVS0VsRUFkeUIrT29oaFcvVUM2QlJF?=
 =?utf-8?B?aHh1QnRDelBTd3ROWTN0WFdqYVdVZFFHOEQrblhqM2o2QVhHVCs1RzdaZUVt?=
 =?utf-8?B?RkZjR3BaYkhqK0hld0tuV2d5MWV5ZXJtRE0wLzhtQldQbkJVajFsOHNWWWZj?=
 =?utf-8?B?elU2MmVHNnR2YWpWSkpXS0NLQWZ2bG9XN3NxNFF5V3NCQ3BIWWRob2lZSTJT?=
 =?utf-8?B?OGpHTUpCaWJmemtGcm9DLzJTOHdmd0M5eXkxT01BTkhsRVZnYzlnbzF2S2dp?=
 =?utf-8?B?S2VxcTJTNlF3SS8wSTJSellINjRQWitIVHBqaFBWcGtSbE9KbFYxVElEVDVi?=
 =?utf-8?B?UnAxUDlScGxxdVFDWU5PWmhRbFlkSlcweVFySk5TMXFMYWZEL3R3R2VIOGhi?=
 =?utf-8?B?MEhLVWpGV3pObnJ2ZHFHOWtCQjlsaG91bVc5SmtFbVlONjk2dzBONDBLVnds?=
 =?utf-8?B?cnhROFk2UmlubG1vM3NwMHE4NTRuVnVSb3J0M0V5NXpSZXBxdFNoZzJXME14?=
 =?utf-8?B?OHo0eGZCOEVlZUhkWnVDZTlBRitMR1kxdDFiWm5teTQzMDk4TDU1T3lYeTRz?=
 =?utf-8?B?N0N0enpaVFVvUEIzUjBpakhGUlB0cEdvci9lbTl1NzYxYWJHTkg0eWVvS2p3?=
 =?utf-8?B?Y0MvT1IxRExmMGNZQzJRdlg5eWRPK2I4NEQyM0plWVZiWmMzTFJHTW90ZU9Z?=
 =?utf-8?B?NkdHYVhtWDBRWXcyeiszUnRJVTZHVk1hNmRubEFIbTBBMFZqZFBqTmVTQzdn?=
 =?utf-8?B?cmRMVzAwRElDYnoyUlM0NGJHQjdCOXJSS1ZEbG1LUlJHRkM4V1ZrbFl0emhj?=
 =?utf-8?B?TklyN1Y2bDdXSUpEOUJWalJ5MHJMbk1MMy83cGw1c3ZJdGJva1dIcVRiWFNK?=
 =?utf-8?B?d2NSRXM3TXBGbjdWRUZyOGliUVlSZnd6K2xRVDRIZkE0UjhHS3VqYlNaSnBv?=
 =?utf-8?B?UExTSURBcW84a293NUN3b2VkQyswcTZNTENWbGpCSTRHMUg4b2VUMjZPSjlV?=
 =?utf-8?B?bXBUc3hZVG1sQnU1aDJXSDJGTEZvMXE4bzJFOEhhZVhiYnc3bURZSm1VeVRl?=
 =?utf-8?B?S2tweWtWSGxuTlhOSlEyNXNIMlI5ZUE1QjdkK3lndW5Oei9rZ0lDbncvRXhW?=
 =?utf-8?B?Si9rVno0YnJnLzFKNDNPZjIvKzk3L1ZqUXV6OXd4R0VFQzVmOGJNb1JXM3V6?=
 =?utf-8?B?RDMycDdMdTBVS3phRGt6WjBwaGRLUG42aW05NFJHaFlzbjJXUEJrMTVEcVRW?=
 =?utf-8?B?Y2tVS0pGU2lQZWR5QjU1aC9aNUhiSjlQZFZoKzJSNDhwMUZNT3AyaHQ0QTJF?=
 =?utf-8?Q?ezcpA9SRVSUCUT5T6qidZCtnrlBs4fwzCbu+bPr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUlQVkRmc29aSG5UWlpLUzVIdld1RjRNNzJMZ2NwYTVWd01WUERhK05kTzh2?=
 =?utf-8?B?dk4wbEljMzFiN3lvdHV2Z0xBNnc4MmEweVBiMVZWUWFxZ2VtSUQ2ZkFWK3hT?=
 =?utf-8?B?Mmp1T1VSTUFVaFluNG12OHV3UXFUdURjSG1qSGcvdFg3ajM1TFE0eUpHUi9Q?=
 =?utf-8?B?U0VwWTdXcWFRQUtsc3hUUEhMQ09Bcy96UnRra3B0VVo0Qm4vOUtkWVRVVWZx?=
 =?utf-8?B?dUc3andmT05aWHRPSndhaHd5SHJWWGwwQ0tGK1lWeHN6T21zY3R4a2kzU0J1?=
 =?utf-8?B?U0pRVVBzRkNSVzRjREZtcE93Y1ZoKytyZFNXYTJ0ZXA2UnFJWnZ0aTUzb0ZU?=
 =?utf-8?B?cEZNQkdsemlESjc3NE95S2lINENtK29YaGozY0U3OU13TExPTjlEV29vMVd5?=
 =?utf-8?B?Nll3T01ZaytvWVBqbUlKb3phbkxBMlVrZUF5MGdtYUZ5L0R0V0xmeC94VGV3?=
 =?utf-8?B?SUl6ZnVBVUlmSkpxWXFyOWlienF0cWQ3eFBKbTBwQVNvaGVOdTBUZ1J6SjhT?=
 =?utf-8?B?TzVHcC9qVGtaOWpGUy9YMWEwNC9JdTVIaGJlU3dnS0VIbnBMdHlTWkFEZUk2?=
 =?utf-8?B?TlZzK2NFb3RycWY1L1ppazcrN1U4eTM5aU44Ry9KL0ZVcW5DanRJa2VsT2Uw?=
 =?utf-8?B?R1J4dGVWaVBKQS9uRE4xbXhIUHRTZ0QzKzBCbjlIM2lwOE00Z01oZW9CUzM3?=
 =?utf-8?B?V2xna1kwcG9CQU9vYmRrUmxWUW1NZStXZXRmN29PRGVER0hScXUvZzByVWNB?=
 =?utf-8?B?Vy9lS2FnVTY1aHhiNy9zNTlabytUNWorRkN4L2lNS0ZXbFpveDRvTjVadEpF?=
 =?utf-8?B?Y3ZZeXlPcm1CZDRlT0tlalEzbG1PS0hkcnFaSzhpNE1RQXM3WUlVQXJ4WitV?=
 =?utf-8?B?b2J6a2RvcXVHYWVPOVZaMFVhOFdIQjdFdW5NQlFuc2R6OWtoKzRHVURyTXVV?=
 =?utf-8?B?L2o1TEJEVkh6TDlzOGpEZU1mcWVUV05GSzhnT3NQODlZZ3kyUlc2Zy9LbW5Z?=
 =?utf-8?B?VWRjeTVuOHlDMGNXVGNZYWFwRG5oMWQ0c2dBdjBUN0VMOThzQko4R29uMys5?=
 =?utf-8?B?VFkxaVRtVWRlR2FoejZGR240eWR0K2I3cHhMTGFza3E5YmNFa2xiaFVaNEh4?=
 =?utf-8?B?RnByK2hmdHNHTDVKQllCNW8rYnR0V0E5dmlCeDk1VlMzbFpCQ25RT1FMQUUz?=
 =?utf-8?B?aXAyZEJFd2h0Z3ZSaEFiN294ekF5c0ZoanpxVjV5c0hkQlpqN1pBK1VjZ2Ji?=
 =?utf-8?B?MXhEYXBsZU1PNGZVdUx1SUlsTTdvcVZFYlE0MkNPdXpaNGxKMEdhT0ZZK3BV?=
 =?utf-8?B?d3BpYmtpenpRcGg5NC90SEYrY1FXTkJ2R0dFNHdkb1R2RDAwNGJjeFpJaXR2?=
 =?utf-8?B?MFRxQjJnaXVWOENzaEU2Q3pmK09nSkwxSFEwaGFGcGJiUFUxNmNlWjI1UWFH?=
 =?utf-8?B?WHpnU2pFS09YRXY0VkJFR0lSeTZvWnlPVnZqcVRuTHVGRlZIbmNTV3Fiell6?=
 =?utf-8?B?RHFqSVpQaVp1aEs0RC9hZzdNTVAxeVZaVlpOL1c0cDFuZVRCSmRDYklKQXNN?=
 =?utf-8?B?YTBNSmg2WFg3T282VmE1Y2V2ekphRUhKNWVIL1ExN0h5ajRGcklRN09xWXda?=
 =?utf-8?B?R2U0S0tHelZPTjdUK016NVVmSS8rdy9CK05ZMWJuQlBqRmpXQjltRFhsMlpC?=
 =?utf-8?B?VSt0UUdTRDlRYm9jTTJNOFVXUk13ekxEQTN6QzFyOEVuUkRaOXo2ZGc3UkJY?=
 =?utf-8?B?VjZTWHJUL2lLYmRCdmpFOTc2dXhrVE1jeUk4OVFTSURoeGtFeXFJd3BVZ2Ro?=
 =?utf-8?B?QmtLVWw3ZVRnOFlKYkpJckxKRElPbmkrMFRtZ3NQOHZ6dS9vS3VRb0tHcWV5?=
 =?utf-8?B?VldUQnloN2JUSVphR0h5eHpaRXh5WFZzOTVJTUlBbW8xejFUMXdoL3BkNWY4?=
 =?utf-8?B?Q21HTE1nbnY2YXVuYnluRHozM0FiUE9UWnQrcE91SjlkeHdMZTI3ZWxlQ0ht?=
 =?utf-8?B?OGo3Zk5hN1R2L20yc3dLanR2K2dnOVIxRW83cTl5YW1maXhOSWhkMnN0Vlht?=
 =?utf-8?B?TGQ2RGVjODVKalo1Nmh1SEYyWDViWGE3WXVqTEdrd1NYUy9ld0l3bXpFNTRP?=
 =?utf-8?B?dmpQM2R0T21ROGZHeDdtV0gxZGJodUhmMzhCbmFmTlV1Z29wZGNFbk5GN0dq?=
 =?utf-8?Q?W04oDnmDpNK3/CUPxLaouAk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b0eb0f-ce7e-41e6-b048-08dd55147126
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 20:47:24.3779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqEr1Tyv0/lgcNVrAr8dBox5xnMv7NszM0XhC9LijQwT9J+tHq0erDRkAVVVXqF0U69NLJF1tg3eZz6sU/LZhBBuv0lO/d8Mho/IZRMPtHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4754
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

On Sat, Feb 22, 2025 at 12:19:28PM +0000, Patchwork wrote:
>   Patch Details
>
> Series:  drm/xe/oa: Allow oa_exponent value of 0 (rev4)
> URL:     [1]https://patchwork.freedesktop.org/series/144685/
> State:   failure
> Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144685v4/index.html
>
>CI Bug Log - changes from xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88_full
>                             -> xe-pw-144685v4_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with xe-pw-144685v4_full absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-144685v4_full, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (4 -> 4)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   xe-pw-144685v4_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_sequence@queue-idle@pipe-b-dp-4:
>
>          * shard-dg2-set2: [3]PASS -> [4]INCOMPLETE +2 other tests
>            incomplete
>
>     * igt@kms_universal_plane@cursor-fb-leak:
>
>          * shard-adlp: [5]PASS -> [6]DMESG-WARN +3 other tests dmesg-warn
>
>     * igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_decode:
>
>          * shard-dg2-set2: [7]PASS -> [8]DMESG-WARN
>
>    Warnings
>
>     * igt@kms_vblank@query-busy:
>
>          * shard-dg2-set2: [9]DMESG-WARN ([10]Intel XE#4330) ->
>            [11]INCOMPLETE

These failures are unrelated to this patch.

Umesh

>
>New tests
...
>
>Known issues
>
...
