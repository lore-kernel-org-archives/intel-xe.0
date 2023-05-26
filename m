Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1281DC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 03:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B466110E7A2;
	Fri, 26 May 2023 03:54:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A118410E7A2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 03:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685073274; x=1716609274;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HSlFauYQsabHHA+ReD1hkS+GYy/JKKLKD96ffFE+HXE=;
 b=a7STArWg8/0xC0VzwPKbiXD+lYJo/6T6Z9yK+QswDZeEEszYb22Lew9a
 fxqOojuOYoseovBp2yz6bSMafCImkAvMIrVsBPz6IT/X0Hv/PYzSpjV0G
 Y5RGt7aCBbZ6sb2OxHl3QNy0L6/FWiLGmyeFC4mvf+rvIBZyAc1NHOOBn
 HZNznf4lxr2BmHmeGrpIVTAIKlQBcDgk3fZMGwKEkc8W9O+fc7YgGzN5T
 PO58Vaa4kRFsnopT/r8R3m6KzfVsCd+uD4KcaynrT2M+wYAMep3fslaVx
 TP20+0P3OfaYiYJ7Y4LxceS6xHeIgHpiKfWRziK6KB80F0btEU0Y9hVCe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="351617849"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="351617849"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 20:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="794945460"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="794945460"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 25 May 2023 20:54:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 20:54:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 20:54:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 20:54:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 20:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmo/oDJ6S39VW0cyAuhaFawp4DhNJ1rRTt78RxOTd5sIVESBDsz/aTkQQXw8muAdIsfKCumF7htTdlZaAfcAVZTOQO8zI6gjXldlw6jueYyRWcLApfpSGxGfMIySRbg7U/IId1rWlxwWnIGKLK6BWRCh0yHmBZBsuiep9yaDMv/fuW0XcZmwJiTXUsAcjHvwxGbr1ap7wZ8C1XQDkM19LcZnOCrbMRuM5nav8LYc9sIpXoFRQAZ8uNnd9iGn9O56jgRbx9odC2TZRRNBEHxRQHLqhhCySJYdJD1kCYoWxqKUfs9YTjsRuIT9BRuhuLNaxIgqTdXbL2Q2wGjsqTU3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KKY3mzIBDc78/vmmS9Xzs50j7hYGODRYuk3STiBY5g=;
 b=M6xYmoZbipJDyuJSwy+0bC4zekWVYhM0/BB40Hc2pKAoEv5veq5QkWyIvq2FxvWWiVT4VcUK4EoAXUq8dCiCZXeTJKBvfEkja2h8FCvFDimrdReY+ATTZKRxitYSA9L4925nsTVppYahfbYYhE5N0DyXiUG/ULtNfhDLkMZL6tuD9pvhGQbETDnhnZ6/MCc0H0drXE99zNcUBdVa58qWqu/MHSOx8+GOHBqVt1Mzq6YQNIi0Iqaph9rRZo9n4nV+pQsMOF3ZYlf/rhHaqsMzan9O+4s1LImMouCOzlomMHifUJN8d+gSrr3DFI3uCK1J+cnTSItLgNxggCorkMR8Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by PH7PR11MB6607.namprd11.prod.outlook.com (2603:10b6:510:1b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Fri, 26 May
 2023 03:54:30 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e18d:e05c:ca23:100]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e18d:e05c:ca23:100%3]) with mapi id 15.20.6411.025; Fri, 26 May 2023
 03:54:29 +0000
Message-ID: <cb5c50af-d8d2-2790-e39d-e1f706b3bce6@intel.com>
Date: Fri, 26 May 2023 09:24:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230524192635.673293-1-matthew.d.roper@intel.com>
 <f6192c01-5aa0-632a-5833-d4cccab949cf@intel.com>
 <20230525150051.GS10045@mdroper-desk1.amr.corp.intel.com>
