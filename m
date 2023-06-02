Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D17C7EE31
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 08:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB06510E1F5;
	Fri,  2 Jun 2023 08:20:22 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC69E10E1F5
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 08:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685694019; x=1717230019;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=36w2bQuclOMd1koPbwd2pj8YkNLB4f87PVy1UVnW2VM=;
 b=WkyKCaQ9ZDdrEP/w+heUOiwuZhlX1oKF3hzQy+OJAMgNugwsQiyoPYlq
 vLaF9GVy+6pZocefWe6jUkRnDza4eUNlvuGy48ZiuHY1ZdgBFP3Noagcd
 ZVQdMikV+Sz88Q4l7h6EBmWLPZ6E1Fn62Ot7VXllxJIVujXHB+GEuDZnD
 YGi+bx6RNdko13DnACAAN/oGlKWGLK/ypHtVFj3mR+c5VLb4uf2AbAR5N
 xnuB7bbds7Ek9dK8ZUh6dYPWcpKGTsmeC3JqNtsxb5zOHyntJMvB1bvNx
 CIm2/u8IVfCuSUODWbwoxBtcBbe9wvu6sTc6edAcEZJd3AAOPFG2JYgd2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="345390854"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="345390854"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 01:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="831900122"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="831900122"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 02 Jun 2023 01:20:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 2 Jun 2023 01:20:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 2 Jun 2023 01:20:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 2 Jun 2023 01:20:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 2 Jun 2023 01:20:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoZ7e4upgMQLUKR1sKPllnCryAAj7wzHLa7f7Hr3CttbJKv4OjNI5jntWlbdd+xTlm+dHLPGUXJKno3uDvJ/TqkbOfs7wRtNrZa9HiQtOMm94oZJenkz9Pn4/FwHx29/ooXybJwFQDtRbNhJKWk01FSqAteFRSzUKcBnh+Vbu7uvkgMhy1x1vSsP9ZnLmct0sys89Fu6Utj6cDyn6zUdb78GTK4X0iyXu0wMgf8LWq3bGVYB4kISiIrKDPfSirXwWkUFM077elr32q14sX+fM77QRxy3pabf09/7WOHzBl/6AcuGhzO12nhzqtD332nY/uEbPGNXsdqgSERO3tXVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuqI8nkHn5p29Pp3GEylYUjNiDyYXLswlLgRlCD9cmA=;
 b=kRXAW/fIg5Axn+EI/Adt6DBJUKr6poQ/4OGeM1J69YqQP/GbWwJFScdWHtAwf76Qj31SYj9HQ8a23OSy154dXv+gYFX76MZo9YqEaHH+dnrMJgTh5XmNpHD3fqjqbeuJ/k0KtrHSinlROQxPyrIKNY93nPeiZHOF9LU7bKdDXUdSy1hBESPmB0YGn+3OnNWJ+8Ed1EEYQJgoLpgX01JkZTw6mqaErB1bg0f+40onC8JQnL/VtYpz++o4KlMNCs7EMAM+wzwPdBnnS4pNS6tW2szAA9mqcTkeYAebedPy4HqCpM1dwsqY29yqMetHnjM5rbME22d3U0iKSgzLMGKVMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Fri, 2 Jun
 2023 08:20:10 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::ab78:f580:c203:edb8]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::ab78:f580:c203:edb8%6]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 08:20:10 +0000
