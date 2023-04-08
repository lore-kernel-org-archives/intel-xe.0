Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3DBC7619A
	for <intel-xe@archiver.kernel.org>; Sat,  8 Apr 2023 05:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4D110E0BC;
	Sat,  8 Apr 2023 05:19:13 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8E110E0BC
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Apr 2023 05:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680931152; x=1712467152;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7ahJnLbu+Y0g//bAnwqNtWc3IOrZdtjgwdec/tiVfdI=;
 b=KZVTxQT8PiBGqkGi6Z41au5lGroncmRwLk61WM1KKN7eQ36v9b2el3sW
 VT/d7pjaI2FrplEy+Q4OlXHA8uzqLzd9nLxa+scGq1isezo4zYQsQ9RPI
 3fyBERv7yHfMrq7X1b77+/zsQFp1vY65gEM+TvKlLwmL9gQn4R2KriF8v
 eZWm5q+8jtrSt382sV1PBIhVKxgNeuH5SsAh08CtIFv4ZYJiI/TCv+BCC
 CajsnJzXiZRaXzKbYBQK1SS+fOAl7SZryHcRSUAgsGRgYKMLO8vgTAjjj
 0j/qgsk5BnNkFgtnHyUm0XiJAdT9/jHoMQjixORNfydbYnUuLASo5fevi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="323485521"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="323485521"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 22:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="933792809"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="933792809"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 07 Apr 2023 22:19:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 22:19:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 22:19:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 22:19:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 22:19:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNpywMtl3Oim/bgw/S7kmaDQT0R3+etPeBR2+3//c07Q+UznEJnH5ScxhOdUE4h25nRHLgomATo4qhsh/CXxDJ68pX41CNkpjNtKpBKRYNC/5lnl9Ufao3e+BT8tpgfWmqnn/CEdvvrR5gzv/M/TIS0zhm1vHIDsPxDulJbakd1QVbuw3jtIWR4hDlErk+gXW+nF6PJiV1gGmI8p4SJi3i8g8pQ1P8J8Y7Fl5D0/gi1A+QOgY1MlUp9eyV+PDRvdz1tWA2hQir36HYy+Mq6V3WBR/H+IuU7mXhkpZp+u2z/A8O1l3e/pHeSbf5OjVQZs2HFkhdoAzixx+ldUc/Catg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K706bTCyOT2EYFDPxJC7WRxDkrA5Khw6sKdv4UXcgOs=;
 b=godnk3KsKZQzDCDaj0rZ1bpXsXvDuGpOmTFSAXQHt+eWihljFgiuxaEq4DOMDViaoZWLnhERD4351omhbUyUxXbRl48+giTnLVVUEWlv11A622no+GjFhlXLhhbSim8KHUdMe0yzuDN1gioqwLSoEuySUz1+NUnB47TxGIOb2DVWJSfi6QeKmYC45lJ9UeLn1ZqKra5wCfMnoPtPy+gm1pw5hVza8nDoTWTbySYijrjdG1swFkTaDXpLrjcis5GvyZ696Jrdamj2Om4VAt8aI7AlFvtrBEEf0tpGmy+P4wmMaZvWREWKB0Yi06hehUkHuUy3fv09zDmDIhIJugi7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL1PR11MB5352.namprd11.prod.outlook.com (2603:10b6:208:311::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Sat, 8 Apr
 2023 05:19:09 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%6]) with mapi id 15.20.6277.031; Sat, 8 Apr 2023
 05:19:09 +0000
Date: Fri, 7 Apr 2023 22:19:06 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZDD5SuerEjorH2PD@nvishwa1-DESK>
References: <20230407211231.10137-1-niranjana.vishwanathapura@intel.com>
 <20230407234558.GS4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230407234558.GS4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL1PR11MB5352:EE_
