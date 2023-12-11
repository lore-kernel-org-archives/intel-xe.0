Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F499C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 10:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3938210E3DA;
	Mon, 11 Dec 2023 10:14:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CDA10E3B3
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702289689; x=1733825689;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kcWiHA14OBLGmma4FSYboTZxB5cEDJl7deOt/NsZUCA=;
 b=Oh7S+tQmmRPbBbOl+NCAYY8SlTpfz1YMO/4mGdEpp3n1lyRx0Rv2UG1H
 YeOjEfRkRUb1uGLSQbDzJh1NNAbVnAWF49FjsScyxXmUONsaURP4KPTV5
 drKVPk/UBv4C4zKv8CRjHlHG+1kwjFbiG940pHyH3zIvVo48tIy2NJM46
 YMkSjZw68SbDOkibjaVjkYY1rjcXoEQ09X409U4uAvZlZtPVhAyXii2lM
 V0EyyHAlay1ykLG5cf1Sw/w8Kdtw6rG2Ox8djOzFzFiN93RAy0fG2wx2C
 Ryahh4jfHqj6vv7FXC2ias451wZzRz4gTvDr+lo9/J3dKCwuWoqM7Lewg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="391791835"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="391791835"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 02:14:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843454151"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="843454151"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 02:14:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 02:14:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 02:14:48 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 02:14:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 02:14:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXkLd0oJJPYAMbjLRngGy+s1usD3lL1nUHlvHCBYtpxGw1Pe/V8roEhn123VTzo0AHgNRctAz9LZi+D9YgTdHaIbojS2ydb+VqbL7VccxYEyzXDJ1ZtwzJCyPl310qlRwDrraNgOgPz6DBCzTXabHo88kQYKVCBdGtbMq5EM94LIjqpyStDK3c91eTlOztGKtDI/8dXGeD92dawxUHsrtbHKK5QRNso4jZ8EcyE+p62zV06PvnMPCI6khFC7a1hggsiDgaMQgJVxy0a4atXKledDmZZbHszU0lIT/N4gApTJVtDx4d0FZoHv0e8l5piKqUUwdRcsUrgybEzsYlltFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPhYIWDxV7vKgsVyzCvDf2qAsrCdhz0hjEaHHwPbdeM=;
 b=KKrgHdlyccdh23ROZEjCPLJv7yR3gX6CNCb2s6JQR45NHioTBRDoWZxvR/v1ezWdgrzwXWNsbEQmtTcbLepEeVe98Hdv/ymo41JatLKRF2riD8yBVVN5gr0aRnbPCqgJ4eWK54/2VFUAVXlqlB6dDMDBCbxkUjxAuc8kllXkw9F7kWazwj8rBsktJC5qm3VgGUDzIt+Jbv41XuSSRxOpmzBnC7VnuEag/V7YUvf5f3f7BFr/KIasKE0iEBQ1bsPadofUAZlpGe2s6y8ftvgv7/grEBJt+Unz4QHZZr58Eqpe1rChcR6jiIla4BSqK5ezihPgA/WgnTp/c4auzI7DmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CO6PR11MB5652.namprd11.prod.outlook.com (2603:10b6:5:35e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.33; Mon, 11 Dec 2023 10:14:45 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 10:14:45 +0000
Message-ID: <16f7e629-98da-456c-9506-27448c8246fe@intel.com>
Date: Mon, 11 Dec 2023 15:44:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 1/2] drm/xe: Add a new memory directory under tile
To: Riana Tauro <riana.tauro@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231207151739.1241374-2-sujaritha.sundaresan@intel.com>
 <SJ1PR11MB6204399019B23285D88A04B1818AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <692a9b93-dfba-43b9-a838-9e4cd20fa093@intel.com>
 <cb403e6c-cca5-4495-b1d1-57b38fffdaab@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <cb403e6c-cca5-4495-b1d1-57b38fffdaab@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::20) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|CO6PR11MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: c03df107-7535-494e-4968-08dbfa31ff1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5O/y2DxKZAJJVcDurYJIxwHyYg3D53rcYYFcHQ8Et8VEwlOMof/Os7X7KMQpwH3IPrbVdzpGqo1PdMy7N5ievHDC9TfQCgslC+tTyv+Y5H+0Q2pSRitM1uaGyHLsJLuOkyTnSFLoIUXIoeHXitfjP1horJYvnU8rFGq7J+ofH30XsClyFOTc5S7S7+mNB4BHGq8mpor+9JEBBTj8GO5a2LX0brQvkM2jb3qT8QQAD8yHI7+Z7uRXrXyCKdDF9649M1kT/GmHMWmQ/FeLp9qZw9tbFEF50GnTWnGEG9Mhav4Ko+9kFI9PV8BjdA+SlCUwKJVL5VXMcFP8fpuc4Gf2M8MfGEMtOQHktUQrFRjYyZSGKndpl1Njto38sGfGYz53MFpZ8rWQkFL6Y10dA4/KTLN1QYSI4gxf8DkaNMXrslhLdJ2o2ETewkz9PVbnlb38sK9Vnjue7FZ5yPdUkbeNIIuGTRF241Tj6JYGDGiid+K49SOHnAiQAYKVF1m6jQzqtAqKc4Y2vN2JYXzOS8EGH1i7ku63v/qR9Xz7YtqyMVAafRz2daDyqDKROXcjSmVJJ0zs/4NXrgTETpiqUANFzYQmen/f/Wut+KIzGqJ/W5YlHn3sdCLNmuYLlccoTEDh7otlAEPKPDlFb+riDo53rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(366004)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(36756003)(53546011)(6506007)(478600001)(2906002)(6666004)(83380400001)(26005)(6512007)(2616005)(107886003)(6486002)(4326008)(8936002)(8676002)(5660300002)(110136005)(66946007)(66476007)(316002)(82960400001)(38100700002)(31696002)(31686004)(86362001)(66556008)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dThYVE1KeEQ0UjRpbGJhVVh4SDVlRUJUN1dYcnczaXBySmZWNHZDY3dhNDh5?=
 =?utf-8?B?TGFrVndxSTZEVXJVbnBWdEpGc2p3R0psNzJWQ2NmNnIxazlsVGcyT2hiV3ox?=
 =?utf-8?B?cEN6cGtWSVhORGJ0a3NTcVUraUNaZzBvYXN6YThDOFFObldjVTdsN0ZPRXhZ?=
 =?utf-8?B?NGVTS29TQy9TK2Fwcm8zS25DZ3dkZStIUTJ5MmM1OUNZVFhabUNFMTJwK3JL?=
 =?utf-8?B?Lzh5aVhqY3VDSDgzMU5NNkp3SmRHZVhmVlA5MUs1VThiMHo1UDNEU1VOL2hO?=
 =?utf-8?B?ZGNPYW1NRzlRYnJHSEFodTVuYjgrNzd1cUJsNlpiNUY5N2Z4MUFPTC9tYUZ0?=
 =?utf-8?B?bDFEakQrYnBCS2pENVVYbCtXMkI4bW1DUUwxSFFML1R2K1hWT1VuUTlBelZ4?=
 =?utf-8?B?ZGc0NTYrNEhESHdEcGtJcTZmT01IYnFZZkZobTRRbU1kM0x3eTFjVkRWSHND?=
 =?utf-8?B?UTluRnkyOWpOeHJ4bUFka2FEaHRFRjdRZy9UVGN5VmtqZlFxOFBxSHdWQm5v?=
 =?utf-8?B?N09PSnJBSHRRWTkyei9JMFp4L0dVaTJEREtnNWVnL0xuWFNNcnlrd2lnUGY0?=
 =?utf-8?B?Y2NFVS8wYjB3WFE3QVFCVHI2VmthbHFtYW1zWFZzaVJpVTlZMlJqQkdFdjhZ?=
 =?utf-8?B?WTNIcXl6S2laMkp3OUw3SlprMFVQNktFS1VIdENZY2pDWnZZcXg3UHh0a2Vn?=
 =?utf-8?B?Rm8zS29qRVJXVG85Rm14blRJS3l6NG1WUTVIaGlsdTQ4eWNiTXphWTZ1MTJK?=
 =?utf-8?B?eGZjc3FOZHNQOVYzVmp4Tm5QVFd0WUcxSlZHUXJRLzN0VXhpYlBEYksweEhJ?=
 =?utf-8?B?QW96ZHp3aFFmWWRTaUdhUzRTMlllQzRLbFVxRHgwdUV2VDNxV3JtT0hVdGNL?=
 =?utf-8?B?bzJVZTh4bWcrTHB3SGNqRHhRY0hmTTVUMGFFcHR2M01xc2pmaytFZGpuR1Nw?=
 =?utf-8?B?SDcxS0UxamN2UGUyVUdDSEpuQitEY1RLWkNVZEZsRTBITUwxaXNFelpidU1q?=
 =?utf-8?B?cXl4UVIydlZmR0YrekMvUC8rTi9SY1hXRUZLYjUyWVZBOVFaMzN1VWZDYk0w?=
 =?utf-8?B?S2RuS25lNEJmTTFLTHVrLzBVOTVPQkVIQVh1VDl1aXNxZDI0V3o3OWw3UEhs?=
 =?utf-8?B?eWg2SG1SMkVUeFZzNmo3QTFCNXRMSE1TN3hjUXZvV1BTZTNlZmZLTGVmSnpo?=
 =?utf-8?B?djBPcE9qWmpaWGc1WC9vZURRc2Jnc2pGWlBnZ2NuQU1PbURQOHlLeE5KVXBx?=
 =?utf-8?B?MDBxVVlaQkVMcTc2anVOQXlqOVdHWmtXc0tZcmpvRjJNL0cvaXFvblpUYTJs?=
 =?utf-8?B?ZnQycklyYVpvbFA4c01VWnRMYnNwZTlyalRJUkNITEtsMUxPcmpKbElPcFh2?=
 =?utf-8?B?RTNCaXlFSGtoeVBHNWtIdkpFN2s0ZnVsMjZ0K05wQm1oZHZhbElWRWltMXZn?=
 =?utf-8?B?TElmSTZ3MHlFaFBlNmRkR2ZySXNpWTFEdWpiS010eWwzODhmSGhrV0NxbGIx?=
 =?utf-8?B?WWkrSzlaL0lWejNIM3drclI1K2xLRHU2QlNoak50WVB2cUJjY3ZPWHdxbE5h?=
 =?utf-8?B?Q3FlTXJia2VtZS8xUUUvanUrUXpUMVZPSWxhTGgxaVljMFlBMmRtMXJKdjJk?=
 =?utf-8?B?QUgzVGpmV0JsenRrZytMYkRSRHVZYnFBSlBTTFBKVEs1NWdHbm1rcHp1S2VY?=
 =?utf-8?B?cTBKSUtFSnVwbm5UOEVtT0dlUVVadzFuZHpGUWp1WVBKdHRIaVVoNjM1Umpm?=
 =?utf-8?B?SS9jV24vVDNrNHZhZXM2VHBNM1pwZjlneDJwb0tKdkRqdy9OTENIWXFhcHFn?=
 =?utf-8?B?T3hHY21IOUdyUFNqNnpKTi9vMXBTSElOSyt5MmhRN3RYMWRROGFhV2lGemdC?=
 =?utf-8?B?ZlRKY2c3a2hjRjA0KzRwOEZ4MG83NFZvZnZRY0VWcHlpQUFxK0MrNnJwUHYr?=
 =?utf-8?B?VkJwWkJuUGVidy9GS01EaDdJL00rZnhFOXlJeGlZdlBwbE5SWHB0aFk4akFO?=
 =?utf-8?B?YzdqMmdIaEJoN2JUVmFKOWVYSXZaYUlWN2FSR1pVeDZzQ0tRRWMxSWVDRS9j?=
 =?utf-8?B?QW85aXMzdlJsVzBIKzBzU1dYWHdrKzRPdHVrMSsxaUxyM1hDK3JIeTJ6bXNy?=
 =?utf-8?B?bjR3WGdZelZSVzZZemtmTVlQNER4QUtjaEJMeDRMaytJd3U0SEJ3azYxWXRw?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c03df107-7535-494e-4968-08dbfa31ff1e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 10:14:44.6792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/flbNmuTZafgjMNzQZegScqZFMUWJ6EQVLAHZ8tirYKsIxdc4x5yaB93GIkO/yHiIEgylBwgA3Uzhj9HtETvOh69G9tZpAJbeFlYwXYMUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5652
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