From: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>
In-Reply-To: <20230525150051.GS10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::23) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2909:EE_|PH7PR11MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 950cef8a-fcb7-44af-b382-08db5d9ce6c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDMhLIY1yWv0G9/sXtcku6qVWt9qWCizGGYWYxY1TiDcTx8+Ayt0no2ynzIMJmzElmSx4XDgTWiaqFlJaMxAtyBr4kR+tDGVuyf7a5iNWOlKtVcdA0E4fucZ10sQ0J4AzM3mYwN2gUxB6juMQaju/AdmOsMiZlC7DQHgNvAHOx1hIviJM39ct7j4A/QULV27uGvz2TwXifAvIvLZf4xPJflp8z+AyCtt5q9aztbY7SJAXKyhOwmUg9sHEoHGPYXFT3K4nT6zKJzu57owG8htFFZaKgAsNcRS3fUMvB9es6vLUwTwnPjNFszOM9110a1cnkZpYR/KLWi8O+ee2xdJfZCb5i/pxOPnuHlaWr72y3Qkm+ysOvK/d5KsAz4zWZotezYV43BowNLveQoUh7pQo5CUIGATtH3U+kDtmLNvvsQYgmMi7rsponlJ5iRux0TRhuwaZvQIdW4mND9FUIG9U4cAz7hviNiUMEGnk+bLKfoTSc944ueVMaWvfqzlZ6OVEmRbil4Bfg7TwkfulN0fFRQjNuWN8dax1cuXGmDOk+s2Qn0XgS+xc5slOPaAaJrjsTCWLsLBSTeT8s4rCnYSNXcOFOWXyfwlv739/jGzmNqpbNTi1oJFQNadENbpGHblbdCyJFo2i4Cid979hEtNZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199021)(2616005)(6636002)(4326008)(5660300002)(82960400001)(8936002)(36756003)(31696002)(6862004)(86362001)(38100700002)(2906002)(83380400001)(8676002)(316002)(41300700001)(37006003)(6666004)(478600001)(6506007)(31686004)(6486002)(186003)(66946007)(66476007)(66556008)(53546011)(6512007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ci9ZSVM2YUZSbjZFL051SGxHU1VGYlBYNkRIU0tGTUZicW8xVEFYSVpoYjli?=
 =?utf-8?B?M1J6Q0xsN3lpT08yTTI3clpjK0ZTTWNHc3hTUWVVSmowQW84KzluazgxWnJw?=
 =?utf-8?B?QUdPVTh2OHI4N0g2Q2huMUUxRFFqb3J4MjlrNjhFOGVVeko2ZDRLeEFCcVRE?=
 =?utf-8?B?di9xOSszVk8rdDJndFh5cUhpeUhScytvWTRvQU1aY05Vck44ZDNFMnpFVnJD?=
 =?utf-8?B?MUZKT0hZN0ljeUw3WC9EaVJIK09vUWVuSmhRMmVSdTlFNFVRYys4Mk05ZGpJ?=
 =?utf-8?B?cTNmTm9Ub2UyaWNlMUR6eHVqLzUwUS9ocUF6VDMvNXNUNHdZMEVyWUdHb2ls?=
 =?utf-8?B?eFI1SnYzTk5wUnZ3bkxXTE15bERWVXh0ZjN5bzRpNTN5N2lJTFFuSjhYMnNl?=
 =?utf-8?B?VVVYb1VzSGdVbUVEdUhDM2MreHR6bTNYTU5HSVJmaXFDeTNJck5KM0VQV1ZL?=
 =?utf-8?B?ZkN0UWIwN3VzV2EySW9KdVZFNnVFQnVNQTV2aTlHakFidU10MTFTUzBCd1gy?=
 =?utf-8?B?YTBEN1g0emJyeXo3NWZVNnVkYUZGbkg2M0V6ZGY4VDI2QzZEcEIrdVlqNDFD?=
 =?utf-8?B?MEJpSGl4TVRlOE9Kbi9vbWNvTExQcW14SVRPdHpTMlFZN1hDVFZmZkRLWHN6?=
 =?utf-8?B?N0IrSU9qYWRVaFd1TnFHOTdaK2c3MmJXOXJ6UWtNV05VOUJBWXNTekc3NE53?=
 =?utf-8?B?UmRJcUg4R3d5c3E5QXh5YkhKVXMrRGdxeUdhRzFIOEdMWW9Ra0k1d2U5Skk3?=
 =?utf-8?B?YVVBcVo5bXo5UFNOOUpmWFhxdzVIYkoyZ3dMbWl0ZTlVTHE0SGV1L05oMkRs?=
 =?utf-8?B?VzQ5czlTUzJhT2xZUzFuYWdJUlZva3J6VjlGcy9WWkQ4WUVYTGxnd1ZBbWsx?=
 =?utf-8?B?amxxWDYxRFprTml3ZllueGdnYVFBbmtIUDJXZGpwV1p2QUh6ZVdibFo4Z0Fq?=
 =?utf-8?B?eTR2UkpKcXI5WVgyZmE5RXBuRXdJRll3alRJakQxZmtSZmFqSTM4MGF6M0Rx?=
 =?utf-8?B?YzA2WXdtMHgzcndxcGFJOUdVY2N3UHNrdDU1OTd1Ti81TnhjT2VqZVJDTUZl?=
 =?utf-8?B?ZFpxb3QyaGJOZVViQnd1bUl0K2hiTHZ4M1g1RkRWN1ZIb1o2S2Yva2N2SmMy?=
 =?utf-8?B?ZnFSTWlpM2RKeUM3V2lIS3o3MFJsRHZSREhiRXQyQVhsbEZoZ1Y2ZkkrU0xI?=
 =?utf-8?B?UnlHdzZvUEh5QjVpQVd3Wk9hUVVCekNDd2tMbWt1TWdBTkdHZzc2ZWllYTc5?=
 =?utf-8?B?MmhwY1ZTSXlMcG9hNmFGYUNhSFVqQ0tSZk1MMDRlZVdHTCtnZ1N6MStkelpK?=
 =?utf-8?B?SVhKR3o5anh1L3JRcWpLUXJyYVc4ZFdmc1RTd2x3YlNVa25pQWlta1NiNWgy?=
 =?utf-8?B?d2JHbndIbG1nd3QzY2h0NDhHekVhQjYvSGQ3N0pkUGJkR0M2emxJS2dwMGs1?=
 =?utf-8?B?SThoT1d4cGdhZnJ6SHd4NERKRzEwaEFpaVRTOXdzUTB0YWRRcUJ6eCtoMnhn?=
 =?utf-8?B?a2dmMHlOQTRpN0NWTTJBTTlHaHM1bGorZkw1c1k1QUVodERCT2NiRlRXY3Fv?=
 =?utf-8?B?em5vb0Q0M3M4RWUzUmFQOGFSYXBHL0ZLeHIzZUFKWjZ3dFVRcjd2bFJhM0lh?=
 =?utf-8?B?ZzJUSHJUN3I0RlVEYlRvcStRK1dDdnFCUnd6MEI0UkFIT3VEL2ZFRDlKaGUw?=
 =?utf-8?B?bU5xcmJMcUE5dkRqQTFNeXIyWmdBa3pwTUJ6c2RhaDBwVE1LYjk5RW92cHNB?=
 =?utf-8?B?ZkVKZ2luTEhzdGRSZ2haYVFSVGNVWjQxN09NbXpxTWhWa0dwSEdhdVRQcUZa?=
 =?utf-8?B?RXBjZ2pTbGVELzF6M2dhVGhjVkMwOTBpYWswRnE5NjRLVEZGQ0JJR1pIak1W?=
 =?utf-8?B?ZGc0V2NNQVBwSVNQYmNISHpKVXpYc2piZEpSdmhlNUJibmcvRnd2ZmFycjFk?=
 =?utf-8?B?TjljWE5XWFlUbWJnc2lZMjQ1bzkvMXk5U3ROcjE2KzB4SDdMZXltOVpNMjly?=
 =?utf-8?B?Y0t0STJWUFQwSldMN0ZLUVAxdnZEdXdOSG1YaUtrTWlTMFNuRU01MVVqc1V5?=
 =?utf-8?B?d2FMMnU1WTRiNGpoci96S2xnOEUvdUVHazdQZWFVbDU0ZnBTNy8vWnQ2QWVT?=
 =?utf-8?B?dmFEUXd6ZWR0eTNGN05JMXl4aWxUWjhhcTdYajBsVkpqcFpCYTltNmFZUG8v?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 950cef8a-fcb7-44af-b382-08db5d9ce6c5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 03:54:29.4510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cj3fApMtoCWPdbOuSaYj5002spr8qxmkFV+8wySM5BD84ogK9dotIWl0KtsXA58RZTfC8/y9UhRG+L67L5Nqnecjh9TaQ4HzXpS4rqyBn+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6607
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pvc: Don't try to invalidate AuxCCS
 TLB
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


On 5/25/2023 8:30 PM, Matt Roper wrote:
> On Thu, May 25, 2023 at 06:46:03PM +0530, Kalvala, Haridhar wrote:
>> On 5/25/2023 12:56 AM, Matt Roper wrote:
>>> Generally !has_flatccs implies that a platform has AuxCCS compression
>>> and thus needs to invalidate the AuxCCS TLB.  However PVC is a special
>>> case because it has no compression of either type (FlatCCS or AuxCCS)
>>> so we should avoid writing to non-existent AuxCCS registers.
>> Hi Matt,
>>
>> Looks good to me.
>>
>> Just a query, if their is no compression support, do we need to remove flag
>>
>> ".has_flat_ccs" from PVC description structure.
> You mean from graphics_xehpc?  That already indicates that flat_ccs is
> disabled:
>
>          .has_flat_ccs = 0,
>
> which is correct.  The change here is just to make sure that the driver
> doesn't assume that lack of flatccs implies that we have auxccs instead
> (on PVC we have neither flatccs nor auxccs).
>
>
> Matt
>
>> Regards,
>>
>> Haridhar Kalvala
Reviewed-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_ring_ops.c | 16 ++++++++++++++--
>>>    1 file changed, 14 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> index 74c1b5dfbaee..d2fa0b4c8bcc 100644
>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> @@ -190,6 +190,18 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
>>>    	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
>>>    }
>>> +static bool has_aux_ccs(struct xe_device *xe)
>>> +{
>>> +	/*
>>> +	 * PVC is a special case that has no compression of either type
>>> +	 * (FlatCCS or AuxCCS).
>>> +	 */
>>> +	if (xe->info.platform == XE_PVC)
>>> +		return false;
>>> +
>>> +	return !xe->info.has_flat_ccs;
>>> +}
>>> +
>>>    static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>>>    				   u64 batch_addr, u32 seqno)
>>>    {
>>> @@ -202,7 +214,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>>>    	dw[i++] = preparser_disable(true);
>>>    	/* hsdes: 1809175790 */
>>> -	if (!xe->info.has_flat_ccs) {
>>> +	if (has_aux_ccs(xe)) {
>>>    		if (decode)
>>>    			i = emit_aux_table_inv(gt, VD0_AUX_NV, dw, i);
>>>    		else
>>> @@ -248,7 +260,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>>    	i = emit_pipe_invalidate(mask_flags, dw, i);
>>>    	/* hsdes: 1809175790 */
>>> -	if (!xe->info.has_flat_ccs)
>>> +	if (has_aux_ccs(xe))
>>>    		i = emit_aux_table_inv(gt, GFX_CCS_AUX_NV, dw, i);
>>>    	dw[i++] = preparser_disable(false);
>> -- 
>> Regards,
>> Haridhar Kalvala
>>
-- 
Regards,
Haridhar Kalvala