X-MS-Office365-Filtering-Correlation-Id: bf11a14e-78d9-4553-0da5-08db37f0c7da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ViPF69KOzNUdwR2CdE+tdl9xk9LrQB3ODgGJ91sWiQTf7lNomjJYtJd4ZGiTEL9bW0kEuvffXfAdNRfGMxLxkhrm+DGTpRKwygydiRgZyPvDCrMkxD5mok7DA22ebR+MiwgMOXUOKqrTsInFMEAZpC4Z8+ZB+hFxEqqIwXQZnLJSEbScQ9MtzgYYX0oh2sqyb330uQ4HLx6nmVufFM5GoWVBmGcNIWNFrJ7fjuQqzhmOxwYCfPJEIxNV/IyKHwtpvtDh02lC28PdDlxbkxrJMtHy81z7LmiPjJ5kSODzTHB05WeofKpDJ4B1vqGNeMB5pWkcjk7LPJ4sXuizGc/knSCiV3fJhawci9QrhupojEjJb5k53CD8MHdazJr/EG7WcwPpi/M8swotOHhHOcC7p2oCWcH7q8uCCenygAkgF16N3xT5MGEAPJngZOhvsYJ3oJ8c65nwJvZdI58CxuwcvAwmkCSMNzYp7ylXt863FZ/5Ht8tTxI+WUnORRaWi/2ZsZXW7FNiSgglGiZh4djRCI2d56GHTGicV5D41YbJS9hGA/sx+9dCcynYqC7f5tC7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(6486002)(66556008)(6636002)(4326008)(66946007)(478600001)(8676002)(66476007)(41300700001)(316002)(86362001)(83380400001)(9686003)(6512007)(26005)(6506007)(6666004)(8936002)(2906002)(5660300002)(44832011)(6862004)(33716001)(82960400001)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5+bO3wdPxtGhE6H0aX8kuIURMoZEflu4lWCwg7ABNtkXUHhU5d+CAHGUQJPJ?=
 =?us-ascii?Q?knETw6Ix6OTCgAsvPg6798gSwe/K2vbleGQ8egWFLdWuaOYoF8PflCSCj6lt?=
 =?us-ascii?Q?+BCVu+V48Xq9+rPQy2OBtz/emFvAdJn0pfHFgv5rYV8VRJeDeft/rxCu7ELH?=
 =?us-ascii?Q?2xGlzlYL3rizbqOcAplZbmfeL4Mktjn/fFUlWFJUlvprm+Na8jBo/UWZRJqr?=
 =?us-ascii?Q?01HKYA7MRy6Qk21QyqcPhU2iYy3E4VWDm80LBVi5zk2vyrA8DYb67zM1cITf?=
 =?us-ascii?Q?ypGrJB2qPgujSiIPdxNhgB6gLedftSY0IyMlucR74A7dZ844KkVDfQ9KBlcl?=
 =?us-ascii?Q?xC15btq7Hl21GV2r/rP+Je/+BC9AgSiAw9AeKbsKZwp4uf6XT77iZykzFkFV?=
 =?us-ascii?Q?PBKQvZISsPBVZzguOFfCxO5VJjJyqHwbKhH0RdvtlHUUlxKT/m7dksuu8dey?=
 =?us-ascii?Q?VCRPnl4w5TEHhccN4thhztsRVwyN2E5io8QbGFokUg6CLRBP5pRb0FKBSFvD?=
 =?us-ascii?Q?cHkDWJMlOjgh5Ygixq2pi5eyLmlqusxIpRw5LpZEsHKagfbDUVSdKC2wzpa7?=
 =?us-ascii?Q?sqFTjPj9q7TbfAYCKtHaX+cK1qrjNke/zHdCJCjmka9J8ZZcag6357GOJ3vq?=
 =?us-ascii?Q?vxPdEwXpUhNFkiVVFdkmo1QGtiJ7SCf+xfXjrkcROjCAVAPRQ+92KK+kWKcf?=
 =?us-ascii?Q?2xMWpzA9qmBmIK1zJMnYvCG0sP1EUdKg4hi/ensSNad/Pehk49Xg7rEwUZch?=
 =?us-ascii?Q?btitGop1nlkoCGYQiQLq2qGY5DP1fZWXVcgd24kPP/2yVIZqhXWQCPHC2hm5?=
 =?us-ascii?Q?4b1eAPRptNxgjU55GkAaMYDo4iTrtViRGkkr3Z0O9gxjtAag6WL05Zxlgc80?=
 =?us-ascii?Q?ENsN9mL+FzU+BRnpwlpMEnGVXevSbaaHmKjUf2+pXbVpSuCp0zTKldnBjuQG?=
 =?us-ascii?Q?6p27J5HCbAU1StVNhxwnxfZRCZT+Z+6GFBCU3Z4hJBjYVpZ66EZUizWDlaQ5?=
 =?us-ascii?Q?WZv+s8vevYIUZqJt3R9noWUoCGnU/tKwHUNsgkc0fFfcQq6tPpY/TiwVSIDg?=
 =?us-ascii?Q?X9x+9n8SeQn/ul1Jgoja9qz4MV3WqVvJBq2RVscSutRU7fUhips8OZb0d0/5?=
 =?us-ascii?Q?K7B6fbXg3OYhihMLmBGox4G/4/2VuzMh5zayrTX98mpNfX46KGf4J5pnVo0y?=
 =?us-ascii?Q?g6BVE+J8LglrKTT3b9+KN/j/dc3bBhIgNOWhyEKbKZHoANNqkwYGzfXBdAKw?=
 =?us-ascii?Q?9waem0F7ICAiUMWs2nZyggrXZw0Lle8hE1BHsa41cn7WHPlfoD1xBCHe1zkb?=
 =?us-ascii?Q?XCOaR93+hHG/HulTlitQPiMnRrjV+Th8YEfm3GmMdoxyxQ/fsXLkFg96gLXu?=
 =?us-ascii?Q?ZRowsc5CSXZ6znhAju4ml6X8GPFbGi/iB/RIs+jVGwbvtxS/m1v5IYQUzKzP?=
 =?us-ascii?Q?OfU1Hgsy2nePQYbc7sSMWoQFAtomOqSZfia02voeA15VvrUHbDXcXShiBx7w?=
 =?us-ascii?Q?7Hswc0u7Z/wunlJk6vFLWhVd9GF3HmcNxLnmQ1NMBTt1eIGiVp1tb3+/vGWw?=
 =?us-ascii?Q?FQVSnF4rw4U/V/odWGr0WAWG+ipZPjzT0lYP0uj2a3XGwCLklCXwZru0ukIg?=
 =?us-ascii?Q?MJhho24iAkdighWHTgRRSoM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf11a14e-78d9-4553-0da5-08db37f0c7da
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2023 05:19:08.9322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCzNTp6Mx1R5oIFXBBR9R0/9Tb9DSN5p3sMsnrgwH9+OkzafTwnoiJZUqbPWHiwDV1jEley+O+XPCjmVdbhy/UfZUi1DacW9NjdrcSzfdWDwlWqLoYDfdv7xNMc84mOR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5352
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix memory use after free
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 07, 2023 at 04:45:58PM -0700, Matt Roper wrote:
>On Fri, Apr 07, 2023 at 02:12:31PM -0700, Niranjana Vishwanathapura wrote:
>> The wait_event_timeout() on g2h_fence.wq which is declared on
>> stack can return before the wake_up() gets called, resulting in a
>> stack out of bound access when wake_up() accesses the g2h_fene.wq.
>>
>> Do not declare g2h_fence related wait_queue_head_t on stack.
>>
>> Fixes the below KASAN BUG and associated kernel crashes.
>>
>> BUG: KASAN: stack-out-of-bounds in do_raw_spin_lock+0x6f/0x1e0
>> Read of size 4 at addr ffff88826252f4ac by task kworker/u128:5/467
>>
>> CPU: 25 PID: 467 Comm: kworker/u128:5 Tainted: G  U 6.3.0-rc4-xe #1
>> Workqueue: events_unbound g2h_worker_func [xe]
>> Call Trace:
>>  <TASK>
>>  dump_stack_lvl+0x64/0xb0
>>  print_report+0xc2/0x600
>>  kasan_report+0x96/0xc0
>>  do_raw_spin_lock+0x6f/0x1e0
>>  _raw_spin_lock_irqsave+0x47/0x60
>>  __wake_up_common_lock+0xc0/0x150
>>  dequeue_one_g2h+0x20f/0x6a0 [xe]
>>  g2h_worker_func+0xa9/0x180 [xe]
>>  process_one_work+0x527/0x990
>>  worker_thread+0x2d1/0x640
>>  kthread+0x174/0x1b0
>>  ret_from_fork+0x29/0x50
>>  </TASK>
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Tested-by: Matt Roper <matthew.d.roper@intel.com>
>
>Seems to solve the occasional NULL derefs I was seeing on ~2.5% of my
>driver load attempts.
>

