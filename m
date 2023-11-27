Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC066C0755A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 03:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B1610E17F;
	Mon, 27 Nov 2023 03:23:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5A410E178
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 03:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701055408; x=1732591408;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=06dbCgddzXly+hyJyg67xqi+efPhHSN85TTpk4rqxZk=;
 b=PlKFxFw7qATxzaRJ6gmJg+Tal9mpw6V1a4Ck014OFNw/hlGuNEtHHjIt
 BGJHhWaq6U1mtOXXb1+tsuYnUXOVafVMyZ17czUApTRLFPdLsGd5Ql2QR
 2bFSm9g4PDyZQ8t5KsZ12UFl++Nr/bpG3zc32CA9imY8HkoEjJc5vDGKh
 xP+1zFal/UclUa8wNcMwb7rs3/i0TqZ+cyrzc4yEtSxyCdajSPVTIGzk3
 axktVZyOQ2PWALlrVIYpnIMFZpEz6kTEiIbt0L8gY8da818maKGDQArM5
 8ZunkFqfAY3i09wgPHW5c10iG8Tkqjd3R7hPfGTJtFMvvdVdLVmsIggcQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="11328428"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="11328428"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2023 19:23:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="911975573"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="911975573"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2023 19:23:28 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 19:23:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 19:23:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 19:23:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOvlNAUVvPMTGjlX+A9bEmj+w4V5ysE14++RPmssouseaez0v9PQvLiEPXShAxDRLFq9WMrUIAvBT0ZU9KAYDFN7DdKwx18nLKB21gLG2kUNRyJvgQgidx5McU9oYr6y89ABEoLxDWrNH08CEuCxXVsoYDQSJY+7yRf3yNqHsTcye7WFj5OveFzhTb+UdlLZL7ZMHHOD7RdL+uLL/g+G/3dzN4P+c1F4rjdTL0Ol11uZ/mQHR+Fh1L1PrRFEkQPylJSWVcvS+vY8kVHg3+Q8CO/x/QPIHN6n004GRAJ1mjExY0mN43HbPMv9wIcN2YCOHSjA9LxydUa4bLfiJ92bYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18ppDNrdP++0SKrSEvXFOM22BJcSkzX/Mvi8VIppjyk=;
 b=Z72B9DnAZzVSS39HbHNUKOS1B7dH4ONGJTFyhs23N4FHNRNgJApS1nO0ZmD2Bj4NyzGNh2DJ5K5lNSna+ImCreuP9vyfiosP1f+BVEGK8bUBo7YoHa+rM+QWsXXfnS9uu7K0BXHtm9wXx679k/9VSy/N0ejufiv8TukfbdTqiBf3umKx9VuXXGcsqLZx37uLW6GpUZEjXnMxcaZS05OxfhBoQwKHYenFt5xIdC/mut8gkYXKD4fYrMz8pCrCcjXICMc336i/qG3756oHC9eHkrHXuimPW8LvzZ0hEOp0L9+gF9IaztLs/u62ccB6uw2+xgE2ZXRcmQamCBH4Nr2jbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 03:23:25 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 03:23:25 +0000
