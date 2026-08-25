Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA7CC61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 20:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672B610E0F7;
	Tue, 25 Aug 2026 20:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VvwAs0dI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7819E10E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 20:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787690901; x=1819226901;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pOBsfJDSFOCvqLuT4ZRqxQjC0VL9x0El6K8NBCPylIU=;
 b=VvwAs0dIDeNrxbcnd8oRWNSuIE5w0rklNZ4lJJrt+Zxpi+W/nWOS2fCA
 5e3CXcWrY3K/mPGmM+4boJsVxOVUgLCM6/90lVTsCKUDXPhbLvm7GYhv2
 5dx+ZCP5nhlj+xJ0ktS5BlXvAHsHozu0oxXRrvuqs09RculwYL62hp3U8
 J5CypuxpeYM2AbLSfJkA1uFmrnDogxKqhVwmbV+SnolrgnF9YQqVXECgy
 cvbqq2A29iP9oNpbkYU31KfKv90wHLzU92GRzqyk6Ai75EKa7b7RfPEUD
 U3rqYdUJBqYjjQpYaIVp2z2z+p8xNbUDcNDCh5UmtisBiOSI3DGDGuozz A==;
X-CSE-ConnectionGUID: 5ePZdfwjROOZoLY8ReMT6w==
X-CSE-MsgGUID: qJpVRexvTtizy1y1cRMzKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88298430"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88298430"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 13:48:21 -0700
X-CSE-ConnectionGUID: 9cJ1tjZgTU+43BiNRujjjQ==
X-CSE-MsgGUID: isw6HFXGQNiVbEO08owKbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="264131433"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 13:48:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 13:48:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 13:48:20 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.10)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 13:48:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydX+uTgi6dSMta2cUpHdE7AqTRGT+QK8XdCxuhClmY5k9xY9TU3EWJnxo6YUG5RIue6h1iPHX1oSnzMrMm34iqSq5uZ0FOYpwVVAjGTWaGU/OZh++WFh4GwTvYl4hu5PVFSVcWKTJtYMyisUE36BqcHnz37xJt9tXKtPg5jX0IxZYwHSa3yyQ7pSucER3+qHXXePisoyaWubVl0pJdKvJdU8TdFa/iae/JKFz0XTpz0bp/R99i7gN9u542Ul+gr/4DIpTduJWLPcZKxH80JvM9vUBWJTY0y5rrIweqF9k6pfE0miVFuMhXIzyfPkg6p6ZyymXFIF0V1GepC5wbVNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgyQ25BNQnag5/Hl/4IkUDzBTCrx/vCaLC0IaDRu6AA=;
 b=yJh6sc6tkPYswxIPCuc3Oa1J0yHP5zHSJqWrymO439iPcLeQTVFUCHkCOcKv7KRVHItmRLcLlxXGiRQ+xuWU3IF9V4vER94wNX4OLOwXcx2m5wHBoknNRc1gRvdOC1TMBONxO56TPwVhv98TV/dXpWWET7Tt6xmqMQ5jR5RnjJRJl37ppzauTN7QZoYQPPNvctFcI6EF1JppqElDdTllA9m8yJ9GHUTP0KVpNgYLeMRPdcTYWsPSzl0ld3QdfPVzarjg4VPyJAxg59LL1N+oJi87cXS6tLa/9k3e6/G7yo2HOvYUCwdDPC10mYW3ogzEmL678GcAtFV7bVRRV3T8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LVUPR11MB9858.namprd11.prod.outlook.com (2603:10b6:408:38b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 20:48:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 20:48:13 +0000
Message-ID: <28c494ee-4455-4e12-b6b3-7ca08b4bdf2b@intel.com>
Date: Tue, 25 Aug 2026 22:48:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] drm/xe/xe_ras: Add support to retrieve info
 queue data for CRI
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-14-badal.nilawar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260825175916.1103841-14-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0165.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35d::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LVUPR11MB9858:EE_
X-MS-Office365-Filtering-Correlation-Id: c9da9fe7-0a08-4a24-d109-08df02ea2e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|3023799007|10067099003|11063799006|5023799004|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: l6gdfu0dVHAhlRaXAFOE21rXPMolSyZPM3/A3NTCMylieetF+2gmDJtGmbw2Z+A/OIP0s7SZx//UlqDHA2dNIWDm4SjDiCSPOzZme3PjByKipq61Naf/jdTxiA90h1hConrflBW9rfADgJMwkqww7RqwhDXQf6LDsRrP+Uao1Mi195EXzRSznjytKlnzEnTaiCztOzzFYTXcPc8+mjlYFga98/QnFOCX6gz/Dqft3oT9+3l51QgWy7O3kU1nJie9/CB9VxenXc8zKb/eYHBK/uobpMRNzE46lY7XGWwnpILzEDgTZtWS2bJWfH1LZoSO8c5U0tBamPLVEY+/CghKktiaVLBXqHY8cagDz4Ex89JEnolgkz9wiAo5s+nOFD/L3dujmOfeuMSuo+FCkftYgbEyPWcQPVeD0a5AeJ5Op8uNPSZvo39VOQ14qxjdEWdYMkQN6hd8WcFZtX6miet93NuYonW125PRGPrvab+2MKd62jeSI9OJ3eKws6el4egrMRG2aIueifxX2P1/uIi+pQS9jB9Pnkr1nTxQjcaW02EDY+SSpRaqoSP8J5GzsyyybtVkd8R8nyMfbWh47CMRfsnQuCR8TIUVGECmkAvREhyRuygMI3eEyOXx/T6/8Zo0aXOk5ps523WFSzzJxwLNs3/qswp+TGlg5OcQ4d95VIM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(3023799007)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU9Xa3ZoekUwL3cvNzFNeTVNRUg0QUJXMERLcDAwcmpxVC9kTWpYWitqSGoy?=
 =?utf-8?B?QkE5TnRSOElzSGdYdHplL1VqVzN4YXlBMEQrY1pCL2NBdGt6SnBPZExtSXZT?=
 =?utf-8?B?TWN6UnNvVk1zT296UWV1dkdIOUdpbGFRQy9sR2IzenlmUHFKTTFJK2ovUjFL?=
 =?utf-8?B?ZDNMNTRPeHh6ckFWVUV2VDE5NUtXbXdiQnRRdzRPQ1FPS2g5UU50YTlsVXRi?=
 =?utf-8?B?WGZ3Y292NHE4NlF0WjBRRDhvQWNtcmdOaWU2RUpOVzhGcVhEYStrUS9BR0lx?=
 =?utf-8?B?cWRZb2xvZVlvMGl4ejl1TVVMVlQwQnh2ZEt5UU1QRDk5anRUU1lncHNteHVa?=
 =?utf-8?B?SjlIUUZHK2FWWGtUL2pLRW9LWHlGc0NyaHhlOFNZL1V2bGxuR3ViZ1kvTU4z?=
 =?utf-8?B?SUJTT2FRMnlJVVlWd3VjK045MklMcHdkQ3ZOdytMQWtGTUhIdGZ4ekxGQ1pt?=
 =?utf-8?B?czkya0RIbXYyQWRydFhMSUNjVDVYNW4vMWVBM2MvTWR3QUQwZDZlWk94aXlv?=
 =?utf-8?B?TXMrQ3Z6b1E5cHdFOTkzREZBZExzWjJqQmQ1WWZLUk1ETTJ6c1NKVXV1Z0JX?=
 =?utf-8?B?cHg2YjlyM0RUVTJ0Rmkzd3FIMGFBazVQZFZ1N3RoOEN3K1VjOTYzM25LeXRo?=
 =?utf-8?B?YXFWM0V4cWRrSjRLcE84blRxR0diUWNhRFRwTFhHNHdqaXFiVk1IYjl3ZUFm?=
 =?utf-8?B?NU9XWCthZHhPajR6NU95eVFnMU1RczdyUnZsekcyc01UK0k2ak5WM3RHaTBS?=
 =?utf-8?B?ZXB1VldGSFRLNkZmWEc0Q2k4NEJqdzhlTnU5bitiMDJWTjR3dHZ1YWVCWlRz?=
 =?utf-8?B?RVQrUmdwVWRYc3FZMUdZTDZlUkh5a2xVN1poUE4yaE9YdjBSUG0vaEJHQk9l?=
 =?utf-8?B?VnR1M0l2UmNmMDNxTEVUNGhYWWlVYkw4Yy9Yd1UwWDlwbkdsKzBhZEtyQTYv?=
 =?utf-8?B?WVBwWmpUZDBVbWc1ZTY4R1lzNGJ5R29nUUNGU0hwWDRyZmNyY2pCaHU3Rktk?=
 =?utf-8?B?Qk1uZEx4YkZnYkVwbHFtR0l5Vk1PbnlDVnpHM0NsRzUwNGFXTGJ4bnBSaHpi?=
 =?utf-8?B?c2hlbzJFdmQzcHhKNVR3eG5kOUR6RjVkdEY0RlpmM2lvRE1hQ2dzSmUrNjFR?=
 =?utf-8?B?Q2NSUG5wR01xM0lhSlZ6ZWZwNDN3YmcyUmFZNFR3RDlyZ1U4TUtGWHJSU3lL?=
 =?utf-8?B?dVloR0d4VzFwL2svQkpHSkJDQXNUOG4yUEtaRWU2a2Fzemt3cVRkcnZjK3Fp?=
 =?utf-8?B?QzFRa3p1SjNhbHpuSFVOQ1RWRWMxcGhrVmJvbGttb2lkSTBTcVQ5TW9iNW01?=
 =?utf-8?B?NE9HQTBLRVJFN0VoalVnQ2dzdW5DQXBUZUZtSmpxa3pWVjFPKzBEb1FYZ2gy?=
 =?utf-8?B?UWZ6NW5nSW04T1ZFd0pLU3Y4djF3ZGJZZVNVMVBWRjBBeUtFY1FEdUxOSFVT?=
 =?utf-8?B?NnFKb3pvWkZPZ1FIQk8xV2hMc2RZMzdyZmsxRmFMQXQzeHlVZll0U1p6dXUz?=
 =?utf-8?B?SmMzbW5IMjBmTGJ1ODR5blNQSDU4aFh5MVZjQnZ4OVpwclgvM1B2TVJ3UHVi?=
 =?utf-8?B?YnhKTTlBbndYMWdxZTNFeVdJR0NDcmFaaEN2Ymw5bVZPeG5vUVhGU1ZiNGNG?=
 =?utf-8?B?bTQ2Z0lhbkR1R0tnS3B6NVNXZGdwOVdVaTlQY1EzYzU0N1k3YWswSUVzc1du?=
 =?utf-8?B?ckpKSFNlbXVLK0l2amRTQURKcWRESGRPNWwvV0RxZE5vZ3hlbThYR0YrcXBE?=
 =?utf-8?B?N1FWZ3ZOUlVKMDJxekJQQ21BcTY5UmgyeXM1NDZlcVo2VHdLeDgvd1VsS296?=
 =?utf-8?B?WHZwYmxKZ1hLVmNvdHRHNTZ3ZDNZSTl0ZHdKUDRQWkN5OHVZWTdFZ3BhR2lq?=
 =?utf-8?B?NzBwVDFUSDFpRlJnNmd3N01lL09PaDZwN1pxT3QrV0ExaUc5YXVBR3NXb29u?=
 =?utf-8?B?WUxyMzh4d0FrM0F6S2NJODliZFZQODBKOTFZR3B4c0JiZ3JCbk5BaHdJc2lI?=
 =?utf-8?B?UmRQVStpYUtmZzR1Z0NPVmdtQ3ZSUDU2SE1FMUpMbWhFUVk3QVozTHh6aWc4?=
 =?utf-8?B?aVdyUGlxZGRrak9DdG0rSml2WVFsWWNRS2xIaW9XT1h1NkNxN3NVYitqUHNZ?=
 =?utf-8?B?WFJzWE9jd2gxNnBtZ2Z0NDBlTStkWk1nSnlneUdPQ2dPdXNOTmVpSG42b0ZS?=
 =?utf-8?B?dGE2ZG9EYkYvT0NBN1pLQkg0WmJpMUZBTDZPSFZwNVQ3WE9GQzl3Myt4OVc1?=
 =?utf-8?B?aGo2elJZWnJsbnVvTTNPNUR1TEhOVHZ6S1ZDSndySWVYZVJkVG1kL3VUMjFI?=
 =?utf-8?B?SHhTeHVEVmpabkdLMzM0STg2UFNrckd4dGpjeEZST21hRTVIemM4NktZek1E?=
 =?utf-8?Q?0Ub28IH2+J+teOhQ=3D?=