Thanks, applied.
Niranjana

>
>Matt
>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c       | 7 +++----
>>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 ++
>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 5e00b75d3ca2..9055ff133a7c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -23,7 +23,6 @@
>>
>>  /* Used when a CT send wants to block and / or receive data */
>>  struct g2h_fence {
>> -	wait_queue_head_t wq;
>>  	u32 *response_buffer;
>>  	u32 seqno;
>>  	u16 response_len;
>> @@ -142,6 +141,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>  	ct->fence_context = dma_fence_context_alloc(1);
>>  	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>>  	init_waitqueue_head(&ct->wq);
>> +	init_waitqueue_head(&ct->g2h_fence_wq);
>>
>>  	primelockdep(ct);
>>
>> @@ -484,7 +484,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>  			void *ptr;
>>
>>  			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
>> -			init_waitqueue_head(&g2h_fence->wq);
>>  			ptr = xa_store(&ct->fence_lookup,
>>  				       g2h_fence->seqno,
>>  				       g2h_fence, GFP_ATOMIC);
>> @@ -709,7 +708,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  		return ret;
>>  	}
>>
>> -	ret = wait_event_timeout(g2h_fence.wq, g2h_fence.done, HZ);
>> +	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>>  	if (!ret) {
>>  		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
>>  			g2h_fence.seqno, action[0]);
>> @@ -801,7 +800,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	g2h_fence->done = true;
>>  	smp_mb();
>>
>> -	wake_up(&g2h_fence->wq);
>> +	wake_up_all(&ct->g2h_fence_wq);
>>
>>  	return 0;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> index e0f9063e9b65..fd27dacf00c5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> @@ -74,6 +74,8 @@ struct xe_guc_ct {
>>  	struct xarray fence_lookup;
>>  	/** @wq: wait queue used for reliable CT sends and freeing G2H credits */
>>  	wait_queue_head_t wq;
>> +	/** @g2h_fence_wq: wait queue used for G2H fencing */
>> +	wait_queue_head_t g2h_fence_wq;
>>  #ifdef XE_GUC_CT_SELFTEST
>>  	/** @suppress_irq_handler: force flow control to sender */
>>  	bool suppress_irq_handler;
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