Message-ID: <08a53290-309d-379b-855e-99f32b8f6298@intel.com>
Date: Fri, 2 Jun 2023 11:20:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: "Souza, Jose" <jose.souza@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <20230526190609.61529-2-jose.souza@intel.com>
 <d03fef471646a9e6141231ab38c264ea46ba291c.camel@linux.intel.com>
 <5d211028d654a8d824e899a073fad9e530c13e95.camel@intel.com>
 <495e7460-cb03-f049-9eb1-43512669acb7@linux.intel.com>
 <41f697fa-97dc-50dd-e438-c62bb1190afe@linux.intel.com>
 <faf59c70a4e046654d734fa77629971595dd7331.camel@intel.com>
 <2aee91cb-d377-476d-dd82-65236a7ac9c7@linux.intel.com>
 <20230601192632.GB5433@mdroper-desk1.amr.corp.intel.com>
 <3995749ec53beb559430390136ac86a15d2ed677.camel@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <3995749ec53beb559430390136ac86a15d2ed677.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 26be29ed-51cf-451b-2236-08db63422dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9yJhB17EHRdpj1z2MpQyZRx1NH6drcPeXrO503hHcMwtOEDw+Y0FZwI565c3e1EMw2YIZjxU+M7IszlSx+NCEIu9YKKCxsExklFzR5ybTw1FENJYIHqE8Gli2IKhDiRY2PqDCI0oMaQcm1xkTi1owDwWEEffrBM/0cclbXe9MNwLyh3smcykTz3YZ3HVLOCag+/TK2Yoc0KrQatM5LSp72M/6yIynfOzJ6TIOz1JPCspVH8TvPmCOR07i7PwbiR8uao/ryvsIB20iK47Eaa12M8uL+euHagFlsPPgYLX2DxwdUf0SSTKaLeF4pD5T+Ics8XxVvb8Do3WkG+Htlj532oTSjAluftexZSbzfDm+H5olhDnjelWhD5MToZXMz64A2Ai/07Oh/+uxN0gMKT/iAUcf0G+o9yULYcwWpYPSuAyPGKSjHDRfQoeS4RShxAOKovxLjegSn3x9JccoxX7WeY3jf6gtMtmnxyt4P5xkQcP9LZnC6q3Jrwcx1jHbrDM+md5tiq5jlqrZ1LCYoFNLVIt+EfUraHzrHXdobQzC+ueNKy79pILRNWD+dYrGhpNf16Vbnx65E3ULzWIJ1qRoicY0bIy+mj+sV56SwZmlktm6lvPHQGwU1jIjc4j7Dj7MMJNRge0QuoZwrmiLDXrHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199021)(83380400001)(66574015)(2616005)(36756003)(186003)(6512007)(26005)(6506007)(53546011)(54906003)(6486002)(31696002)(110136005)(86362001)(31686004)(478600001)(316002)(66946007)(82960400001)(4326008)(41300700001)(38100700002)(66556008)(66476007)(5660300002)(8676002)(8936002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE9kc0xGelF5NkZyZjFaeFBaNllZZmZzRmtrTVRnWjN2WmE3c1dKT3FLWkt1?=
 =?utf-8?B?SFhOUWdOeFkwWDIraDFSZE12TjdpVHNOUHpCWjlXWHlzYjhjeFgreTZjWlk2?=
 =?utf-8?B?akZmRFFld1lwOXVwdytwZFpJSHI0bEZ0K0QzNmpxT1NGSTRuazdjLy85aldn?=
 =?utf-8?B?Q2FVS3UzVlhQYk1rZU9uOGhFcjlXTGZPSm5QK1dvVXlnQVdKR2xVVW5uRkRJ?=
 =?utf-8?B?YVpxblgzSjZDcDIyK2NkK3ZRL0NTS0xqZldIYzNTLzZMVW9zR2tTanRpaDJa?=
 =?utf-8?B?S3FYNTltTmVNakk2RzdSbEs1clVsL1FMcU82ZDZLM3FIVjc2Yk9zRmFWZDBD?=
 =?utf-8?B?UnVrelpvSDJ1Nktic29kdDc2ZFZ3Q0E2b0ZBMXVrVU9CTFZTQmp4bVVMcnBZ?=
 =?utf-8?B?aGtZN1ZKSklJU3JhYUI3VXVzUFQ4NVBnZXgvOGQrSzhiMU9HZkNZTVRaMFVi?=
 =?utf-8?B?OGlxSmk2dUIrZ1JNWUxPNzZqbjdtZnFUTldwL1FIa0xpK0haY2RvM29pQVl2?=
 =?utf-8?B?Yk03QlZQZjdJckRXWG9BbVdqeWdrZ010cy9SaWU2STBTSk8rQ0kwb3A2L203?=
 =?utf-8?B?ak82WTkxWlplMEhMWW80R284blhXdUtXdER2N2d0MkRDNzM5SlZOaEYxbFp0?=
 =?utf-8?B?d1AzRW1SVytIeUFWTnZlSlhDRkNLR3ZLYlFNNUtDMEZVNXJENFlXbFVQSk93?=
 =?utf-8?B?UGxtMElPa1BaeUxsM2I5YXZGNzFnTzQzcTlUcVVJeEhHdUZreXVadHlBUXV0?=
 =?utf-8?B?TGFxMkZZV0Fqelhsc3VobW1KQ2FwTDZWOXBEZHBXcjQwMitMK2tXcTJ5UFhC?=
 =?utf-8?B?Njc4S3haUCtKRndRSHRlK2tGT0pPVmE0dTFudGZyY0dCdS9IeEduZFZOVE9n?=
 =?utf-8?B?TStTUTB0K1ZCL0JYajc4SFB2NzdZaTlzQ00ycmVuZlB0amFhd2M3UkVMZFZY?=
 =?utf-8?B?RFlzL2ZFclJqWU5mRXhmeGUxdy9kRE5JTW5jeVBJYy9ZTVU4WUhSSzFnVWQz?=
 =?utf-8?B?dk1FWUNObTFXd0NkOEVXQURHcHh0NjRvL1I5amZMczN0cmhJUVZkUzg0ajI0?=
 =?utf-8?B?SkFSbXhkOVExbDViRTI1azIyeE45ZUM0OGMrdjVGNzhCLytqeno1aTdjU2pX?=
 =?utf-8?B?S0ZSWkdpd3NERXFtb21YbzFENW1iOWlJSHM4UEhQbzR4Y3RoY1g4UTJIN25Y?=
 =?utf-8?B?eWYzTG9QMFY1WEtNek5LT3RFTFhjZzJUUHB4SmMwdmhaNlZMSVhUaWJsamFt?=
 =?utf-8?B?YVBsbmpZc3NSK1NhYnN2d2QyaXAwVThNTGpYem94T3hsQm5IREcwdFQ4L2sz?=
 =?utf-8?B?Q2Y4RXd2eHUySDhRSnpkNUw4MzNiWFpxSWU5MG45SHBBZXBuVnVrbW5GM2U5?=
 =?utf-8?B?Y0F1aG0weXVhKzQ5VWEvMXVBdjlibTJIWjh5ZTJkTDVxWmsxOG5hUWdKaW5t?=
 =?utf-8?B?SmE0RHhFZnR5QS9CWFRvM2FwaVlRRm5NT0FvaFNsVjRYakVGM3FqNlczdDZN?=
 =?utf-8?B?bHBod0NrVXIzOFRMTCtyQm9FUVBkVGVTNkwxMyt2ZnJTTTdqQmwwUUd0Z2tP?=
 =?utf-8?B?b1N2UWJzYk02Mk11bkFIUDlJNUtQRzFtY3Z6eWpvOXpOVkUyVHM3cVp4UkZC?=
 =?utf-8?B?YS9BVDU5emlNTXFRV3VOVmxiaFZkc05yYkRvdWs0eTNqcndQSW91Ny9KdXpL?=
 =?utf-8?B?Y3BxNzYxQzYzK1FIWjRqZjQyVTRFWnU5VWZEWEN1aWFVWEZ6M1NMKzhMSmtZ?=
 =?utf-8?B?dytmWnBvQW1WNEpHeGR1RlRGMmhmRmNkMG9meVFzUFNteWlZeDIyUXMrSTdL?=
 =?utf-8?B?UHQzS0c5eHF3QmxsdlRGK1lmZzZYZGxKRzlvdW9LSmdsT3YyaXIyQ0Jxc3lv?=
 =?utf-8?B?SG5XVlZjbEp6QzBlRTVPRGhSZ01qeHNrUjBFNldBaDZFNE1VOGRadUQvS0lo?=
 =?utf-8?B?aFVWQkp1NHNIeHJiWmRjUGJNNlpMbUQ2VGlVSEM1Ym1hL3AzL3llM0pESWVj?=
 =?utf-8?B?cEJHdTNkck9nMkVIUTVxYWFQdk40TlR3bTc3Q0xrNEZrZFowWWZwT2NtOE1H?=
 =?utf-8?B?Mm9oVlNUWWNTYmNHY2VERWVHaUxsS2M5T0dGeS9xY3BmV3hBWUhkalI2QUNq?=
 =?utf-8?B?Y29nZFZXbGkxNWxVbjcyRktiQUNpZjFVRkNrZndWNk1CRjVURHRYamJLaUQw?=
 =?utf-8?Q?lFTZNc7xwigvTsy+Fe0K9ho=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26be29ed-51cf-451b-2236-08db63422dbb
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 08:20:09.2886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxF9tcS9b7780MmdJ6SaYrz1ftukPoN/X9bzbUofH4Azy5uIJqwuCZl/uNhpcrAdMEgY2z+MvsYPIUIca0ohSKM5tuU0Por1ERSokXzkf7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add missing TLB invalidation to
 emit_pipe_invalidate()
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 02/06/2023 00:09, Souza, Jose wrote:
> On Thu, 2023-06-01 at 12:26 -0700, Matt Roper wrote:
>> On Wed, May 31, 2023 at 10:46:20AM +0200, Thomas Hellström wrote:
>>> On 5/30/23 20:40, Souza, Jose wrote:
>>>> On Mon, 2023-05-29 at 17:07 +0200, Thomas Hellström wrote:
>>>>> On 5/29/23 16:56, Thomas Hellström wrote:
>>>>>> On 5/29/23 16:48, Souza, Jose wrote:
>>>>>>> On Mon, 2023-05-29 at 11:08 +0200, Thomas Hellström wrote:
>>>>>>>> On Fri, 2023-05-26 at 12:06 -0700, José Roberto de Souza wrote:
>>>>>>>>> i915 invalidates TLB before emit BB start, so doing the same in Xe.
>>>>>>>> Hi, José,
>>>>>>>>
>>>>>>>> Do you see an issue because of missing TLB flushes? In that case that
>>>>>>>> needs to be added to the commit message. We do TLB flushes on unbind,
>>>>>>>> but not sure if we do them on rebind, so if that's the issue we need to
>>>>>>>> figure out whether we should do them also on rebind or, like in this
>>>>>>>> patch, on each exec.
>>>>>>> I have a group of tests that results flips randomly. It fails when
>>>>>>> the rendered buffer is compared to expected result.
>>>>>>> Anything that add a bit of delay after the exec fixes those tests so
>>>>>>> I was looking for any missing flush in Xe KMD and Mesa.
>>>>>>>
>>>>>>> This one did not fixed it but as i915 was doing it I thought would be
>>>>>>> good to do in Xe too.
>>>>>> I think missing TLB invalidations are more likely to cause random
>>>>>> overwrites of freed memory. Let me do a quick check on these. But the
>>>>>> problem you're describing indeed sounds more like a missing render
>>>>>> cache flush.
>>>>>>
>>>>> It indeed looks like we're doing proper TLB invalidation on both rebind
>>>>> and unbind, so this patch shouldn't really be needed.
>>>>>
>>>>> (look for "invalidation_fence_init()")
>>>> With this patch + PIPE_CONTROL flush at the end of batch buffer in Mesa, fixed the groups of the tests that were flipping results.
>>>> Do a XE_GUC_ACTION_TLB_INVALIDATION is the same as a PIPE_CONTROL_TLB_INVALIDATE?
>> +Cc Matt Brost and Niranjana
>>
>> It's worth noting that the removal of PIPE_CONTROL_TLB_INVALIDATE was a
>> deliberate act in this patch:
>>
>>          commit 41db3304cff95475c6f6667ae27fab3c144a49df
>>          Author:     Matthew Brost <matthew.brost@intel.com>
>>          AuthorDate: Thu Jan 26 10:40:41 2023 -0800
>>          Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
>>          CommitDate: Tue May 23 14:13:47 2023 -0400
>>
>>              drm/xe: Drop TLB invalidation from ring operations
>>
>> so the expectation is that this specific flag shouldn't be necessary due
>> to the GuC-based invalidation we're doing.
>>
>> At the hardware level, there are a lot of different TLBs that cache page
>> table lookups.  Each engine has a TLB, the GuC itself has another TLB,
>> the OA unit has another one, and on igpu platforms, there are also
>> additional AuxCCS TLBs for the compression lookups that most engines can
>> do.  You can trigger TLB invalidations in various ways:  via GPU
>> instructions (like PIPE_CONTROL), MMIO registers (like
>> XEHP_GFX_TLB_INV_CR), or via a GuC request
>> (XE_GUC_ACTION_TLB_INVALIDATION).  The details of invalidation vary by
>> platform (e.g., you can do selective range-based invalidation on some
>> platforms, but not on others).  The GuC just provides a single
>> interface, but that interface lets you choose whether you're doing full
>> vs range invalidation, whether you're invalidating engine TLBs or
>> the GuC's own TLB, etc.  If using the GuC interface to invalidate engine
>> TLBs, it just requires a single request and takes care of invalidating
>> all of the individual engines on its end.
>>
> Huum then commit 1d759ab5967cfc ("drm/xe: Reinstate render / compute cache invalidation in ring ops") brought the emit_pipe_invalidate() back in
> __emit_job_gen12_render_compute() but not the rest.
>
> I reverted this patch in Xe kernel and started to emit a pipe_control at the end of batch buffer with:
>
> enum anv_pipe_bits flush = ANV_PIPE_FLUSH_BITS |
> 			   ANV_PIPE_L3_FABRIC_FLUSH |
> 			   ANV_PIPE_TLB_INVALIDATE;
>
> #define ANV_PIPE_FLUSH_BITS ( \
>     ANV_PIPE_DEPTH_CACHE_FLUSH_BIT | \
>     ANV_PIPE_DATA_CACHE_FLUSH_BIT | \
>     ANV_PIPE_HDC_PIPELINE_FLUSH_BIT | \
>     ANV_PIPE_UNTYPED_DATAPORT_CACHE_FLUSH_BIT | \
>     ANV_PIPE_RENDER_TARGET_CACHE_FLUSH_BIT | \
>     ANV_PIPE_TILE_CACHE_FLUSH_BIT)
>
> And it fixed the tests.
> TLB_INVALIDATE is definitely needed as I also tested with below set of bits and it did not worked:
>
>
> enum anv_pipe_bits flush = ANV_PIPE_FLUSH_BITS |
> 			   ANV_PIPE_L3_FABRIC_FLUSH |
> 			   ANV_PIPE_DEPTH_STALL_BIT |
>                             ANV_PIPE_CONTROL_FLUSH_ENABLE |
>                             ANV_PIPE_STORE_DATA_INDEX |
>                             ANV_PIPE_END_OF_PIPE_SYNC_BIT;
>
> enum anv_pipe_bits flush = ANV_PIPE_FLUSH_BITS |
> 			   ANV_PIPE_L3_FABRIC_FLUSH |
> 			   ANV_PIPE_DEPTH_STALL_BIT |
>                             ANV_PIPE_CONTROL_FLUSH_ENABLE |
>                             ANV_PIPE_STORE_DATA_INDEX |
>                             ANV_PIPE_END_OF_PIPE_SYNC_BIT |
>                             ANV_PIPE_COMMAND_CACHE_INVALIDATE_ENABLE |
>                             ANV_PIPE_CS_STALL_BIT |
>                             ANV_PIPE_INVALIDATE_BITS;
>
> So it might be leaving something in the engine TLB that could also be exploited by malicious software.
>
>> Are the mesa issues being seen on all platforms or just specific ones?
> I can reproduce on gfx12.0 platforms and DG2 but did not tested the fix in DG2 yet.