On 12/11/2023 3:23 PM, Riana Tauro wrote:
> Hi Suja
>
> On 12/8/2023 1:58 PM, Sundaresan, Sujaritha wrote:
>>
>> On 12/8/2023 10:33 AM, Upadhyay, Tejas wrote:
>>>
>>>> -----Original Message-----
>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>> Sent: Thursday, December 7, 2023 8:48 PM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Tauro, Riana
>>>> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
>>>> Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>> Subject: [v3 1/2] drm/xe: Add a new memory directory under tile
>>>>
>>>> Add a new memory directory under /device/tile<n> and move
>>>> physical_vram_size attribute to the new directory.
>>>>
>>>> New hierarchy:
>>>>
>>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>>
>>>> v2: Fix heading typo (Riana)
>>>>      Fix cleanup error on unload/reload cycle
>>>>
>>>> v3: Fix reload error with kobject_put in place
>>>>      of kobject_del (Tejas)
>>>>
>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 19 ++++++++++++++-----
>>>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> index 16376607c68f..64be1f3a38a9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> @@ -24,7 +24,8 @@ static ssize_t
>>>>   physical_vram_size_bytes_show(struct device *kdev, struct 
>>>> device_attribute
>>>> *attr,
>>>>                     char *buf)
>>>>   {
>>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>>> +    struct kobject *kobj = &kdev->kobj;
>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>> As Christmas is approaching, you might want to adjust this in 
>>> Christmas tree order.
>>>
>>>>       return sysfs_emit(buf, "%llu\n", 
>>>> tile->mem.vram.actual_physical_size);
>>>>   }
>>>> @@ -36,8 +37,10 @@ static const struct attribute 
>>>> *physical_memsize_attr =
>>>>
>>>>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>>>> -    struct xe_tile *tile = arg;
>>>> +    struct kobject *kobj = arg;
>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>> Ditto
>>>
>>>> +    kobject_put(kobj);
>>>>       kobject_put(tile->sysfs);
>>>>   }
>>>>
>>>> @@ -46,6 +49,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>       struct xe_device *xe = tile_to_xe(tile);
>>>>       struct device *dev = xe->drm.dev;
>>>>       struct kobj_tile *kt;
>>>> +    struct kobject *kobj;
>>>>       int err;
>>>>
>>>>       kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,12 +68,17 @@ void
>>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>>
>>>>       tile->sysfs = &kt->base;
>>>>
>>>> -    if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>>> +    if (!kobj) {
>>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>>> ENOMEM);
>>>> +    }
>
> There will be an empty memory directory in case of igfx. Should the 
> memory directory be created only if there are attributes available?
>
> Thanks
> Riana

I can have it added only if IS_DGFX if that works.

Thanks,

Suja

>>> { } is not required here.
>>>
>>> Tejas
>>
>> Will fix all of the above.
>>
>> Thanks,
>>
>> Suja
>>
>>>> +
>>>> +    if (kobj && IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>>           drm_warn(&xe->drm,
>>>>                "Sysfs creation to read addr_range per tile failed\n");
>>>>
>>>> -    err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>>> +    err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, kobj);
>>>>       if (err) {
>>>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset
>>>> failed, err: %d\n",
>>>>                __func__, err);
>>>> -- 
>>>> 2.25.1
