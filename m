Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106C8CD68ED
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 05:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B830F10E188;
	Tue, 10 Oct 2023 05:42:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FCE10E188
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 05:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696916568; x=1728452568;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ru7yWS1nggZuvuMNON/hS0YGB5a65d0IkP+0jOGfjp8=;
 b=gDNmE+4KKzor5korem4IvMIzlii1y353S9cl454eq5Z3mHqo8Ak22JLq
 /XakhZ9NTeTWrW+hVq4D5gnwWXWJpWk+ugbvFmPxvsbjlYfN44KZhEryB
 jHSS/F+HYZnnOhoY7Z1jOkcF01BK2e22uX6hTTmnMjeb09i8lPa5pTu21
 qqTCb/yIyoQG0s6EH4HuvC2t72TyY9TpJBjQtqJ11uThXgeME+BP/qlzV
 yTOt9OHTw5W3quxqy9n+Jz8o5VR1vXbog8sOE0CdZmlQDtZIJCBizYGTw
 vsNl1cTb346/n9KBu9fDL6Qkncu2VScfUrt8rY9hCOv+rtY9U2XqU7uiW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369382714"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="369382714"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 22:42:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="877091900"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="877091900"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 22:42:48 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 22:42:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 22:42:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 22:42:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBfcZGx5nbmzK1isM/KvwPIcLFrq9KYTv1+BDoqjiM/l9daI8OWaJE6kia+E1m6t5AiJJh9+Xi5TCYEypk5f+Fc+sOtyktKnI6qYxnUa3qvkYLMLPLV/AWgkny5gGf4O+6vd4YtSVoIfEvj7gsoljXUQGNc3W9xqdioPIsX+bDx8rJrQeU6vUzE/cALvtJTyt4U1a4x5+Zl5pvVoB2YjM5T8lKCtGAN5TK9OJ1zRsnzQ1vNA4IcS9LawMSJdIJ0MqtiGCgJQ60KHQJtv2eVLS9mxUzxMNpDDFSv3VwN3ngKDgxoxr7VkLbigTW6aeALQHE6/NNkBjkmbQxS7JUgj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWMXbVk97IZmAQiqtpJkkCeQAPl7fiqnItqXz67bayY=;
 b=Nhd7P+jIsUddFgbVzr/fy94EQ+aNzmsUZiFY6jgofvb658r0HSoyOcqj5P/7Hs6pBzkYLJQjKHi53EUiKmAhBr0ovKOOwPdkzFBz+YQgfxZ4731FGLD/nisj5RvL5GoRit7qYY+cKHL30TxK6siwto8DvSE6V9CPEY1xZCg4MmQr7DALCf3M1Gkh2dfTAL3U0pBiERI5j2CyowKUxsimTbFYxkdyZEaP+kyMFA+rsbJTtfqv/yNWxZgGVaLP58VPi0CaIpy11pgNHnhzjCG2u356AoIU+ysPL+UA/yhl/KimHgCnCq1xqPulu0jZtrlOYx+el5ICgl+0y1klciO/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7209.namprd11.prod.outlook.com (2603:10b6:208:441::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 05:42:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::c2e3:634a:6cd3:7f46]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::c2e3:634a:6cd3:7f46%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 05:42:45 +0000