X-Exchange-RoutingPolicyChecked: gkG+zbd9p4wrfjeRi7c8l5RRAL0Y/OrrGVZa1viBlI/bqGo9CkgfbwuZ9wULYKnnecCLd1tQARZdiDc8pUX/nqU7fEYOd23rJJpACg8V/6w2Vmb7rg/nba7HJhfVUNZ9A7t0Sp/usV1BDjeZOpuCa2MW7a3ZUdXLR73O8PqwbLeujtHJ7AZPfjqlXFN8MZvKkPLruy4uj0uMVLBvwSoeW/2XE6rrJg+qC3V2j90K8jfAdlv9iJAU1LyBM2qS/U6sagRnm8n2xA/hNAKyziXk4uEBrs2zsg+sa4KH4bDK+lRq5m5OEGN9mCl1FB1WmncHKsHgrAEEFJGmnD/9ki3Ymg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c9da9fe7-0a08-4a24-d109-08df02ea2e42
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 20:48:13.3416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BD8gZ1IONYqJOdTDcZzpsUeIk8zfhj58DnYci2/3xQtLvZh8Kpbn6XC0s/sxeMi6fmvqny1i9ovMDI+E6/VEcSQZTpj2FQ6/Q3l0EhopCPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9858
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



On 8/25/2026 7:59 PM, Badal Nilawar wrote:
> Add support to retrieve info queue data. While constructing CPER
> record info queue data will be retrieved when has_info_queue=1 is
> set in get_counter response.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6
> ---
> v2: Drop unused flags (Mallesh)
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   |  34 ++++++
>  drivers/gpu/drm/xe/xe_ras_types.h             | 108 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>  3 files changed, 144 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f77531..683087235482 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -661,6 +661,40 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>  	return 0;
>  }
>  
> +static int get_info_queue_data(struct xe_device *xe,
> +			       const struct xe_ras_get_info_queue_data_request *req,
> +			       struct xe_ras_get_info_queue_data_response *out)
> +{
> +	struct xe_ras_get_info_queue_data_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	size_t rlen;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
> +				  XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA,
> +				  (void *)req, sizeof(*req), &response, sizeof(response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to get info queue data %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get info queue data response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	xe_dbg(xe, "[RAS]: info queue data: status=%u chunk_size=%u flags=0x%x\n",
> +	       response.operation_status,
> +	       response.queue_response.queue_header.chunk_size,
> +	       response.queue_response.queue_header.flags);
> +
> +	*out = response;
> +	return 0;
> +}
> +
>  static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct xe_ras_get_health_response response = {0};
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 99b2466e2062..d87db9f5174a 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -16,6 +16,10 @@
>  #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>  #define XE_RAS_MEMORY_POISON			BIT(2)
>  #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
> +#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
> +#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE	5120
> +#define XE_RAS_INFO_QUEUE_FLAG_AVAILABLE	0x01
> +#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA	0x02
>  
>  /**
>   * enum xe_ras_recovery_action - RAS recovery actions
> @@ -95,6 +99,109 @@ struct xe_ras_threshold_crossed {
>  	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>  } __packed;
>  
> +/**
> + * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
> + *
> + * Provides chunk metadata for commands that support extended info queue
> + * functionality. Used when the total data exceeds a single mailbox response.
> + */
> +struct xe_ras_info_queue_header {
> +	/** @total_size: Total size of the complete info queue data in bytes */
> +	u32 total_size;
> +	/** @chunk_offset: Offset of this chunk within the total data in bytes */
> +	u32 chunk_offset;
> +	/** @chunk_size: Size of the data in this chunk in bytes */
> +	u32 chunk_size;
> +	/** @sequence_number: Sequence number for this chunk, starts at 0 */
> +	u32 sequence_number;
> +	/** @flags: Info queue control flags (RAS_INFO_QUEUE_FLAG_*) */
> +	u32 flags:8;
> +	/** @compression_type: Compression algorithm used; 0 = none */
> +	u32 compression_type:4;
> +	/** @num_headers: Number of detailed counter headers at start of queue_data */
> +	u32 num_headers:5;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:15;
> +	/** @checksum: CRC32 checksum of this chunk data */
> +	u32 checksum;
> +} __packed;

all those __packed structs look like part of the firmware ABI
shouldn't we keep them in a separate file in abi/ folder
> +
> +/**
> + * struct xe_ras_info_queue_request - Request for a specific chunk of info queue data
> + *
> + * Allows the driver to request continuation of large info queue transfers
> + * by specifying an offset and size within the full data set.
> + */
> +struct xe_ras_info_queue_request {
> +	/** @requested_offset: Byte offset of the requested data chunk */
> +	u32 requested_offset;
> +	/** @requested_size: Maximum size of the requested chunk in bytes */
> +	u32 requested_size;
> +	/** @session_id: Session ID to correlate multi-chunk transfers */
> +	struct xe_ras_error_class session_id;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_info_queue_response - Generic response for commands with info queues
> + *
> + * Standard response format for any command that returns an info queue
> + * payload. May be embedded in a command-specific response structure.
> + */
> +struct xe_ras_info_queue_response {
> +	/** @queue_header: Info queue metadata for this chunk */
> +	struct xe_ras_info_queue_header queue_header;
> +	/** @queue_data: Info queue data for this chunk */
> +	u8 queue_data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
> +} __packed;
> +
> +/**
> + * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
> + *
> + * When a session requests aggregate counter data, one header per matching
> + * dynamic counter class is prepended to the queue data. The @counter field
> + * indicates how many subsequent error log entries belong to this class.
> + */
> +struct xe_ras_info_queue_dynamic_counter_hdr {
> +	/** @error_class: Error class associated with this counter group */
> +	struct xe_ras_error_class error_class;
> +	/** @counter: Number of error log entries that follow for this class */
> +	u32 counter;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_log - Single error log entry following dynamic counter headers
> + */
> +struct xe_ras_error_log {
> +	/** @timestamp: Timestamp when the error was recorded */
> +	u64 timestamp;
> +	/** @error_details: Error-specific details */
> +	u32 error_details[16];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_info_queue_data_request - Request for RAS_CMD_GET_INFO_QUEUE_DATA
> + */
> +struct xe_ras_get_info_queue_data_request {
> +	/** @queue_request: Info queue request parameters */
> +	struct xe_ras_info_queue_request queue_request;
> +	/** @source_command: Original command that generated the info queue */
> +	u32 source_command;
> +	/** @source_context: Context from original command, if applicable */
> +	struct xe_ras_error_class source_context;
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_info_queue_data_response - Response for RAS_CMD_GET_INFO_QUEUE_DATA
> + */
> +struct xe_ras_get_info_queue_data_response {
> +	/** @operation_status: Status of the retrieval operation */
> +	u32 operation_status;
> +	/** @queue_response: Info queue data chunk */
> +	struct xe_ras_info_queue_response queue_response;
> +} __packed;
> +
>  /**
>   * struct xe_ras_get_counter_request - Request structure for get counter
>   */
> @@ -286,4 +393,5 @@ struct xe_ras_set_health_response {
>  	/** @reserved1: Reserved for future use */
>  	u32 reserved1[2];
>  } __packed;
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index d0341538ad05..17f53cb78dc4 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -28,6 +28,7 @@ enum xe_sysctrl_group {
>   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>   * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>   * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
> + * @XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA: Retrieve a chunk of info queue data
>   */
>  enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
> @@ -36,6 +37,7 @@ enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>  	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>  	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
> +	XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA	= 0x0D,
>  };
>  
>  /**