I just wanted to point out this PIPE_CONTROL bit has a bit of a 
misleading name.

It does more than invalidation :

     "If ENABLED, PIPE_CONTROL command will flush the in flight data 
written out by render engine to Global Observation point on flush done. 
Also Requires stall bit ([20] of DW1) set."


Not sure if that changes you mind about whether it should be in 
emit_flush or not :)


-Lionel


>
>>
>> Matt
>>
>>> I would think so, yes, except that the GUC TLB invalidation is GT-wide and
>>> I'm not sure whether PIPE_CONTROL_TLB_INVALIDATE is per hw engine or per-GT.
>>> But given this really has an impact, it might be that we need to invalidate
>>> TLB also after a bind where we previously pointed to the scratch page.
>>>
>>> If that's indeed the culprit we should look at issuing a
>>> PIPE_CONTROL_TLB_INVALIDATE on the exec following a bind or rebind, and
>>> leave the GuC TLB invalidations for unbinds, and then this patch makes sense
>>> as a start.
>>>
>>>
>>>> Do you see any PIPE_CONTROL flush at the end of batch buffers that i915 does but Xe don't?
>>> The emit_fini_breadcrumb() called from __i915_request_submit() indeed seems
>>> to emit the flushes needed, whereas the corresponding
>>> emit_pipe_imm_ggtt() in xe doesn't.
>>>
>>> /Thomas
>>>
>>>
>>>>> /Thomas
>>>>>
>>>>>> /Thomas
>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Thomas
>>>>>>>>
>>>>>>>>
>>>>>>>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>>>>>>>> ---
>>>>>>>>>     drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 1 +
>>>>>>>>>     drivers/gpu/drm/xe/xe_ring_ops.c          | 6 ++++--
>>>>>>>>>     2 files changed, 5 insertions(+), 2 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>>>>> b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>>>>> index 0f9c5b0b8a3ba..7c7320efea739 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>>>>> @@ -73,6 +73,7 @@
>>>>>>>>>     #define
>>>>>>>>> PIPE_CONTROL_STORE_DATA_INDEX                        (1<<21)
>>>>>>>>>     #define
>>>>>>>>> PIPE_CONTROL_CS_STALL                                (1<<20)
>>>>>>>>>     #define PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET           (1<<19)
>>>>>>>>> +#define PIPE_CONTROL_TLB_INVALIDATE                  (1<<18)
>>>>>>>>>     #define
>>>>>>>>> PIPE_CONTROL_PSD_SYNC                                (1<<17)
>>>>>>>>>     #define
>>>>>>>>> PIPE_CONTROL_QW_WRITE                                (1<<14)
>>>>>>>>>     #define PIPE_CONTROL_DEPTH_STALL                     (1<<13)
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>>>>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>>>>> index d2fa0b4c8bcc0..4f3ef39109b9b 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>>>>> @@ -37,7 +37,8 @@
>>>>>>>>>                    PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
>>>>>>>>>                    PIPE_CONTROL_FLUSH_ENABLE | \
>>>>>>>>>                    PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
>>>>>>>>> -               PIPE_CONTROL_DC_FLUSH_ENABLE)
>>>>>>>>> +               PIPE_CONTROL_DC_FLUSH_ENABLE | \
>>>>>>>>> +               PIPE_CONTROL_TLB_INVALIDATE)
>>>>>>>>>       static u32 preparser_disable(bool state)
>>>>>>>>>     {
>>>>>>>>> @@ -117,7 +118,8 @@ static int emit_pipe_invalidate(u32 mask_flags,
>>>>>>>>> u32 *dw, int i)
>>>>>>>>>                    PIPE_CONTROL_CONST_CACHE_INVALIDATE |
>>>>>>>>>                    PIPE_CONTROL_STATE_CACHE_INVALIDATE |
>>>>>>>>>                    PIPE_CONTROL_QW_WRITE |
>>>>>>>>> -               PIPE_CONTROL_STORE_DATA_INDEX;
>>>>>>>>> +               PIPE_CONTROL_STORE_DATA_INDEX |
>>>>>>>>> +               PIPE_CONTROL_TLB_INVALIDATE;
>>>>>>>>>              flags &= ~mask_flags;