Message-ID: <236ff168-372d-f620-7b53-57d9cfcb10ed@intel.com>
Date: Tue, 10 Oct 2023 11:12:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
To: "Nilawar, Badal" <badal.nilawar@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231009062209.4009360-1-riana.tauro@intel.com>
 <7c044a59-be46-4945-961e-1fb42dc28d6a@intel.com>
 <ed0e85f6-5149-1c91-5af8-bb40ee7826de@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ed0e85f6-5149-1c91-5af8-bb40ee7826de@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: ebdaac04-3a0e-4100-264a-08dbc953ba39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8zxvJASm7jhP318okBlPYr2uJuUfw4ruqJHT35xoKAmZf92uZNiLiaMJAfAf4Mt4+GRdZu7wJnwNmZNDNHNYJfqzph2v1LPaJfW6ZzOz3QReol2XUth8a9RCbTFT0gy/2TgG1j8vXTw0tPB4SqLsDNfWSPL8vBXiJJ/U+0M69Hxq8Z/FkpZk2qhYFEF1rwO3QwYq87zuVX3c2k4N7A8BeCJq8Alfxfw6WCVAmRvqLWeexni6u0xggDo0syYUeJjFbGl1C3OzYxwVKkXGqdYHEQendzG5LdMC/0WKaxuz7eMTdZQECwajR2XLpT9zJFhncVdSd8DeIPL9WM5Y+wq0AnGzhMKKU+b+dGCjP8tF40BUT5YzuxBls87GFT3b+pA/ciZPAXlBNttwjvOwIMlBtkL26JXoVenNhOr/xr1YIIUMmCPVD1sbi0GHXGApLe9UwmnXW+83/E3KICZk39jt4GTZzOWomHREHHDRn/ZSRz+nKV4FhWDA+Ua8d+aoELDjn2ICulZLP8j4G75EePsAKkMA1CjDQfNcqh41J79GuP3LxVQaEMpRJVHGOOMIDPDv8cdSb6K3mQ2i9fYbo2hpmjKE1Rr1ZGZkdI+lRhQUTuyU+hxAI+HYpJR9AV6QRcCn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(83380400001)(36756003)(31686004)(478600001)(53546011)(6666004)(6512007)(6506007)(38100700002)(6486002)(66556008)(2616005)(26005)(66946007)(66476007)(110136005)(316002)(41300700001)(8676002)(8936002)(44832011)(5660300002)(82960400001)(2906002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3d6Q2NoZ2dTTEtRb0tPb0M5WmFPWW9ONm56TnhLVXhqd204UFkwSHRSc2V2?=
 =?utf-8?B?Y29YL09LbDJVYnZkQWFpMHNxbWwxaVNxVE1GVXpGaTAvWDBDR3ZzVHN5QlRG?=
 =?utf-8?B?algxaG93Q3JnS0ZGYUhVUFpQaW52RjV5YVNkYkliOW02QUJWblk2QjVPY05v?=
 =?utf-8?B?NVlRUWtOZWt4aFhGVUQ0cEpHbjhoUmE1c1p6b25CQ01QaUJ1S2dWV01ucDU4?=
 =?utf-8?B?NXNtSjA3Mll6RGoyZ3ZVaFRGYWNEanlza3dPN3lhQll1L2tQcWZFK2pCMlJj?=
 =?utf-8?B?TTRjNDB3L1FEbEpCOWlXamttcUY5SnlVSnV6VmgzQzd6OGcrTGpONDFQUmcz?=
 =?utf-8?B?ZXBEeS9hOHBPUjQ2WXcwOWo1ai9FL3piVGQxRXFSTUIraXBHYWhMVDhkY21p?=
 =?utf-8?B?bjdram0xSnZTMjlvRWJLUnQvakpubzZ3djhnNDJmUHlCVzRsbXJkdnA3UUdL?=
 =?utf-8?B?V1ZIclFKN1NxZUQvSWwrNzdGWHF0RmltZmVheVpGRjNxUEhlMjdFU0VqcUM2?=
 =?utf-8?B?dXFLNU5TVCs1RU5lVlU2UUEzcXhlNE95c1JCYjZTV3dWVFdmYndEMldteU1Y?=
 =?utf-8?B?a2tteVZVUU9BQzZ6STNFMzZndFlwVnRQbDRsMFFlNGlLZ3pPRTZjVkVwY3ZB?=
 =?utf-8?B?NWloWUJFVXE1blh3NUFWdnQ2QUhFUFNMNFIwSHpSamc4bzZISkYyOVN2UkFG?=
 =?utf-8?B?OWs0ZVRCMGVOZWxxMlNJQmo5Z0lHS1lVMG5pWFB2alBIVDVuczVHUVZyOHFW?=
 =?utf-8?B?OXQzQUZMZCtjNnl0K3RvQ1hTYWlvMGttNVJHcThTanVUS1ZRYnhhRENFT1Bq?=
 =?utf-8?B?ditYTDNyYlI5cUlBYnVxWmhrRlg0QWRINkdoRFA3dGNJT3hyZFFvZ05HVUlP?=
 =?utf-8?B?elc5SkR4TmgxblVya254MDF6MEg2L2hod2xYRGs0Mm1TYzVxWnM2MHN0NmIr?=
 =?utf-8?B?NkRGc1RNYjUzdjg0YXZaejJtRlBTeW12WjBRN1o5ZUEzc2lOc2NPVDRuWmoz?=
 =?utf-8?B?dGJrSWtuZ1E2QWxhSFk1T2RSR3lsMnFvandRbHlES2RFU1R1YXFFb1pPWWNs?=
 =?utf-8?B?WkJVYWwvRGRpK3A5RlRvL0RaaGt6ZTluMFZPL2JZMGswTkx5UzRMNkMrT0hP?=
 =?utf-8?B?bXg5ME1OWDFUZ2VTTUFJcVErUE02S2hwZHZsOXZCSG9Bb05NOCtKbEt2VDY4?=
 =?utf-8?B?cmhlbzlDNU5oNURlUGN3T1I4WFU3WllRQWY3dUo2bXpNOHJ4Q1BWS2VNRFVH?=
 =?utf-8?B?U0V2MUs4TjhnREcxSCtoTUFyaGRWdEVtZzl5eWRVeDc3cE9HMGFhclpCVG12?=
 =?utf-8?B?NHdCRnNCWE1LTm9WbVdXYjN1L2RYdnFGODFGeW1QZTNPd3RVT2JYT2hYSnZB?=
 =?utf-8?B?R1I0bnlCRGVpemcwbGMzN3UxVlBjdUpRQ1VpbmJnL1BPQmR5N0hJSEd6Wkpj?=
 =?utf-8?B?ZXNmbW5TQTRGekN2QnhwMUtNYlZBK3hFWjI4ZmY5cmcyUm8wV1NueEl4d2xw?=
 =?utf-8?B?R3ZkVFVUNTRTbWk2NDUzL3V5QXczbGZ4TmdoNUZmRllhdyttazRDVWhqQ1RC?=
 =?utf-8?B?WlU4dzR1eUJTUmZrQnRCQmw2T0Z1bnE5bGZaK2VkSVA5MjJQTi9welpMRDlQ?=
 =?utf-8?B?RlBuVVo1cjhXbVp1aVZ1R2hkbWVEZVgycHhUZ0Nub214bUtPUGtWMlBtaEtB?=
 =?utf-8?B?aEZpd3ZUTlpiSU1vVWlUeTZWd3JQZnlibEJvQVVmRGszY1M0VTBQeEZ5ZzhG?=
 =?utf-8?B?Mk9peS9wdElkTUtpTUJEME4yTzFSUUx6cy9PZlZXQ2R6b0x1RWRPdDQwbXVO?=
 =?utf-8?B?ZTI2T1BsYUx6T0t4ZUVPcG5hWm91cFpHWk14OG1jNGo3N1dFRURPZFpQaVZv?=
 =?utf-8?B?Snc4WEVFZGlrUmFrQ1ZndzlNMXduSjhKU1NYeXdXbk9wSHpVYk1sNTNzOGdm?=
 =?utf-8?B?UjdOUmhLZFdhdlBEdkV0aThFZWpZVzRuSjZkRkx6OUdPUVU4UC9XNUJmL1Jk?=
 =?utf-8?B?S1BHdHU3REM1eHRmUnR4cGY5V2RMQ2hsNElpQWQ1OHlaUDJTeEF6UTR5ekd2?=
 =?utf-8?B?UlF1T040MTNRSnlpOGR1V3ZiNVplZWlHb2RIZnIvZU81VTdSZ2FUa3FKRFVT?=
 =?utf-8?Q?bcCuAAlNPYj4pnychzDaH0WYO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdaac04-3a0e-4100-264a-08dbc953ba39
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 05:42:45.0405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEdx3FEloPOzane7pWjq3bn50N8sWabK5IGvOUKP7bpvam+8YksV6U6R7R7Ah8325CeVHYnRubm+xOA/rSmeLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7209
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] RFC drm/xe: Add mem_access_get in
 gem_create_ioctl
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



