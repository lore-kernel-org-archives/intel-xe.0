Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56225C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 21:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C3B10E91A;
	Wed, 12 Jun 2024 21:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9dR5GLx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1A810E91A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 21:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718227552; x=1749763552;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/rjgUIYM4m5soaiqy1LZde/tfy9FQBbz9cs4IDhBDOA=;
 b=U9dR5GLxiiyMVTe/zXP2chWje2urLnwtU8l9IVc0NG1yXRAReoh7A03V
 eXKCcHegbmdrf65C9qpEQImMxYJR3ZYb9EDT+Lc+WOK/zETH29WiND6Op
 ictEPxnsLI2KPy3dBgF7XQVYNU/jOenyEgzf9HKvwHNY7mVYlNpOtx6RM
 hqAs/hMtZyrDKaE560oC0hJKrQaY6svs2WD8IL1J9WoDoEUU2la+d8w2/
 N6qw367T6qgDO+PvsmtjYuoFUJzQed4DfNDSNuA6a1az67EbE+pUeL7Ef
 XVOWJC+aLqk8CJ2V9KIXg7du7vc+GohHgbrt6asMjvecfjdK+whv+kEh1 Q==;
X-CSE-ConnectionGUID: ZrA3YmpNRM+aXFoAs/pOXg==
X-CSE-MsgGUID: WdidVomcTiagbfhm4I8oog==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25652807"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="25652807"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 14:25:52 -0700
X-CSE-ConnectionGUID: o0aFTXcRSWqDCwwC7OBAWQ==
X-CSE-MsgGUID: xLbK5pgVTTSLx4y1CWqW9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39781747"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 14:25:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 14:25:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 14:25:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 14:25:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 14:25:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7Z7ZQo3xG5pesOK+QJX6awuD+Hinakl90gwvZh0kPH/6qL78E5vgv6gV0tJwEboulJi/6cgzKdXKHbjkhYzZFNqfTGGSZH37RRi61oE/+ipOJ0VmbrGUI1EYKAmXTPzhUxSu88DiEO5b0i2+knq1sWbM5vc+L1HzoJ0H+OQxfCEh1vQZ+0zvHJqJxOgs2P8zOtit00s7jOC5mmC/C7z9JDZDEwokkkDoPabdKlifT3lNCkiEh6ps8BpPgyPxk+6ElBcDG1gh86dB/gZ2prmKKkSxvuSY5rNN4UoRoCbhVm0tU9K659BpiSTqtHS4QJAmlTH/lizPCAKtWNwzs90mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqDQ9EZGALv8NjcN2y7vfjnTtnqGp2CG/Pg0O1sjM54=;
 b=SvLzoPuUme7A3gfqT+ekDVpmpHPRpCsawz41np64ujB9tUXMwbpWSeCq1UZNSYvivWicDEiRdYAtWsTQJ7rgrBNS/A5lK9N22xtiWaGqFCYGHs7X5z5aFkJGbaG2UdQx8crLZ8tSH7WhSv9pkGF7+3ozCm8bNOqyzD0zqihUMH129Z7d8sUFFRCzqiY1FjTfheKe2SVXFjR6wGhBuPWGbWcz0idJW2obPQsVMGWCjcqhyFYKTjltQR585sw2TdcIeTjgzW5A1RfxHzzSEbtuOXe7tkAEgyRipREqFba8osvs3+6gjsuox9k3+z+nlGTl1NZ31qDPEpE7MCDyUvAFCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SN7PR11MB6972.namprd11.prod.outlook.com (2603:10b6:806:2ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.40; Wed, 12 Jun
 2024 21:25:43 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 21:25:43 +0000
Message-ID: <70b451a2-b23d-47ce-8d20-501046744959@intel.com>
Date: Wed, 12 Jun 2024 14:25:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/11] drm/xe: Assert runnable state in
 handle_sched_done
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-8-matthew.brost@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240611144053.2805091-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0094.namprd04.prod.outlook.com
 (2603:10b6:303:83::9) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SN7PR11MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d07d5e4-490d-4d88-fe27-08dc8b263739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnNPZGVkcWhBb0xFS0orRjZKSTRqbVk4MXBYcnV4RmVwSWdLdDl6eWVPMzlZ?=
 =?utf-8?B?MVd3dWEzZzhhK2hDVlhISWFGWDRKbThmcnNTa3BSbWNKU3NheFZXT3c2ZVpD?=
 =?utf-8?B?a2NPWFVyU1BORnYwN0N1QjlIbTZsNjNCWk4vNmpXQkFSRXZUVitlMjJrTCtU?=
 =?utf-8?B?eHdTWWNDZlJUaEt3QnIvaitZK2JpbUN2UXNNdHFwSTA5RGJ2L09BbSthckgz?=
 =?utf-8?B?Qy9DSzZRUmNmME1wdXFoZkgxRHVnUHpIQnZpUU1mcG02bDY5Z1dUcU9VenpH?=
 =?utf-8?B?V0o3dWowbE5jaGxPcWY4bVBYTEh5Q3h4dnI1OGFKZjRuT3lpUXRqbFpzSVl4?=
 =?utf-8?B?RlRGUzk5Wk9QWTIyZS9qZGdkNGI3eTJMYXJBaGo4V25RKzMrdVA1WHIwY05P?=
 =?utf-8?B?b0FrUWNUanduNnhZMCswbmhTMGMrdmpudnEzeVcxWE53cm8vMDR3K0RrblQ4?=
 =?utf-8?B?d1FNRnNwL29VUjQ3K3lLc0dBUjh5OFFOeC9DdXFTWDhRbG5MdUM5bXZGQWdt?=
 =?utf-8?B?R1MycDdtUmQwRzRBNktSa0hDcFQyWURwSHFEbU1ZQVVTRmpqbHJka3FtUHh1?=
 =?utf-8?B?SHBOWHBIcXk0Q3Bsa25GS2Z5Z3lIZXI0ZHArY1RQWFY3VlVvelZwd2VHTm9s?=
 =?utf-8?B?RWdiQTZTU2wyRzE1anFKOE1HcGJQejAvVHRCTENxM2M3TlE3OFBuVzdUd2V3?=
 =?utf-8?B?cEsxSDU3ZFhHdTdNSU1naFhQWXQ2dmpPZEo4eGdocEFaUjRTalZjTys2TnN3?=
 =?utf-8?B?azVlMjF4dWJZdHlzQ1kvL1JNMytBMlMxdU1wbjc1OWRiTGtvM0xhcWFHbG9h?=
 =?utf-8?B?b3dzQWRXVkpldmpXaXYreVZSSGxHSWNuTXVWcUVFUld1ZXVQK29GbHhSMG4w?=
 =?utf-8?B?MWRRS2VnOStLMHJIQkovcHhYZ2R3V0c3eFRvSmljRWNSd3VBazJraWgxUE8r?=
 =?utf-8?B?RndMS2RLOHJnMDAwK3d3YzlkQThOYWVRdVdQRmlwaXdzeHFyYUdDNlg0RWti?=
 =?utf-8?B?THl3Q2pmYis2MXlTVmZwNCs3bFUyUDluby9sNkl0bk43MGdHMFIyYWgzS1gy?=
 =?utf-8?B?cTd2eVlja0ZhWHY3bEFEdDVUN2JLeVh1WUVrU2dyT3VNc1RIMHY3enVwRUda?=
 =?utf-8?B?TktOM0IwLzh3NXZoZkFHNEVWQktzRnJvN3NyaVdkZ0o5NjFiOHFlNld3bysw?=
 =?utf-8?B?bXpFVG52NngyNVdENFVENjBNVWFtbTlDaTRuSFVSTm9jNzc4ZGhxMUJDcU5E?=
 =?utf-8?B?ZS9PYkN2N1RiQnRUZm1LSGlLNGNtdkRzbk5jZlFMby9TLzlzeEo4ZEFRWm1O?=
 =?utf-8?B?ZG10NThPMkJkTlJDUytVSHZ6L3RMWDZKOU9OamY2c3FTaEdNUy9OeXVaeUwx?=
 =?utf-8?B?T2dxa2RnM3NWZ0FqcmszZnRleHczWktCOEVUWGFHc2EyWFFDOWtaUzNmak9q?=
 =?utf-8?B?ZDQvNWRObXJ2d1l3MzJjT0pKL1lvSlhwTVp0SndLeTlGVnR6VytMY2NSTEcr?=
 =?utf-8?B?aC8wUk54Y0NFdjZIUFFGa0RJOXBSaDVRRnExRTYwSEROdlNwQ3VQZW1uY282?=
 =?utf-8?B?RXRZVHZ2ckk1dDMySGZrRC81aHo3cVRVMlBKVi8rTTZrMzMzVWlIM0x6M1c2?=
 =?utf-8?B?TlZPbXkyMHVMai9FMHpXdTFyc1VCS1RnMlpmUkJ2Qi9CY0pVWTJVTWk5YlVO?=
 =?utf-8?B?NDl5bklLRmM4Z1dSWXQxQjA3MUZBcUdNRkpsdSt2Z3R3TGUzZXJwK0xSNG9H?=
 =?utf-8?Q?y+0p5fyEC4aWLigdCbi8GQ7070bwmy9N8QSNQid?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNycmlRUlNvYnV5enJDZXVSaXFKUVhHUWFCYjg4NXNFMEhXcmljYzNjSWg3?=
 =?utf-8?B?dWdpTldiWkhyMkdiNVJCQXpWYmxsVlFlUVJ6dEdWVTBla01zcjg4ZVNpZy9a?=
 =?utf-8?B?Qjd5Njg0blBrb21md0hUc0htZm1iL3E2UDFINmtEOWEzUU5ZMTd5SmNnSytl?=
 =?utf-8?B?R0hDa2JWWUZUS0tmT3YwVHhxY2gwM1VwM1I2NThYYkZNNzRkS09zOVI3OXdr?=
 =?utf-8?B?N0RlWUx2cStaSVhHOGlrVndlYWlGV3I0VHg3VFB6UVkram5oRS82a3I1Y21y?=
 =?utf-8?B?Y21VQkgvSk85QkduVG5QWWJka1ZvT1lOQWtDSUtPRklydTFiZ0lTekNiQVZt?=
 =?utf-8?B?SGpkMmpFTllLaVZuOCtjaCt0TzZPUHN6ejZCb3pVd0tGa1RjS2hVUFV0RVFV?=
 =?utf-8?B?bWtUZlc0ZkVLRU12dWV0TWNMUHZBZ2p1NjA4Z3N6eFVxN1VzZTBBa3QyMCto?=
 =?utf-8?B?NEk0eUVoR05heUNDb2JsY1FrcC9TM082aEcvSGVXWVlaclZtTzkrSlEzNDR6?=
 =?utf-8?B?MFMvZExnSmxZSStQL3lTUlM3RGRvbkE1K3EyZ3ZlTHlJN1ZlRlQrRTNNN1dO?=
 =?utf-8?B?aFF1NCt5RlA3UXR1S1ZIUzRuZFNtT0I4ZFJ1OE1COTdnTXdyUVZubk03WkVM?=
 =?utf-8?B?WHN4eVkyT3JjRitNbnZ2bnY1Yyt0dFBxSEtnTGNwRWc4N0hHUXlpNUZvU2tH?=
 =?utf-8?B?dFFSV0JLMVovdDVEZTZkbWZkNStrV2RuMDdNbVhuNE1xSndrL2ZRTGRYYVVI?=
 =?utf-8?B?QXh4TFRzcDlJWjN6cjBSVTZOanRzcHh3WDNwWWlYTE9sYng2UmQvcUxnbXlL?=
 =?utf-8?B?WDBkK1ZyY3BZY1U0cW1vSDd6WXNDd0lXZkZTRHBTcWtzMXRBK0ZrV3VCeHNJ?=
 =?utf-8?B?TlVtZHRnNEF0WDdYWjlkR0lxMXNaTFlqa0FBZHN5NTdWc2lpUXhJVlBOK2NU?=
 =?utf-8?B?a1B2Rmo2eUg4a2xIUDgrYTV0UHc0MDYxUEFoSWhvL0ovRk84ZzdvdkkrdTM3?=
 =?utf-8?B?NEVwUlZrTnRySmhtZHI0SnRYc1BmUmpVQ1BtSWxHQ1cwWk1Bbm0yNE9rWTVI?=
 =?utf-8?B?aEczU3VpRkdJUEkzZjc5OGZXQnBkOEdXcFVYNm5LcGlXTk9WelpWWmczWWdN?=
 =?utf-8?B?TXQyZ0p3N1dGUG5mR21KOERLMDV1dmt5MVcwby9PcUJtUHRCUytoYmRGbmVG?=
 =?utf-8?B?U1E2SnVoaTVLWXNEWGNKQkNVZEtEK1RPcWFtZzgyMFQ2aXhTZUxJQXhPVity?=
 =?utf-8?B?TGZ2eG56REVoenZqQXJZbE5zbFp5dTVodUs4YVZDaDNuZjdaQmp4MWFZZXRG?=
 =?utf-8?B?RTZJSFlGYjU3OUNlTFFnZ3IreHowV1paME82UVlVN1VtSi9lRWJ6YnNRZGk5?=
 =?utf-8?B?akxNR3hjS0Y1bWhMejliLzRpSzhzU0QxUjlROGVBOGRTb3VqVFQ3UXY2WGU3?=
 =?utf-8?B?OXI1ZUpPVVM3SXdFR3J1MXFkWktOTTJCcjBYUlhneFJmcTZkR1N5MG0zQ2g3?=
 =?utf-8?B?WlhVNjhIMFkydDU1Z2p3SVFLQlZXNXd1L2NjK0RPdzc4WjlDWXpkaGdTczRT?=
 =?utf-8?B?bEtJdml3ZkZLNW8vaFR1cnlHMVQyb3BuSXoxRUhTRXBjVWlSWmdmMFRMOWs5?=
 =?utf-8?B?WGM0OVdRK3NEd2d2V0wvN0FQaWVHenIxMUNLVjEzRmU4UnVpcmQ1a1lSM0s5?=
 =?utf-8?B?MDZwWGRPVmhOYzdsSVRTeXozM0JVK0lXbXBqT0trS0I2Wk02U0ZpWFZmNXVF?=
 =?utf-8?B?OXA1ZmV4bUZiUUxlMEZXb3o4aThTQWxRS25EZytDU0xrY0k5SU81V2RjZDJP?=
 =?utf-8?B?RG05aTRrRFp4b05lYktjcDArSjBXVmJWd3p6Mlc2UjBiLzhCWndqaVRZSXVZ?=
 =?utf-8?B?RSs1K3ZYVERtSlI4T0IyM2xPZ2RLWnNYeEQycmZyNDRiQ3dIbTYzLzFXbDFU?=
 =?utf-8?B?Z1NYTEJvckkrSmFURTNDSHh3VlJydkU3YlVEWFpLaDNFVmVleWtvR3hIUFhh?=
 =?utf-8?B?TEdTdVFwVE1qdFZuUmNWQ2xVRi80Wi9yQmMySUtHbjVpVjIxcHpRUk5mSmJE?=
 =?utf-8?B?aUkxOU5Ra2djSFZHYUZzMG1qZkJyaEtuNTB4MEJoWFJ5TDlzVzhKTlAyeHBi?=
 =?utf-8?B?SDNxSStJbHRzS0IyRitJR2hvbWhVWUkycy9qdDFXZVp4VG9PZXJiTG5ucDd6?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d07d5e4-490d-4d88-fe27-08dc8b263739
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 21:25:43.2629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoVjxtiDUJw3bN21RaCnQe/33GvjeH8ztfhWu45uBaZEmzKWGMytnw6fH8mJ5d9paLaQQz7W84ZfC1DcSIBS7oMM658Le7a0UFlb7f7YMb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6972
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