Message-ID: <1ef9a821-70d9-4b94-b5ff-ada3f452227b@intel.com>
Date: Mon, 27 Nov 2023 08:53:19 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-6-himal.prasad.ghimiray@intel.com>
 <9ffd93188fb97a3554e56bcee2cefe1ffc4c61a4.camel@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <9ffd93188fb97a3554e56bcee2cefe1ffc4c61a4.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::11) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d27983a-3996-4c53-c826-08dbeef8373f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pfN9+vTwtMkYkZHuBk54Z1daXhdySm3eAe5XVBW/Vejn+SUYEpVie6lzWUEDD7EPiFaK1cNngi1YNj3dN1rE84jS1tfso4pEzx7kC7sMmBqCIbpAb4GBffbzHOt+Rs53IHZhhfpy7swhmuLPH6jGhUIUwxcJvtt7i04/qN8ZV92c3X+FP9L22tdFaWtXYfsTUpPNeg5/1gfL/qVUo8tLTxw0YcdzUp0dwNTMAiaG27oqs49njb3x1lfwRCclArMqjS8rsihbjDLziZZi6yGkkrRb8PRZD9Pshek1XfuegQgOffLlJAdOzVUkxBXayHWJArutQEDHXPggHjuFSX2nLeuJfzXmaxrwE9a25+G09YPf8JLuurLFfzUoHwqDO/YuN7F/Lanxy1wRUZcl8dEboSjimYGhjdTRIGw9Zf9l9cgaL1Lhre4uW/ZsqV2GZQB99qcl1vurEQSZdrsgDPL/TJ9SnvvpKOn+3hycQnzcnDXADPVTf1SQqqzNzcN7lY1mMEoLn+lLVTjL4QD/yWqxCo74mO2cFuHB8wXyoXNep3e8oIuVu5aQDg093oQsTi6TsQcj9j/yLSCgjbCR/C5dwxRnzAAZTcPP7dqvAqlDBB/v5B7m1XfGEYBX4mhifYU6dUvKtZZScgHAk3rJ/vIrpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(31686004)(4001150100001)(2906002)(83380400001)(5660300002)(82960400001)(66574015)(26005)(86362001)(2616005)(6512007)(53546011)(6506007)(6666004)(8676002)(8936002)(31696002)(6486002)(478600001)(66946007)(316002)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2lxU25oc2hZQ1F2TkJYYlYyT21mWmsyNHQ4eXdNQ0kvNklvb2Jlem9jenZQ?=
 =?utf-8?B?UVd1c0NIckdETERrU3BLamtqVXpCdXJFWXJ6UEhTMlYyRVBucVBxRTAvNHk5?=
 =?utf-8?B?YmQzUkNhY2F2Z2xUYlprLzIrOWZaT3YycGhmUXpOZVJ5dG9OUWJLTCtXQllW?=
 =?utf-8?B?WDdMNmt1K2NqWWRqK3M5VkJpeTl2NFJSV2tXV0ZkVm1KMTlZenRPSFNDWTRH?=
 =?utf-8?B?R1NGSWNzeE1xUis3cTBlaHRrOHlwOHN6NHEyYnd2ODVIbHlrUGdKUVlielZY?=
 =?utf-8?B?S1pmQ2w0LzdEc1ZNZHRhOFkvMnpSM3pmMWJUQ3NxU3pXd2Exc0MvV0VpZ2JP?=
 =?utf-8?B?Vzh0Y281VitVcEN6UkZmS1J5UmRKVE40N0NycURjOVdWbjlJMXA3L0xqbE8w?=
 =?utf-8?B?UG82Nk13MFBZZ2RvcUpoWGFNcnFDUFYwWkRiUVZQSGZ2UUZ5NXBGUjVBRXBT?=
 =?utf-8?B?ZC8wMzJheFBDUVVaeEtXQXN0UjVoU1ZYeVZ1cnRZRHJFR2hnVHVXYlZwS0xY?=
 =?utf-8?B?VEI5RXBwY281RlZKU21sZnpubHRYZk1weUQzZitnMm5NN01OZS9FanVLUVk2?=
 =?utf-8?B?WmZ3UGF4eWNHMmw2VnhpS3ljNnlqNzR5aCtzbEpaemV6NkIwT04yalZxd2ta?=
 =?utf-8?B?TGQrM0Ryc2tpY3NjZ0p0VE1RaGlKN3VUbFBUdDZ3Mjdvcis2U1NDRkJOaDhW?=
 =?utf-8?B?QkdPdURXT3NOenBrZGdzalRLNUcvdnM3eUdQdHpPQi9kUzJBVC9XZnNLbncv?=
 =?utf-8?B?OG9iVDhYa1daaGEzQUtGNndXcE5NcVNWLzRaS0NBSnZkalgyTnRxQzRDN05l?=
 =?utf-8?B?ZFlybVBDK295WlpaREJNKzhwbkNKbnJ1R0dWSitjcS9wcERGOWNPSFhMMlJV?=
 =?utf-8?B?TXNmRmdGT0ROQUVqeU1CT25pWFdBYWJPTU55TDRxVU1UQ0ROVUlUVCtDYzNk?=
 =?utf-8?B?QW0rTzJsbGxrbnh4cnR2eTRUV05YMmxncmxjNGdVdy9JT3lsYzNuQ2JqUjVH?=
 =?utf-8?B?OGhGZFh2ei9PWFRkSm9JaHI2TnBJWHBNTmFzVVVGSVdZTkNpM2srQnU0UjlS?=
 =?utf-8?B?aHpHZE8ra1V5RU5YcnlnQitHSVU3QkpQSWRaeUxTc3BIL0dIa0UxWjVTakYz?=
 =?utf-8?B?VzlxOWVLY3ZBRlg5YzhTU0ZNYTB4dmQyYktiYWFzbHdROURDQ1ZPNW9LTTVN?=
 =?utf-8?B?emRONmNQSWFpK2t0QWsrT1pXOFBxQitjWElka1ZyeUE5TmxwcWpWSHIrY09L?=
 =?utf-8?B?MXNtSE5CUHQzYzF3MmkzYkxPb2JUdmtyZDVWM2ZQdHMzMGR5cUtLWFl3b2wz?=
 =?utf-8?B?bHhuSUMySnpwSEVZVEs2VGpnWjhuOEFJSFdQWm9FUk1HREtBS3pSR0ZlQytH?=
 =?utf-8?B?ZXRtSXN2S1c5VEJDT3U4NG5zRkFqYmxHeFNxYW5DeUFtS3B4RmlDZGNLbkw5?=
 =?utf-8?B?cGk1RHkyWUNva1BjdW5tZS9mK2VHblUzMkk1SmozYVZtNjlrSzR5TWIyL2E1?=
 =?utf-8?B?b2FaVWhyOW56aXgxRG5rYkEyMzlwWVFlbE54ZkFZLzBHUTNzSW01dWxkUTlP?=
 =?utf-8?B?UWs0TEtVQWdUVFQ1eElaNWVmcUY2dWJFaXpRSzh2L2UrZmtOKzJmRFZ6Q2JD?=
 =?utf-8?B?SUZXQW1QT3JYTnNmOFJPcGZvYzR2b2VYay8xRFNZNHkxcnVRL1pnTzM3Smpu?=
 =?utf-8?B?VjZwNDVxYk1JUnFaNnNXb0JZcjNEckw2Q0RqVUhLb1c2a0hCaWRKWUNsc1c2?=
 =?utf-8?B?Q2ZxSzVpdGxTNngyOHFzWVhlN25mUUVheURlUUVKTUhjQVdKemhSTlgrcFcx?=
 =?utf-8?B?Yi9yUUs5ZWhuQVZiclh2bmlZZzBNdHQ4NG5GQVBsbjRMbWZncEU1NVA2RlI1?=
 =?utf-8?B?T2VQdStBblVmR2sxb1NxSzRIcjZzTkhkenV1cG5mMWxhL0V1Q0xyL2ZMdjNZ?=
 =?utf-8?B?L0Fob0tJZm5LZTFDYkpBK1FQcTFtVlE1RXBBWSsrWmYyM2k5aCs3OWxBajFU?=
 =?utf-8?B?UDhVVkNudHIybjN5K1NPSktsMWlGU1B3RUxFK1BJUFEvcHRnejA4RWNlSURj?=
 =?utf-8?B?VHlUWm1wcEpIZUpUaEI5a0tpQi81UmQ2SGk5eEdtYkFmUFZiWFZ6Q3VvNndZ?=
 =?utf-8?B?eGVlTnIwMGF6ZFJEWFhvK1UvN1pnWURmZFZ0b2FDZGdhZU1HeE05d2NCdVkx?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d27983a-3996-4c53-c826-08dbeef8373f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 03:23:25.2425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDFizupaoyPif+yR7MVWadNAv0Th+Weg9EJU5Hyv6kY1XXP5AUeKCGtKOv8vdulJNC/o4Cgx+L9YT21B1z8auu7iSis/FjP6WoudyUZKH8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 5/6] drm/xe/xe_migrate.c: Use NULL 1G PTE
 mapped at 255GiB VA for ccs clear.
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