On 10/10/2023 10:47 AM, Nilawar, Badal wrote:
> 
> 
> On 09-10-2023 14:08, Ghimiray, Himal Prasad wrote:
>> Hi Riana,
>>
>>
>> On 09-10-2023 11:52, Riana Tauro wrote:
>>> gem_create_ioctl does not have a mem_access_get till it reaches
>>> xe_bo_move.
>>>
>>> When the device is runtime suspended (in D3cold), new bo created
>>> as part of gem_create_ioctl steals the buddy block of the kernel objects
>>> that are yet to be restored as part of runtime resume (D3cold). The 
>>> runtime
>>> resume triggers only in xe_bo_move. While trying to restore the kernel
>>> objects it finds the buddy block is not free.
>>> Tries to evict the new bo which is already locked causing a deadlock
>>>
>>> Prevent deadlock by taking mem_access get early in the ioctl
>>>
>>>     INFO: task kworker/1:1:44 blocked for more than 61 seconds.
>>>     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this 
>>> message.
>>>     task:kworker/1:1     state:D stack:25272 pid:44 ppid:2  
>>> flags:0x00004000
>>>     [  +0.008395] Workqueue: pm pm_runtime_work
>>>     [  +0.004068] Call Trace:
>>>     [  +0.002486]  <TASK>
>>>     [  +0.002161]  __schedule+0x6f5/0x1640
>>>     [  +0.003702]  ? __pfx___schedule+0x10/0x10
>>>     [  +0.004133]  ? __ww_mutex_lock.constprop.0+0xf4f/0x1e60
>>>     [  +0.005330]  schedule+0x92/0x120
>>>     ....
>>>     [  +0.003922]  ttm_bo_mem_space+0x46d/0x490 [ttm]
>>>     [  +0.004586]  xe_bo_restore_pinned+0x200/0x320 [xe]
>>>     [  +0.005007]  ? __pfx_xe_bo_restore_pinned+0x10/0x10 [xe]
>>>     [  +0.005503]  ? __pfx__printk+0x10/0x10
>>>     [  +0.003791]  ? __pfx_do_raw_spin_lock+0x10/0x10
>>>     [  +0.004597]  xe_bo_restore_kernel+0x2e4/0x470 [xe]
>>>     [  +0.005521]  xe_pm_runtime_resume+0x20a/0x750 [xe]
>>>     ....
>>>     INFO: task xe_mmap:1836 blocked for more than 61 seconds.
>>>     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this 
>>> message.
>>>     task:xe_mmap   state:D stack:23600 pid:1836  ppid:1831 
>>> flags:0x00004002
>>>     [  +0.008395] Call Trace:
>>>     [  +0.002486]  <TASK>
>>>     [  +0.003271]  rpm_resume+0x341/0xad0
>>>     [  +0.005269]  __pm_runtime_resume+0x53/0xc0
>>>     [  +0.004152]  xe_device_mem_access_get+0x2b/0x60 [xe]
>>>     [  +0.005172]  xe_bo_move+0x2ef/0x9f0 [xe]
>>>     [  +0.004131]  ttm_bo_handle_move_mem+0x15a/0x230 [ttm]
>>>
>>> Link:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256
>>>
>>> Cc: Matthew Auld<matthew.auld@intel.com>
>>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++++++++-----
>>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 61789c0e88fb..e453a5264c82 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.cxe_device_mem_access_get @@ -630,6 
>>> +630,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, 
>>> bool evict,
>>>       bool tt_has_data;
>>>       bool needs_clear;
>>>       int ret = 0;
>>> +    bool device_awake;
>>>       /* Bo creation path, moving to system or TT. No clearing 
>>> required. */
>>>       if (!old_mem && ttm) {
>>> @@ -712,7 +713,8 @@ static int xe_bo_move(struct ttm_buffer_object 
>>> *ttm_bo, bool evict,
>>>       xe_tile_assert(tile, tile->migrate);
>>>       trace_xe_bo_move(bo);
>>> -    xe_device_mem_access_get(xe);
>>> +
>>> +    device_awake = xe_device_mem_access_get_if_ongoing(xe);
>>
>> IIRC xe_bo_move is called in eviction path too. Won't it be safe to 
>> use xe_device_mem_access_get here too ?
> 
> Agreed, xe_bo_move is being called from ttm_bo_handle_move_mem which is 
> again called from multiple places. To cover those places its better to 
> keep xe_device_mem_access_get.
> 
> Regards,
> Badal
Hi Himal/Badal

I spoke to Matt Auld offline and his suggestion was to remove it from 
bo_move or should be ongoing if mem_access_get is added early in the ioctl

Removed it and ran the BAT ,saw an error while running xe_live_ktest@dmabuf.

[  +0.007142] Call Trace:
[  +0.002465]  <TASK>
[  +0.002120]  ? __warn+0xa5/0x200
[  +0.003253]  ? xe_device_assert_mem_access+0x17/0x20 [xe]
---
[  +0.005573]  xe_bo_move+0x254/0x1480 [xe]
[  +0.004184]  ? dma_resv_reserve_fences+0x23e/0x4a0
---
[  +0.003764]  xe_bo_create+0x20/0xd0 [xe]
[  +0.004109]  dma_buf_run_device+0x159/0x610 [xe]

So i replaced it with ongoing.


I did not see any failures in evict tests from BAT.


Thanks
Riana

>>
>> BR
>>
>> Himal
>>
>>>       if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>>>           /*
>>> @@ -735,7 +737,8 @@ static int xe_bo_move(struct ttm_buffer_object 
>>> *ttm_bo, bool evict,
>>>                   if (XE_WARN_ON(new_mem->start == 
>>> XE_BO_INVALID_OFFSET)) {
>>>                       ret = -EINVAL;
>>> -                    xe_device_mem_access_put(xe);
>>> +                    if (device_awake)
>>> +                        xe_device_mem_access_put(xe);
>>>                       goto out;
>>>                   }
>>> @@ -753,7 +756,8 @@ static int xe_bo_move(struct ttm_buffer_object 
>>> *ttm_bo, bool evict,
>>>                           bo, bo, old_mem, new_mem);
>>>           if (IS_ERR(fence)) {
>>>               ret = PTR_ERR(fence);
>>> -            xe_device_mem_access_put(xe);
>>> +            if (device_awake)
>>> +                xe_device_mem_access_put(xe);
>>>               goto out;
>>>           }
>>>           if (!move_lacks_source) {
>>> @@ -778,10 +782,12 @@ static int xe_bo_move(struct ttm_buffer_object 
>>> *ttm_bo, bool evict,
>>>           dma_fence_put(fence);
>>>       }
>>> -    xe_device_mem_access_put(xe);
>>> +    if (device_awake)
>>> +        xe_device_mem_access_put(xe);
>>>       trace_printk("new_mem->mem_type=%d\n", new_mem->mem_type);
>>>   out:
>>> +
>>>       return ret;
>>>   }
>>> @@ -1810,13 +1816,17 @@ int xe_gem_create_ioctl(struct drm_device 
>>> *dev, void *data,
>>>           bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>>>       }
>>> +    xe_device_mem_access_get(xe);
>>>       if (args->vm_id) {
>>>           vm = xe_vm_lookup(xef, args->vm_id);
>>> -        if (XE_IOCTL_DBG(xe, !vm))
>>> +        if (XE_IOCTL_DBG(xe, !vm)) {
>>> +            xe_device_mem_access_put(xe);
>>>               return -ENOENT;
>>> +        }
>>>           err = xe_vm_lock(vm, true);
>>>           if (err) {
>>>               xe_vm_put(vm);
>>> +            xe_device_mem_access_put(xe);
>>>               return err;
>>>           }
>>>       }
>>> @@ -1845,6 +1855,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, 
>>> void *data,
>>>           xe_vm_unlock(vm);
>>>           xe_vm_put(vm);
>>>       }
>>> +
>>> +    xe_device_mem_access_put(xe);
>>>       return err;
>>>   }
