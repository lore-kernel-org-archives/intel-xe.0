Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59753CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 07:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDFD10E389;
	Wed, 18 Oct 2023 07:49:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AFB10E389
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 07:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697615368; x=1729151368;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0+4LiNk2AxTKw1mG6gEQzqLyKgI1NPW7MY3c7dyxE0Y=;
 b=KKbtuvx+fiT8YKxyH2csrx3YU2/+eFQJcNy5XYgDvr/Faksr1joHDZIj
 W+eHgfFJGUd91TkCbF7UIe0t0s8Y7zoJEoMypyUlXJZj6hUeK6En+fJ4t
 UZwdBf3CfiVMoRSgAz664uoRxdv+Ob4AumyAAiYVM7dGxgE6Xsp1J7H7A
 0qldn7LJvx66UAy6rPaPOP8SaHmaXS+l229Zl0UUSGzy65ScCG07csAlm
 2kjY3385u3/7CPAoAT15iQbKOfGw/SbhDtE3cv/5A+4xj9+Y9tMSfl9jj
 woPq9ZnIwLrtVgSNwkJOH9goG59Lxqq7dIJmCk2tWCMTpot8j5vJK2T3L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389836304"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="389836304"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 00:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="900233367"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="900233367"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 00:47:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 00:49:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 00:49:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 00:49:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJS0jppKcmzFR1KMQf8+8eBuhtkgbWe2QiRnQnP7tOhtOeWy+ZePQZCf/nosuFkvWjKlNyji9dB97RvsJKkv5QTrarrKvdgfKlDc7BKCFNUJ2gNigSeZ9ytudcacuUJqFo1EZQU6TYENEONmX1JfbOh5sdbGMRQ/IWskEvwTI1R8di2xS4lLryoQqNClJnAmC8nnQLJvfQJu0riagMZOUQ2OXj6H8/J2b5Z0IumoBP9QnYJmwiZo84Zsl70YVGEDulpO4KVfOVtUChk750DkTCwbB2uKCu7zQQenZsv9uqQ8jJmM6gpGpxh+kqjCR3NoUWjj6ZrAFer+tuHZNg9+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV7bXT2fez1hFLsZ1dP46RQK3aHNsnqWLSYY8YFPZL4=;
 b=cZSTHnO8bbO9mdV7SG6mObjo+KUWvhxDYuIWwNrks8HDK9BF93qWRfLF3c6F7HUfgiDvKcd0bL7kVQITnEpnfTAdZd7QRwtmzlTgETY40lXs4K6c1i/AvU+6GXRPwsPiJz41Jb490oIx3N2Ru9mAKYwK9CVbtaUv4+743wWFOUTEeoxYYiSJjGWnWCLmfEaLu7RYE+FZZIk9RN9w+4qIAzJDfscWyOBD0eP7+0y+mxU+y7aVhxz7srKsAin9jBs8IXUh9GP2lglqU6bjG0RX5riqYkY2mtjZ4+yIfeeHB5GeReP835BjyqqQ3qWRdm5w6GN+qd56/+8CGzrK2I4EPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2907.namprd11.prod.outlook.com (2603:10b6:5:64::33) by
 PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 07:49:22 +0000
Received: from DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::78a2:79ea:ed42:df1]) by DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::78a2:79ea:ed42:df1%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 07:49:22 +0000
Message-ID: <20fd16ee-c8cb-49aa-c223-2b511d158827@intel.com>
Date: Wed, 18 Oct 2023 13:19:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
References: <20231016101720.1657746-1-balasubramani.vivekanandan@intel.com>
 <20231016101720.1657746-2-balasubramani.vivekanandan@intel.com>