On 6/11/2024 07:40, Matthew Brost wrote:
> Ensure G2H and KMD GuC machine match.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index afd22a8d815d..ab0dc93d7740 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1592,16 +1592,21 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>   	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
>   }
>   
> -static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
> +static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> +			      u32 runnable_state)
>   {
>   	trace_xe_exec_queue_scheduling_done(q);
>   
>   	if (exec_queue_pending_enable(q)) {
> +		xe_gt_assert(guc_to_gt(guc), runnable_state == 1);
> +
>   		q->guc->resume_time = ktime_get();
>   		clear_exec_queue_pending_enable(q);
>   		smp_wmb();
>   		wake_up_all(&guc->ct.wq);
>   	} else {
> +		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> +
Isn't this the wrong way around?

You made an earlier comment that sounded like it is legal for an enable 
to be queued while a disable is still pending? If so, then you would get 
in here for the disable notification but with both enable_pending and 
disable_pending flags set. That would hit the assert. Whereas, if the if 
checks the runnable_state parameter and the assert then checks for 
pending, you will not hit the assert and the code will do the correct thing.

John.

>   		clear_exec_queue_pending_disable(q);
>   		if (q->guc->suspend_pending) {
>   			suspend_fence_signal(q);
> @@ -1640,7 +1645,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   		return -EPROTO;
>   	}
>   
> -	handle_sched_done(guc, q);
> +	handle_sched_done(guc, q, runnable_state);
>   
>   	return 0;
>   }