On 24-11-2023 16:49, Thomas Hellström wrote:
> On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
>> Get rid of the cleared bo, instead use null 1G PTE mapped at 255GiB
>> offset, this can be used for both dgfx and igfx.
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 56 ++++++-------------------------
>> --
>>   1 file changed, 10 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index 06706fad67aa..bdcb20f23531 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -54,8 +54,8 @@ struct xe_migrate {
>>          u64 batch_base_ofs;
>>          /** @usm_batch_base_ofs: VM offset of the usm batch buffer */
>>          u64 usm_batch_base_ofs;
>> -       /** @cleared_vram_ofs: VM offset of @cleared_bo. */
>> -       u64 cleared_vram_ofs;
>> +       /** @cleared_mem_ofs: VM offset of @cleared_bo. */
>> +       u64 cleared_mem_ofs;
> Can we also remove xe_migrate::cleared_bo?
Sure. Will clean it up in next version.
>
>>          /**
>>           * @fence: dma-fence representing the last migration job
>> batch.
>>           * Protected by @job_mutex.
>> @@ -125,41 +125,6 @@ static u64 xe_migrate_vram_ofs(struct xe_device
>> *xe, u64 addr)
>>          return addr + (256ULL << xe_pt_shift(2));
>>   }
>>   
>> -/*
>> - * For flat CCS clearing we need a cleared chunk of memory to copy
>> from,
>> - * since the CCS clearing mode of XY_FAST_COLOR_BLT appears to be
>> buggy
>> - * (it clears on only 14 bytes in each chunk of 16).
>> - * If clearing the main surface one can use the part of the main
>> surface
>> - * already cleared, but for clearing as part of copying non-
>> compressed
>> - * data out of system memory, we don't readily have a cleared part
>> of
>> - * VRAM to copy from, so create one to use for that case.
>> - */
>> -static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct
>> xe_vm *vm)
>> -{
>> -       struct xe_tile *tile = m->tile;
>> -       struct xe_device *xe = vm->xe;
>> -       size_t cleared_size;
>> -       u64 vram_addr;
>> -
>> -       if (!xe_device_has_flat_ccs(xe))
>> -               return 0;
>> -
>> -       cleared_size = xe_device_ccs_bytes(xe,
>> MAX_PREEMPTDISABLE_TRANSFER);
>> -       cleared_size = PAGE_ALIGN(cleared_size);
>> -       m->cleared_bo = xe_bo_create_pin_map(xe, tile, vm,
>> cleared_size,
>> -                                            ttm_bo_type_kernel,
>> -
>> XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>> -
>> XE_BO_CREATE_PINNED_BIT);
>> -       if (IS_ERR(m->cleared_bo))
>> -               return PTR_ERR(m->cleared_bo);
>> -
>> -       xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00,
>> cleared_size);
>> -       vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>> -       m->cleared_vram_ofs = xe_migrate_vram_ofs(xe, vram_addr);
>> -
>> -       return 0;
>> -}
>> -
>>   static int xe_migrate_prepare_vm(struct xe_tile *tile, struct
>> xe_migrate *m,
>>                                   struct xe_vm *vm)
>>   {
>> @@ -170,7 +135,6 @@ static int xe_migrate_prepare_vm(struct xe_tile
>> *tile, struct xe_migrate *m,
>>          u32 map_ofs, level, i;
>>          struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
>>          u64 entry;
>> -       int ret;
>>   
>>          /* Can't bump NUM_PT_SLOTS too high */
>>          BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
>> @@ -190,12 +154,6 @@ static int xe_migrate_prepare_vm(struct xe_tile
>> *tile, struct xe_migrate *m,
>>          if (IS_ERR(bo))
>>                  return PTR_ERR(bo);
>>   
>> -       ret = xe_migrate_create_cleared_bo(m, vm);
>> -       if (ret) {
>> -               xe_bo_put(bo);
>> -               return ret;
>> -       }
>> -
>>          entry = vm->pt_ops->pde_encode_bo(bo, bo->size -
>> XE_PAGE_SIZE, pat_index);
>>          xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>>   
>> @@ -262,6 +220,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
>> *tile, struct xe_migrate *m,
>>                            (i + 1) * 8, u64, entry);
>>          }
> A short comment that we set up a 1GiB NULL mapping at 255GiB offset.
Sure.
>
>>   
>> +       level = 2;
>> +       xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level + 255
>> * 8, u64,
>> +                 vm->pt_ops->pte_encode_addr(xe, 0, pat_index,
>> level, IS_DGFX(xe), 0)
>> +                 | XE_PTE_NULL);
>> +       m->cleared_mem_ofs = (255ULL << xe_pt_shift(level));
>> +
>
>
>>          /* Identity map the entire vram at 256GiB offset */
>>          if (IS_DGFX(xe)) {
>>                  u64 pos, ofs, flags;
>> @@ -616,7 +580,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate
>> *m,
>>                   * Otherwise if the bo doesn't have any CCS metadata
>> attached,
>>                   * we still need to clear it for security reasons.
>>                   */
>> -               u64 ccs_src_ofs =  src_is_vram ? src_ofs : m-
>>> cleared_vram_ofs;
>> +               u64 ccs_src_ofs =  src_is_vram ? src_ofs : m-
>>> cleared_mem_ofs;
>>   
>>                  emit_copy_ccs(gt, bb,
>>                                dst_ofs, true,
>> @@ -1005,7 +969,7 @@ struct dma_fence *xe_migrate_clear(struct
>> xe_migrate *m,
>>   
>>                  if (xe_device_has_flat_ccs(xe) && clear_vram) {
>>                          emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>> -                                     m->cleared_vram_ofs, false,
>> clear_L0);
>> +                                     m->cleared_mem_ofs, false,
>> clear_L0);
>>                          flush_flags = MI_FLUSH_DW_CCS;
>>                  }
>>   