From: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>
In-Reply-To: <20231016101720.1657746-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::9) To DM6PR11MB2907.namprd11.prod.outlook.com
 (2603:10b6:5:64::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2907:EE_|PH7PR11MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad87d64-cd97-4b0b-b43a-08dbcfaebdc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DTdlstecX/Ih4vc5Vk3MuP2tDykHF7uDY4eue/Wu0F5ObfWhJSfQ+fnG6JsEFZmVpx8WEqzMvqRAyAOjg2cJzjOmd3k7wS/nTzWa3O4ks14MQ5IthSE5c1i42PmG5AtKLYALYDEQfG29HIsSBioXdUoJP7uNaGOpd1pD/eidfcl/bcBN6qwpP+nlhcDesDP6W2c0ea7MmCGCUU16gVJiLmKm95EsZXtxIxPSqApmJrZV6IKAmcBWAKvzWJ+GEJf+grhKUI4Ysi4eq43FqisM0fa8kVq5MEt35uPP+mSaPa7bmBNi2XjQ8V2bmL04hxCZh+X/3sK59HFJr7FtlmTPZSpQfvhsh5QAZ3xeMMlYR2I2yXFeKWhnrHcWx/+0W/7sXDIspdnUaqarQWedULkVxqgdp/WH01AZejOk4hYN41YFGyGD8gfMSaiW91Qlqt27Hv1mzYoUVneJIMIBjOlIP6qt/FzH0L4vX9pA0fRAJPuKOuluQ7dWboz/CECzAaciy/dBwwGTaM/EROmXfJDhyCqutYQb018Wg19SCapujhh07dyWOVa539OOB0FVVmJEf04ARvvM1xzq3MMx4eCSTU8jFw/vv8zZFgwetPHz0BuhWX7w26v77hf7yJq7CBeMa+2QTQseYA4UPF6cRMWrlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6512007)(26005)(53546011)(31686004)(6506007)(83380400001)(2616005)(6666004)(6486002)(36756003)(8936002)(8676002)(41300700001)(5660300002)(316002)(86362001)(2906002)(4326008)(31696002)(82960400001)(6862004)(38100700002)(478600001)(66476007)(66946007)(6636002)(66556008)(37006003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmhUdTJBbXVvUVJqSGZxNjIrZDNJcFJDS1VXL09oK2VycWQzdW1MdklnWlpW?=
 =?utf-8?B?OGdoa1F1VjdmOC8vTkVpbHp2MUt2aXVZelZZaGtnZ3duMW5yRGhEcWlrL1Vq?=
 =?utf-8?B?YWNEdkJ6NkVBaHE4ZzBNbmNzTzVSTkFxME9hUkU2SXFxcyttRU1NUE10b2du?=
 =?utf-8?B?NVYzR2xobEZDY0hWMFdTdmZsS1h0dW5JbDJEZEc1OUdvay9sN3lOQlZQL1V2?=
 =?utf-8?B?MzNqblkvYUdkcEU5NFJqZkhVZUNyWngvWFpCVUw3TUVFcDhzZVV3WFdTcmxv?=
 =?utf-8?B?TExHL0FaYkpYZlYyTEViZnc2TlhYMGpWVmZCRW5VZFJmMUVlSmszczBOUFR1?=
 =?utf-8?B?c1VNbXc3bSsvbHphVDMwalFnTXdCUUt3UDNVOS9nTWo1NHNjUkpDcGdSYlQ1?=
 =?utf-8?B?VnB4L0NBRWpKV1U2dzRXRUhmWDRBSWNOeHhidXB0Ui9zeFdYSGhiRVRXa0kw?=
 =?utf-8?B?cnV0RlYyNy9ZU3JVRWJ4OWU4RW9TeUxTRm9yL01veDc4U2Y1MkJSZ0JDeEgy?=
 =?utf-8?B?akJrNnRGNWs4Q1FuanVwY0ZIL29zbmlvMW9SNmJteXJsbmVYU0wxbCtONUls?=
 =?utf-8?B?VDZiNjNHM0czN1VvczFDcVJHNHRUVmVEYW01WFpKaE9QTnEvcmFaa3dDMCtV?=
 =?utf-8?B?Z0VYQ05kUDNEZnl0MGhZc1RQT0tZaTFKR25LVHNvS0JOelc4SFR5Yi9lbXRL?=
 =?utf-8?B?YUxFa0ZzQ1J3M0dBd2hCSk94V1RQTldpQUR5QUZiRUJ0QUtxc0M3WlVMS2Vo?=
 =?utf-8?B?SVhLN1hVWXhRRUhiSVgwOGV3MkpITjhGa2tUcXVlTTVYR3JSSytjbWFCak82?=
 =?utf-8?B?MDBZWWFKeE1EY3EvbXRibHBQZUN3cHNEd3ovYTRxOURvVmg3em1CS3c2REdK?=
 =?utf-8?B?MmdMS2pqQWs0MHRjWFp5Q1RhWE51YkNhOUUxcFNDQkt3SG5uQmJFUkN0M0c3?=
 =?utf-8?B?YlR5Zk51aVBVR0pyUkNWZ0FDN0pPaUdyZGdIME11bGN6VkdHaGhrcFR0TktP?=
 =?utf-8?B?azRlMGZDVlNwMUxIZWpJaEQ0cDQzWnlBZU5XQWFFUEh6ZTlZTzNBRkZBdDN2?=
 =?utf-8?B?UUFFRUJ4cVZycnJpb2MzYmhqTW95UjZnaGUyV0RyTlZCZWJZQys3WmNmY3J0?=
 =?utf-8?B?ZDlZT1Z0Mm9oUStydGVBTm91TTV0c0E3Q2NqaTdJcEJQSVpOTlk5YVMvTlFo?=
 =?utf-8?B?dDNGMzIraEJFcTJoV0NxWFJ5a0VvNkRxQmNKQVRsZkhCbnlES3dzWXlTRmdF?=
 =?utf-8?B?cjV1RkpwUHNCcGNET3Njd3AvVS8yRFU5dE8rM29ITzNiemJlV3hEL1lmWWUr?=
 =?utf-8?B?R0RYQnhrMGw2L1kzdktzbUIySUV6SjdKby9rRWZaQlU4YWRQdmxYb3VSRHdn?=
 =?utf-8?B?R1U0YU9NN0E4K2FXSDBQVmFRRldBM2xsaWgzZFQ5bWNkQnFCTnQ1R1k3cG0x?=
 =?utf-8?B?cElSdTRhM2x3Z1YwUUpmUzVwVUNKOXdGM3B1MU5OOXhadHVqaFo1TldwNXNs?=
 =?utf-8?B?Z3hUZTBseWpRYjBRZVdSdG8zbHo0emM5eVFETGNsanZmaHZUVW5WcWUvbDZt?=
 =?utf-8?B?Zk5ndDRrcUZ1Ull4cnFKWVMwampybTlSVFhxUWRpT1U1MzdpTEZTQm00elJG?=
 =?utf-8?B?T3MwVFo1NTJuOUlnS2pid3dOdU9NK1lJY2RvMVRSMWNERERQZW1lNE9WaGVG?=
 =?utf-8?B?cGJJeTFvdmVaNGpWODVFekRzM2k3cHBMYlVZZW9IeDZnY0t5S0xyYTd5RUNh?=
 =?utf-8?B?ZVkvUlFGcVV1WUcyZHpUaUhOelhVakpjWndicThYU29Peitxd1IyYy94Vm1H?=
 =?utf-8?B?amcvQmIrK1hGUVQ5ekNMRDJNVFk0WHBnTEc0a3hWc3laeUF1TU50Y084Mk4r?=
 =?utf-8?B?Z2QzZDZGYndJaDZydGVVMHY0Y3BJZ0tzWXprbDdPaXVLVEY4blVCZTFkK1Y1?=
 =?utf-8?B?cVgwd3FYWnQwMVNZSWdaeTM2VjVLT2ttQmhYTHkzcTI4aDRwV0loR3cwRVFC?=
 =?utf-8?B?dWwwOWszVDMrQ24yK0dDNTNVU1BUdFVCSUxueHJQUUVLVmxYdUZ4Wlc1cDhS?=
 =?utf-8?B?UEQ0WVlkSHFDQ3Z0elhnaVM1NlNPeEF6NWV6NE04QVFJdExuK3MxTFdwcXNx?=
 =?utf-8?B?UXhGbFEyQXczc1Q1UHpKNThIUUFNbEJlS2ZWNXZnTHlsVmxya1JKbXBLclEr?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad87d64-cd97-4b0b-b43a-08dbcfaebdc7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:49:22.1833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZwZpjm3VCTQGzH2tgj11XYbec8ZaN+Ec4eMGa2q+Qm5m8gevpsIXVz2JFo8nOehbQtfpzpNeCU7Sv27mEc0bIIDG6HIySUtokpk3B+m1Gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add event tracing for CTB
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


On 10/16/2023 3:47 PM, Balasubramani Vivekanandan wrote:
> Event tracing enabled for CTB submissions.
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 13 ++++++++--
>   drivers/gpu/drm/xe/xe_trace.h  | 43 ++++++++++++++++++++++++++++++++++
>   2 files changed, 54 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 8b686c8b3339..a84e111bb36a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -460,7 +460,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	/* Write H2G ensuring visable before descriptor update */
>   	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
>   	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
> -	xe_device_wmb(ct_to_xe(ct));
> +	xe_device_wmb(xe);
Hi Bala, I think its better to describe this change in commit message 
(ct_to_xe(ct)  -> xe).
>   
>   	/* Update local copies */
>   	h2g->info.tail = (tail + full_len) % h2g->info.size;
> @@ -469,6 +469,9 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	/* Update descriptor */
>   	desc_write(xe, h2g, tail, h2g->info.tail);
>   
> +	trace_xe_guc_ctb_h2g(ct_to_gt(ct)->info.id, *(action - 1), full_len,
> +			     desc_read(xe, h2g, head), h2g->info.tail);
> +
>   	return 0;
>   }
>   
> @@ -934,6 +937,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   	struct guc_ctb *g2h = &ct->ctbs.g2h;
>   	u32 tail, head, len;
>   	s32 avail;
> +	u32 action;
>   
>   	lockdep_assert_held(&ct->fast_lock);
>   
> @@ -984,11 +988,13 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   				   avail * sizeof(u32));
>   	}
>   
> +	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
> +
>   	if (fast_path) {
>   		if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
>   			return 0;
>   
> -		switch (FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1])) {
action can be assigned here instead before condition to return.
> +		switch (action) {
>   		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
>   		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
>   			break;	/* Process these in fast-path */
> @@ -1001,6 +1007,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   	g2h->info.head = (head + avail) % g2h->info.size;
>   	desc_write(xe, g2h, head, g2h->info.head);
>   
> +	trace_xe_guc_ctb_g2h(ct_to_gt(ct)->info.id, action, len,
> +			     g2h->info.head, tail);
> +
>   	return len;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index e32f1cad51d9..456c776f4be1 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -520,6 +520,7 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
>   TRACE_EVENT(xe_guc_ct_h2g_flow_control,
>   	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
>   	    TP_ARGS(_head, _tail, size, space, len),
> +/* GUC */
>   
>   	    TP_STRUCT__entry(
>   		     __field(u32, _head)
> @@ -567,6 +568,48 @@ TRACE_EVENT(xe_guc_ct_g2h_flow_control,
>   		      __entry->space, __entry->len)
>   );
>   
> +DECLARE_EVENT_CLASS(xe_guc_ctb,
> +		    TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
> +		    TP_ARGS(gt_id, action, len, _head, tail),
> +
> +		    TP_STRUCT__entry(
> +				__field(u8, gt_id)
> +				__field(u32, action)
> +				__field(u32, len)
> +				__field(u32, tail)
> +				__field(u32, _head)
> +		    ),
> +
> +		    TP_fast_assign(
> +			    __entry->gt_id = gt_id;
> +			    __entry->action = action;
> +			    __entry->len = len;
> +			    __entry->tail = tail;
> +			    __entry->_head = _head;
> +		    ),
> +
> +		    TP_printk("gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
> +			      __entry->gt_id, __entry->action, __entry->len,
> +			      __entry->tail, __entry->_head)
> +);
> +
> +DEFINE_EVENT(xe_guc_ctb, xe_guc_ctb_h2g,
> +	     TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
> +	     TP_ARGS(gt_id, action, len, _head, tail)
> +);
> +
> +DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
> +		   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
> +		   TP_ARGS(gt_id, action, len, _head, tail),
> +
> +		   TP_printk("gt%d: G2H CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
> +			     __entry->gt_id, __entry->action, __entry->len,
> +			     __entry->tail, __entry->_head)
> +
> +);
> +
> +/* GuC */
I think this comment not required at end.
> +
>   #endif
>   
>   /* This part must be outside protection */

-- 
Regards,
Haridhar Kalvala

