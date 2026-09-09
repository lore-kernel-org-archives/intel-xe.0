Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07875C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 05:20:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCF310EEB5;
	Wed,  9 Sep 2026 05:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGQpEtly";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ABB10EEB5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 05:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788931245; x=1820467245;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3NWIWGLVY7lq9zCu2i0lxkrCacXCetmf/iSiBfL/ev0=;
 b=BGQpEtlyl3dqXMw60p+KHW+zXAG+B6LrQ0Vf9jP76QV0XI2Z5dr5b2aD
 KUKzuzt83RyXBiHl/HUGjIaNThbgOCJEvcaCjh24mwu+3PfFNXjD9ziGK
 LNQ6LvMUWRETY7uOMMwLyAq3CmIpxhUBow2ikce7sCV6/luYSzjIhmZUc
 DSoIqm3WvcFe4NPVNSaAcHzbuMx0Q6R+XbVUFp7cO2dgnkR/XWaodiXHo
 WQr3ada9mqG4GnhPmt7uck8Meuqdlol+VZJHeYwRj3QBl6EyYLb/i0jgq
 aN83YcfoOxihtmWRILIgmhxm6O67gTB53NycSNpD1XfpZypiaY0o99aye w==;
X-CSE-ConnectionGUID: 5PxGUISCQD+yylQbl0w0zA==
X-CSE-MsgGUID: 9h1Gl8bYRViR5zRLKMFI3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89363939"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89363939"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 22:20:44 -0700
X-CSE-ConnectionGUID: otYZFtrAS26fw49AyKAROw==
X-CSE-MsgGUID: hFh0/IohQC2ECxCELfXI8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="301089205"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 22:20:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 22:20:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 22:20:43 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 22:20:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQiCE7xKAO5bgwl9o7hM48xF7yPzZHCj4MsgWl9/yrqIRiDbpj/EHA3QaPTBlPFvQxWdXpN76j6dIuq0br/xg0N2X41NsFIoyf5RUYhxrS+4ztV+EcIGUDnM4VAqcggDOPJ5nJ7UeYt1ayi+1pxusYaKEzHc6to9F7RB3ycqdSs2viI75riQY10+Iq/f6cVGF0i+lv0OIc5mQCw+y6J4c2mhDktjnnxUDGftgTKol15UCkjfYybaAZVmAhKofkn55CvQnztfwGLlib9xfbVyAaMcdqRkZ2Gl9+cbe3TBUgCsyRUCPMB3h6+xZu7miDIaV6TqkaKmKNsyve2zQJGuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7A6+05/yCq5uV3tXerLm8a5g7Wc0WNDBhccpcB6KC4=;
 b=eDJ3Wuw17XGDkVlS/x+UmokoFwKb4xirkA4dEXxLGy2lNi1MgosIJXejYSxzvNAvrpNKTjbwAuWi+RSPL4BWOC7DnpMXzppHkEldlDkvL5zRfLcMiR3ZjkauzSab3G2aaJfIoX5umDDxDCA8p+RGlBmnctYtriI+8eqVDBzHEF4VToGOGiZaYl17oTOGhf6hddAgAozKOVtZeUwQkCJpwrPfOnxRVf64IQeCINojLx5z7AGfJ/9FWijNfc8FBWdy5sSMaLPt06yNfUCiyL3GtbI1wMQ/C1fXWfv/ivXsHvBfCBKe0KBAOFjhJsVd9NEIbcdKGWMtLhChW4dXQwaLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB9636.namprd11.prod.outlook.com (2603:10b6:806:4dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 05:20:40 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 05:20:40 +0000
Message-ID: <3929e62a-380a-4f6c-89b0-b7fc57116767@intel.com>
Date: Wed, 9 Sep 2026 10:50:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
 <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
 <3ae4858b-0bbb-4052-9c73-726643cf7266@intel.com>
 <292aaec1-662d-466a-83a6-dc820dace637@intel.com>
 <87216310-a723-43ce-ae62-6b85d2525bbd@intel.com>
 <e37b716d-3fcf-44b0-993c-70b39fe59951@intel.com>
 <d76a1ee0-7317-4cf5-b521-46cb9998fa88@intel.com>
 <f3d29b84-0849-4513-9a55-f6861e92c076@intel.com>
 <9d6388b0-ed43-4210-abee-62c6ae3ed2a5@intel.com>
 <bd507d1e-5d61-4d73-858f-1f44f37431c6@intel.com>
 <9c0f9a83-436d-4a1a-8192-ef3d4ae34e1f@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <9c0f9a83-436d-4a1a-8192-ef3d4ae34e1f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0152.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8409b7-e8d8-4b7a-bbf7-08df0e32169a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|56012099006|11063799006|3023799007|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sNeLTTAnXZE4Z3WipP/0lUW/LyQepUXitPGDqIOE78cC8J5rBVIoZ5NjfNRCtQC73cpfkvhmZSY5Z9zWXy1UyNr7P27NYClX+/vL5amaCST6T5SVAVSRtJ81YpgfGRg031tvfJlHW7L/CscACwigl7YDueLSxZ0QSmbtKFSVNnETHxTwXNK0O6tLh/cq5v5xrMtK6BKsE5bLW2DP2qAL0Jg/r3lYL3uU3X/tukEir56c7TzZs/nQl85kTEPE01shZO6RyuzlPHXa+NQHbRpu4efBwDQ4e8B+UopE1gl9trGlyj8yww3b5B7ww+zzeOsJYGt17oZf8zPf8hW4OO3t5ixKBLvVj+pyq6G/h3KI9zY5EJW0VZ7hZfj05FtQwD16RDyZEacMLejBhIscs9wZ/V4sm0WXKM22czLTnZSTM99OYyPG8GM14ZoHppbOiPnnBGEfOO9ROMytU5w/bYvbbuzFaQkJHDBgO+7gPHY0ZV4oc7ZrnnN3VUXh55eWKO1w1Gj5+zNz/XrOcWLp+cT+ieoks7qO/hlhRusfNqS1dBoZFqS5SttNThw7sm9TTOm+3rUhBpC+JfuxheUsby6eqMWqeQt2VIZb8Alo+K0kN/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(3023799007)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3RqOStDSE1IektVNnNDL2NaSmpkbzlLbEF2dDZFZVRhdFM5T0JKR0Y2eHlI?=
 =?utf-8?B?UVU2QnU0bEtaR1NyVWJ6bzJnLzRZSllLY2FLQStjL000ck8xN1lINW4yZEE2?=
 =?utf-8?B?RTRvQmJjd3hJWTFkZTZmZUdBVW1GaUIvNC9YVU5yYVFEQmFjNER1NDVGNURJ?=
 =?utf-8?B?azA0TU0vYzY4OGpUaTgyVzZsV2QzdTBvRmRzY3djczRUU21tZUt3cTk3MXk2?=
 =?utf-8?B?L2ZtcjFPK0dkRE5uUGhyd09zK2c0MGJQaDZBSW91TnFUVTBibUVpVzZPMHU1?=
 =?utf-8?B?allyTjhkOFliczIzdnZyQmMrVll3OXdDN080emZoZWlRVWpWREliNXpUMjdO?=
 =?utf-8?B?QmZ1eVBLQmtnLzRwckhzN2lacjZsczExYWhWc3k0eGtJOXg4R00xNXZKdEUv?=
 =?utf-8?B?VHdnQ2JWZjRDaGNsRUZRWm5uL2hRL3dla2luazR3dEpWbFpDTnNSVUF2OHZv?=
 =?utf-8?B?d01uYXdpQnBacFlvSTYxbFFodTJkN1FQcXpTVDZOWmdUa3l6dWU1ZHJIY3Fr?=
 =?utf-8?B?ZjN1Zk5WdnBWWUtpNmdYLzMzRXdWY2xmUUhrMWcrdEJFaHQ2MUdjUUVPU280?=
 =?utf-8?B?ZDRuRjdoc2VnelBPOUxiTWlHWFdvMlovVEhnZ1A4M0xmU3h3Z0RNaGhzUDhO?=
 =?utf-8?B?d3l1aXg0QWxJU3kvRHg0aTVxMi9nUk9DK0lmNTRDTmlPZ2srYUtBdzRhMU42?=
 =?utf-8?B?WjYvbEFiYnlZQ1F2SG8vTE1nMHpOTGE5REtXK1JsbisraDV6Ujl0dWhBU1hu?=
 =?utf-8?B?ZFYzVXBiUnQvbDVvdUZjYmhRakV1TXpXU1lzTGg0RStmeVZEM0sxbkNtMGZY?=
 =?utf-8?B?STY0WERsUjg4a01VdVVKR0ZnMzNZb1hIcGh0Nmh4SFpOZW5KSlpndDcvZzZz?=
 =?utf-8?B?cTBwcnlnWkdRWkpmYWJBOStKcjNqRHZYWlcvK2lRQ1RyN0FKVjRNWUpZa1Ra?=
 =?utf-8?B?OS9qcXVEK0xWUUlBTlAxRHFGMWJsVUNpVHVqN2VieXl5QUcyMkwvd2grSW1l?=
 =?utf-8?B?SFRDSTQ1dkJ6T2REdkdLeU5KRmdnVitTWFhJYVIyR0RIRk16aTdhNFE1SzEx?=
 =?utf-8?B?WWhaUTFMMkNoUVRYdGdMRzF5LzBqck1lQXZ3dG5QV05KRXdxSDE3Tis1YnJu?=
 =?utf-8?B?d2RVTS8yYklrSE5IMm5xZEUvTnphTURjMS9pb1MweXJPTGtOcjNTdGxiN2RU?=
 =?utf-8?B?aXIwKzI4OU4xcEpSZHVvM1lEaUZOWVJNYWpJT2dOMklmdkYrVzAxRm82MlJV?=
 =?utf-8?B?dC9BUzhUdm1IZm5ITzVMOVJUb1pRc3BFNi8zUkcxampYMXJDLy9kZE1zRkJI?=
 =?utf-8?B?RFdhdE1CTWp5RWRXUEhNYk4wb2E3UEU2ajRKR1NOd0d2VWliQ0MwQUgySlhJ?=
 =?utf-8?B?YllSN0lhbkxPbnZKZWIyS1l2SVlLQ1hSRE9xa1dZOEZyZklXMWtpUm1ZYTZx?=
 =?utf-8?B?YjdQa1RLdkhTZmE4cXFwUVZuV3A5V3dSVUo5WmpEeU5pclBveHNTRGV4aWR3?=
 =?utf-8?B?M0tZNmo2UlBZN0kyOXM3V0V6UDA1UXJic3B1ZXVWc0grc2RTVVExaUM0THN2?=
 =?utf-8?B?OVV4K2FyQ1hkOFB5UURWZldjZGpkelhMK1FsQzlTSUp2ZUVwSHN0R253RFpo?=
 =?utf-8?B?REN0VFU2OXJUMUxXUStzWjdEVUhZY0hManZlSEFoT3NNUFN3WXFzZnNKeXUv?=
 =?utf-8?B?SkQzZHBCM1Z0dWdNUWt6ZEhsNnBVZUNvLzg0Y0R4WGo3VUJXamJFYXNqdTh3?=
 =?utf-8?B?MHlPR3dMWDVHVzJzemIzNlk1MWhscVdoZ3Mxb3o4Yzd2MFB4Y1NQNmE3azNK?=
 =?utf-8?B?cjNiTTFJd1k2eUZla0prVUhRNnlNc3dzZTZBbm1hL2M4bGJqU252OHVKcm5U?=
 =?utf-8?B?TDUxT25aL3NGcllsdHVMSzE3NC9yZWxlbzVBV1JZK25ydFVqb0VmUHJmamtW?=
 =?utf-8?B?V29MZEE1S1E4NkJYN0lPNE1mMHl6aWNwU05veVc5VVpqeXhqa2oyMFpGQ2Vh?=
 =?utf-8?B?QkVTbml3Yk02VmRQQWpoZmg4VlV5OHAvcTBhdHJNMTdhVTEwVnozNnFmU2JX?=
 =?utf-8?B?NGE5c2oreXg2R3pUZllhTi9YejIzN2NsbzFUUG9QRjIxeFhFREd2VG1Gb1lz?=
 =?utf-8?B?V2xqWHpzUlVzc3hWb1UzUzJzL0FkMVhncGczOXAyU1JuY0VENU9CbUR1T3Bs?=
 =?utf-8?B?aTF5N2RjaFVTUmlvWmUxUkcwNzhJY085T3hGNCtCLytiV2kvN05rM0d2M1ow?=
 =?utf-8?B?aS9mSGkyTUVKN2JBWDFaSHF5UnBSVi9YYlQrMHVEUVVvMGxYd0RwL3FJUkd1?=
 =?utf-8?B?RjI1blVGNThtOUJlazlNbzIrZzJSSVNFeGYrRGJoa0RmREhEOGUwdz09?=
X-Exchange-RoutingPolicyChecked: OjpVb04gZxoFgoP3HEsbxZLHQriT/EHFpMxX6e64xbmK9oQDMRR5NgwWs9uukB6TAmL6iMwaHn8fqhP/wEsY4qTbPMVQ7t7ossTuLfwGoU6iKqaTWKnJyYnus0CW9UQ6DFHIWolemYCoUOyIFC0aKC3KDAEK2si4HgYyLTMaVcnaWd+f/LDThWXBZkCFD+mmqBvF68IwCAy/yupn3UK1qNnO2pCtVmgqVkW6Ec5fHs0u1NgGgbrJyRiXkDzkRftNvxZGqI4yE6lVpSVDzZ2+7bHubb7ObExvUTRO2+Oj35uUxA3BBP862zgqeBuOhcdgLPn8vJLhsDRrlzdkLcKnxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8409b7-e8d8-4b7a-bbf7-08df0e32169a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 05:20:40.4458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGAaq8ywougnrYGWd/haC/kIfNwwTnO/hXLMSwrjbav68vZyYAjEwFAInhEOjWnLWWCwsnnBHYvUiuD1yKd9cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9636
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


On 07-09-2026 19:54, Michal Wajdeczko wrote:
>
> On 9/7/2026 3:52 PM, Tauro, Riana wrote:
>> On 04-09-2026 17:27, Michal Wajdeczko wrote:
>>> On 9/4/2026 1:11 PM, Tauro, Riana wrote:
>>>> On 04-09-2026 15:48, Mallesh, Koujalagi wrote:
>>>>> On 04-09-2026 02:36 pm, Tauro, Riana wrote:
>>>>>> On 04-09-2026 13:55, Mallesh, Koujalagi wrote:
>>>>>>> On 25-08-2026 01:05 pm, Tauro, Riana wrote:
>>>>>>>> On 24-08-2026 16:34, Michal Wajdeczko wrote:
>>>>>>>>> On 8/24/2026 7:44 AM, Tauro, Riana wrote:
>>>>>>>>>> Hi Mallesh/Michal
>>>>>>>>>>
>>>>>>>>>> On 20-08-2026 15:46, Mallesh Koujalagi wrote:
>>>>>>>>>>> Make sysctrl_wait_bit_clear() return an error code rather than a bool.
>>>>>>>>>>> and update callers to use xe_log_err() with the propagated error code.
>>>>>>>>>> Bit confused here on the usage of SIGID. My assumption based on documentation and discussion was
>>>>>>>>>> that SIG ID is only needed for error logs based on severity and requires a resolution which can be documented.
>>>>>>>>>> Am i missing something?
>>>>>>>>> from "How to pick a SIGID (the uniqueness rule)"
>>>>>>>>>
>>>>>>>>>     * A single underlying failure therefore legitimately produces a
>>>>>>>>>     * *chain* of reports from different layers, each with its own SIGID -- e.g. a
>>>>>>>>>     * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
>>>>>>>>>     * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
>>>>>>>>>     * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
>>>>>>>>>     * follow a fault from origin to final effect; it is not a duplicate.
>>>>>>>>>
>>>>>>>>> so in this case, some sysctrl timeout may eventually lead to a reset and/or
>>>>>>>>> wedge and/or runtime-survivability-mode, and this intermediate FW SIGID may
>>>>>>>>> help in any postmortem triage, and if we don't reach that final state then
>>>>>>>>> we can still provide some generic resolution based on site and errno (COLLECT)
>>>>>>>> What if the paths are also used in non-critical scenarios for ex: sysctrl commands are used for
>>>>>>>> general counter telemetry, gpu health querying and firmware status.
>>>>>>>> Wouldn't this be lead to a lot of sigids in dmesg in case of some unrelated failure ..
>>>>>>>> Why not only add sigid for critical paths when we are sure it will cause a chain of failure
>>>>>>>> instead of these prints on every trivial command failure.
>>>>>>> Ops I miss this.
>>>>>>>
>>>>>>> I agree that we should not add SIGID for every minor or noisy failure. The intent is not to log every non-critical cases,
>>>>>>>
>>>>>>> but to capture important intermediate failures that can help explain the real root cause. If we log only the final critical
>>>>>>>
>>>>>>> failure, we may miss the earlier cases that actually caused the issue. That makes triage and postmortem harder, since
>>>>>>>
>>>>>>> we lose visibility into how the failure occurred. The idea is to use SIGID only for meaningful failure in key execution paths.
>>>>>>>
>>>>>>> Even when these failure are not fatal, they can provide valuable context, make debugging easier and reduce
>>>>>>>
>>>>>>> mean-time-to triage (MTTT).
>>>>>> Suppose a user uses invalid entries for gpu health or counter management, won't we be polluting the dmesg
>>>>>> logs with sig id and cper logs unnecessarily since these are not fatal.
>>>>> No, we should not emit SIGID/CPER for bad user input  or invalid query parameters in gpu health/counter management path.
>>>> But the system controller interface is same for all where you have added sig id logs. A failure in sysctrl_send_cmd or receive/send frames will be
>>>> displayed in general non fatal cases too. And it could be due to invalid request.
>>>>
>>>> This is not a call chain that leads to a critical failure always. Need conclusion on this because one of my patch has a similar condition.
>>> we can discuss what to do in case of explicit error (failure) codes returned by the FW on specific commands, as it looks that unlike the GuC, such errors/failures could be caused by the invalid data provided by the user.
>>>
>>> but IMO if the FW sends corrupted frames, which I assume is a part of the low-level FW communication channel, or we can't send some random command to FW - isn't that a good indication that there is a problem with the FW communication that should be reported?
>> In that case, shouldn't sigid be applicable to guc, huc, i2c and all low level failures.
> it is applicable, see pending series [1]
>
> [1] https://patchwork.freedesktop.org/series/173177/
>
>
>>    What would be the documented recovery mechanism in case one of these fails especially if it is a one time occurence?
> in case of GuC I assume we already trigger a GT reset, which logs its own SIGID
> and if that fails, then we wedge, again logged with its own SIGID
> so all 3x SIGID reports gives us a better picture what just happen
>
>> Wouldn't this approach result in excessive numeric logging and sigid being used in the entire driver ?
> in general we don't expect any failures, but if something fails, IMO we should report any abnormal situation
> so yes, all FW/HW errors that we today report with xe_err() should likely be converted to xe_log_err() family

This conflicts with our initial discussion and series.
  However, if this is the rule for SIGID usage post the new design, I 
have no concerns. In that case, every sysfs,  user interface with 
firmware/hw that fails must generate a SIGID log.

Thanks
Riana

>
>>  From what i understood in the initial series and mallesh's response, this was meant for errors that require a recovery
>> or fatal errors. Am i missing something here?
> then we would just need either PROBE or WEDGED/SURVABILITY logs, as only those are fatal, no?
>
> but since we have RUNTIME/DEVICE FW SIGIDs, when should we use them if not for the error conditions related to code that interacts with that FW?
>
>>>> Riana
>>>>
>>>>> These are usage errors, not real device or firmware failures.
>>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> -/Mallesh
>>>>>
>>>>>> Thanks
>>>>>> Riana
>>>>>>
>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> -/Mallesh
>>>>>>>
>>>>>>>> Thanks
>>>>>>>> Riana
>>>>>>>>
>>>>>>>>>> How do these errors indicate the need for a resolution.
>>>>>>>>>> Do we need it for all kmd logs with components or for errors that need a recovery or can be recoverable?
>>>>>>>>>>
>>>>>>>>>> Thanks
>>>>>>>>>> Riana
>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>>>>>>> ---
>>>>>>>>>>>      drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 ++++++++++++-------------
>>>>>>>>>>>      1 file changed, 13 insertions(+), 13 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>>>>> index e13eebaac1d0..ef847f0a8f2c 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>>>>> @@ -11,6 +11,7 @@
>>>>>>>>>>>        #include "regs/xe_sysctrl_regs.h"
>>>>>>>>>>>      #include "xe_device.h"
>>>>>>>>>>> +#include "xe_log.h"
>>>>>>>>>>>      #include "xe_mmio.h"
>>>>>>>>>>>      #include "xe_pm.h"
>>>>>>>>>>>      #include "xe_printk.h"
>>>>>>>>>>> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>>>>>>>>>      #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>>>>>>>>>>          FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>>>>>>>>>      -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>>>>> -                   unsigned int timeout_ms)
>>>>>>>>>>> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>>>>> +                  unsigned int timeout_ms)
>>>>>>>>>>>      {
>>>>>>>>>>> -    int ret;
>>>>>>>>>>> -
>>>>>>>>>>> -    ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>>>>>>>>>> +    return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>>>>>>>>>>                       timeout_ms * 1000, NULL, false);
>>>>>>>>>>> -
>>>>>>>>>>> -    return ret == 0;
>>>>>>>>>>>      }
>>>>>>>>>>>        static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>>>>> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>>>>>>>>>>          struct xe_device *xe = sc_to_xe(sc);
>>>>>>>>>>>          u32 ctrl_reg, total_frames, frame;
>>>>>>>>>>>          size_t bytes_sent, frame_size;
>>>>>>>>>>> +    int ret;
>>>>>>>>>>>            total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>>>>>>>>>>>      -    if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>>>>>>>> -        xe_err(xe, "sysctrl: Mailbox busy\n");
>>>>>>>>>>> -        return -EBUSY;
>>>>>>>>>>> +    ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>>>>>>>>>> +    if (ret) {
>>>>>>>>>>> +        xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>>>>>>>>>>> +        return ret;
>>>>>>>>>>>          }
>>>>>>>>>>>            sc->phase_bit ^= 1;
>>>>>>>>>>> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>>>>>>>>>>                xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>>>>>>>>>>      -        if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>>>>>>>> -            xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>>>>>>>>>>> +        ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>>>>>>>>>> +        if (ret) {
>>>>>>>>>>> +            xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
>>>>>>>>>>>                  sc->phase_bit = 0;
>>>>>>>>>>> -            return -ETIMEDOUT;
>>>>>>>>>>> +            return ret;
>>>>>>>>>>>              }
>>>>>>>>>>>                bytes_sent += frame_size;
