Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA3CCA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 08:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B953A10E3BA;
	Tue, 12 Sep 2023 08:25:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D5C10E3BA
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 08:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694507145; x=1726043145;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=JxirQXjAlY2WUvLILfJNBBcRr5B/ULIzVonxzyKX570=;
 b=Vxzqe/Yv37pqYxADQdbiGV5x6eGxDVF+1Xt+ywmYchQBonNH+0hhU6kk
 Z27wI+kkqIHXimYviAPDahpWKNvkyviixLpDFXRF/5/f/iuJN7MJyZ8WD
 bvziu6fL5puYlabrkUUS9SDVsy8q4qBXgWJUtTSwUTJ6RZOk4ki3IXio5
 Q+0ssRa4DjQrerlNgH2aQQqTkx8vdVhsA4oOI7BI64EJnPp7MzynVUf5D
 Ho3RUh1ildn/gxRQ5uewYltOgiWKck7f26G4ofVo3tNGt2FE7PCZmUxoo
 x4Z99FuQHi8a4lCB35KOm58ZHWx9WBDpx+jMG+FzPoc2Nqj6bcyXkITBL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="464679589"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
 d="scan'208,217";a="464679589"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 01:24:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813736341"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
 d="scan'208,217";a="813736341"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 01:24:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 01:24:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 01:24:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 01:24:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 01:24:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rdn93GWl4R5s4Fb4HYp9YhONBUKyOx7z73fyVKNxgDxnP2NujkTmGXDSaOUh98s4xyZamOBJg2ataEESRlJ+hawCjIlwbMRrPv130nEbnOPNR57LuRmNd0hOTxULBZXm9wGsOV28qri5P/54pKgl3LJsnI5BDXIZQy0POUqabe6HlMzQiabhVuDHdNkfO6LWvK+/CpptSCK0yXlbKDfUVmxJ8ZPulVBWtWikuSURqtmWbSNJEEOkeQlybdQjH+Gjq4aUpXYbF3nz0m9aPxFpwBEX/R4O7vrkBbhLOGv2XOLmFHYbDx2QC7WaHMARpAKoVlYamY7NKwr1vCv750L8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqhdws81ru5L+t9psUsvqeVQ5cws8tgd2keRUt4c8tI=;
 b=FTqb1023bmhoTMEZ2VhReI1XSPzRYWkAiCSwp9pS1pYjyz4O7MfSB+NEMuPAmG2/a/vKKpQ2rStKWe/tbPIGmpEnFNQVW7JxmuTsbv0jSfDkke34JLZYP0V0gncKP8l9UUCOQmna+1Hf741T/SlhelbdxcawgyF6waILi0wOZVVmvyU09u6sku7dwURZzs8PE85MQGd7SB16TFw95TeAMp/1mdb1aiysDbZ8Fy42eLQC/buNsV1j6vBTCfgb4C0k40gtDmMbz6G4zIj6B/tCgdwe/yaj6ZrnprX/dDaFswkYA+/orY9Zdi1+K1ecmmt5/9hkOzawCIJDp8nucOM3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 08:24:15 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 08:24:15 +0000
Content-Type: multipart/alternative;
 boundary="------------10URbLScov4HMiVgD39X1QTD"
Message-ID: <ef994ecc-15d2-493d-85db-b8aaa3072fca@intel.com>
Date: Tue, 12 Sep 2023 13:54:06 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-2-tejas.upadhyay@intel.com>
 <e49fc045-2a05-47f1-9278-7bc5a417cf9b@intel.com>
 <SJ1PR11MB620440975315F5D0E8D3C03981EEA@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <SJ1PR11MB620440975315F5D0E8D3C03981EEA@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: PN3PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV3PR11MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6bdbdb-73b5-4bb0-3917-08dbb369a672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7jFOFgs4BjmHu0B2rsNJ9uAAnVI7dCkFlGipYwH2w2QP8yo7pfdLCpqcyvLSv0x4pn2xDkkuHvJcbP+zGKMLCF0aD+Tqpd6bQShgNDYKrJVASnFQEMuflaqxvrVanaGTq5mEGWSGZJKwqQ/PzvSBcBPavJxtp+W1pRx1uCbQPeOFqc/Ru6aDd0+AXFsuwn70UENm7KJc6Lx4T/is/rYoskBt0qZQg8XB4lqt7IYzqIUvmeycs23TFOjdqgj3YXuonmkVzgHMdWAbsMAooL+uX0Mfot3btjnvuhSFehKS5b9yRActL6FzjLohUqiGZhsIHzKkylHQ2Es9tvbYbu88P/Wwk6KSXnWrFPcJAVz6lhhQMUdUN+k3wbBUFY23br5SAjNqvRndCLnyJx14aITb/buvVqGM/SP4rycEXCHIRbJCWLYbCH//5cNxdlyUeGFpwfOH2cElDnbnZrH+CM6BHJqQmKYIwh4J+4cS8XM7kUQvGI5D0qjJ8dzpdcS038bXz6K7HTc9RUnL/yIbt1GRISP4y3SZUOu2swUGwxIE9PtfvjGP6kPxwQxtDPCkiCRsVVqYw5602JnkzJR5M2KiJAr1V3Wp7MQeSV6oDGHVdFGdGxrhAkWgV7gmkbrQxRcGO0dyY/h2nEe1d2YRWrQj9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(186009)(1800799009)(451199024)(6666004)(33964004)(6506007)(6486002)(53546011)(83380400001)(6512007)(478600001)(107886003)(2616005)(30864003)(2906002)(66556008)(66476007)(66946007)(110136005)(41300700001)(316002)(4326008)(8676002)(8936002)(26005)(5660300002)(36756003)(82960400001)(86362001)(31696002)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1BBdUNaOE0wNVhLWnNYYWY4RzF3MkZSV045UUQwNEhZdDUvcFpLU3RZakwy?=
 =?utf-8?B?VVFlb2NlNzRMWU1UUWovbWg3VlgzTkZUeW9yYU1KNitUcmFqRWl2aWxxeVNr?=
 =?utf-8?B?WFlsMFFyZTVnbkxPcWNzcWZjRG94N2IxUFhzSERjcU16WDhTWUJBNU5yQldP?=
 =?utf-8?B?cFJKTm5WeXdDK21TbzRvWmJXWWlGcHZOMmJjMmd6YmlYSld3V2tMZlM2QWp6?=
 =?utf-8?B?cWQ1aDFteXRZNExOeXBDUnpzY1ZUQlFXallkdThOd1VyVVJ0SDhWOWpJbTNo?=
 =?utf-8?B?U1lsTTVBWW96K1VVZ2hpL012VFBITzMrV0tMRnRselhqRUdwRGhvemFWTDVl?=
 =?utf-8?B?TlJXVTUxTmJ6VXdiWkM2dVZYZ29ZNk5mTS9pYXUvd2oyb1k1eHFCV0JLOG96?=
 =?utf-8?B?Mm01QzFNZDFuVWhPYW5kV2o2ODY3cHcwUFNPUG1UQ1MvUUVoU0JUdXBDanRB?=
 =?utf-8?B?QXdTempFRWFmWXM0R0FRaVRNWmpqMTgwWDg5MXNlRmI1ZzNmN0tzK0R5bFNp?=
 =?utf-8?B?VTdUOGZGU3hVWExOUXl0S0Z4MUJoK25LRlVuaXNxNXpFbHN1eDFlY0xLWmpy?=
 =?utf-8?B?UURBZWIxSkhBQ2tQQTd1SmFwb2tiaG53N0xqcjJyQzlvSjFvTEljTVpiN3ZY?=
 =?utf-8?B?anA4bytOU3paWUN0aW1JR1N3OUtSZnVhRmloVE16NmlBZHJFNzcwbExCRWJn?=
 =?utf-8?B?Ky93T0lYeE5lZk5NTVRqZ09TcHdzbGM4aTlGSWpVQXFFRlpIcStzOTl0eUFU?=
 =?utf-8?B?ek5yTHdjNFdzTDQ4TDY2blRQZEtSTUtKcmdEYUFrSHVzNm85QmVSeW1DVUtI?=
 =?utf-8?B?czVhdURkSi81bWNhWnF2NzhybVR1bzZGdDNmNHhWcDFQU1VqTllxbDBkZ2RR?=
 =?utf-8?B?dEp1bDRHQTVRazh3eGdsbVN6dXRuZWMwNkhKSTA5NS9odnhnU0g1Z3h2eFRt?=
 =?utf-8?B?dWNJTjliTFFnZVA1ZFBGRXQyampDcU4zRHcrWlZ4RUNiMm1vWFBBUlFUdCtO?=
 =?utf-8?B?SmtGUzcxRkJKU2o3QjhCZS94eklzY0s4c2FqTm1GbjFtR0hScXFOS1Y1SVpE?=
 =?utf-8?B?K3NWbGd0TytySjA1akZTWWo5S3RBU0hhNHdoUFVTMU81MUI1UXRuTVpaUDUw?=
 =?utf-8?B?eWg4UXI4RURtK2Vqeit1TGkrajdKTWRvTHJ4Szlyd1VERlh6MEozbFoyOGhm?=
 =?utf-8?B?cVNIL2RySzA5aTdOR2Z5VGExQk1HVktNS1lDeWVJRGdHWitNUEJHbUdjVWdJ?=
 =?utf-8?B?ZGMydG1xSy9EODU4cTFXc0thelg4VHJGSkhCQTFFTHd6bU0yVk5FclJXelJC?=
 =?utf-8?B?ckFTaSsvcGZFeVFhMVhrbEt0bVJGUW5jM3pEdE83ZW9kWC9JRU9SNStVMEcz?=
 =?utf-8?B?dnc4OWI2bVFQdklsdjJqSHFmZFZYSXhvN2ZEeWRIanRGeHQ2RjAralM2WHVx?=
 =?utf-8?B?M251czJGcVFxQjN1cjBpZFA3ZHljNVV2bFI2OHFkR1VSRE0vZ2pKd2UyQWxL?=
 =?utf-8?B?NEgvTHk4V202S1QxdE5xWkJUcUlyK2xTRzlpZkNOdmE2VVJhVm5wTE5Sd0x3?=
 =?utf-8?B?eVh2YURyNEs5eWNsZ1E0U3pjYmdCUWtDd1o0elYzcUNoK0pXTlNaTldxTGVq?=
 =?utf-8?B?SHBuNTdINmQ1S0VOc1JZcnlqd1p3TTc4TkFudDJzVVZhcUJudlYvWVhrWGE3?=
 =?utf-8?B?QmRSVk9sQUdhRkF0cVpNZ1hxRDNPMnpFbHc2RXV3V29rbHg2K0xDRmhIa2Z2?=
 =?utf-8?B?Vkw0MG5qdG1SL2RCb2gyODZsVWtncTF4NG5oZWJIOWh3bjdPZHBaMUF0VlY5?=
 =?utf-8?B?QnJQMENYUXNra1J3NDdSYzN2S29jYUJ4NGJYaWk3bEpmSmNYMDBNKzlKamp5?=
 =?utf-8?B?WmZMVFg2SWxoT1lURExhTko1ZWV0SWtrdXRINVBiQko2ekxpZnV1TjNwczdz?=
 =?utf-8?B?VHlBdjhsbS9EYSt0ZWRTSG9tcXJ4b3Q0L3dZQTRiYWpNTkVvSjlaaEpRN1Ri?=
 =?utf-8?B?S2Y0NDhPc091emQrczRyM05JdUhPc0V1QTJvTXYyRXNsTVpHaFUvMFZRaUZG?=
 =?utf-8?B?aUtVR3ZOcyt4ZXl0b0I2QXhHZGFpdThSTlNiMDZxeEdZdVlTU1FkUk1hZlhi?=
 =?utf-8?B?Mk1MV1RCWWZnZFVoc2dGZi83MTU0SExZdHlGT245dFlvQWtWVERsV1VFOGVM?=
 =?utf-8?Q?kTapWa7iuz8HElZl+Y2bOEI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6bdbdb-73b5-4bb0-3917-08dbb369a672
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 08:24:15.2000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8yclpTCmaJmwBM7BKHgHPcHAVX5MsmG9cdiTthHKph1PeXy9I8IQQnUvcKy8IWP8AP+Y6M/0GBTBgJ9XGJGwyaRo3KpTQJIPOexw3mbfHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8458
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add drm-client infrastructure
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

--------------10URbLScov4HMiVgD39X1QTD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 07-09-2023 14:27, Upadhyay, Tejas wrote:
>
> *From:*Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> *Sent:* Wednesday, September 6, 2023 9:45 AM
> *To:* Upadhyay, Tejas <tejas.upadhyay@intel.com>; 
> intel-xe@lists.freedesktop.org
> *Cc:* Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
> *Subject:* Re: [PATCH 1/7] drm/xe: Add drm-client infrastructure
>
> Hi Tejas,
>
> On 31-08-2023 14:35, Tejas Upadhyay wrote:
>
>     Add drm-client infrastructure to record stats of consumption
>
>     done by individual drm client.
>
>     Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>  <mailto:tejas.upadhyay@intel.com>
>
>     ---
>
>       drivers/gpu/drm/xe/Makefile          |  1 +
>
>       drivers/gpu/drm/xe/xe_device.c       | 15 +++++++-
>
>       drivers/gpu/drm/xe/xe_device_types.h |  6 ++++
>
>       drivers/gpu/drm/xe/xe_drm_client.c   | 52 ++++++++++++++++++++++++++++
>
>       drivers/gpu/drm/xe/xe_drm_client.h   | 43 +++++++++++++++++++++++
>
>       5 files changed, 116 insertions(+), 1 deletion(-)
>
>       create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
>
>       create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h
>
>     diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>
>     index 9d2311f8141f..f9c25cb2f890 100644
>
>     --- a/drivers/gpu/drm/xe/Makefile
>
>     +++ b/drivers/gpu/drm/xe/Makefile
>
>     @@ -51,6 +51,7 @@ xe-y += xe_bb.o \
>
>              xe_device.o \
>
>              xe_device_sysfs.o \
>
>              xe_dma_buf.o \
>
>     +       xe_drm_client.o \
>
>              xe_exec.o \
>
>              xe_execlist.o \
>
>              xe_exec_queue.o \
>
>     diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>
>     index 109aeb25d19c..cf59c7b74eaf 100644
>
>     --- a/drivers/gpu/drm/xe/xe_device.c
>
>     +++ b/drivers/gpu/drm/xe/xe_device.c
>
>     @@ -18,6 +18,7 @@
>
>       #include "xe_debugfs.h"
>
>       #include "xe_display.h"
>
>       #include "xe_dma_buf.h"
>
>     +#include "xe_drm_client.h"
>
>       #include "xe_drv.h"
>
>       #include "xe_exec_queue.h"
>
>       #include "xe_exec.h"
>
>     @@ -43,13 +44,24 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {
>
>       
>
>       static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>
>       {
>
>     +       struct xe_device *xe = to_xe_device(dev);
>
> Don't see xe_device being used in this patch. Better to make this 
> assignment in patch where the xe will be used to reference ttm 
> device.[Patch 7]
>
>     +       struct xe_drm_client *client;
>
>              struct xe_file *xef;
>
>     +       int ret = -ENOMEM;
>
>       
>
>              xef = kzalloc(sizeof(*xef), GFP_KERNEL);
>
>              if (!xef)
>
>     -               return -ENOMEM;
>
>     +               return ret;
>
>     +
>
>     +       client = xe_drm_client_alloc();
>
>     +       if (!client) {
>
>     +               kfree(xef);
>
>     +               return ret;
>
>     +       }
>
>       
>
>              xef->drm = file;
>
>     +       xef->client = client;
>
>     +       xef->xe = xe;
>
>       
>
>              mutex_init(&xef->vm.lock);
>
>              xa_init_flags(&xef->vm.xa, XA_FLAGS_ALLOC1);
>
>     @@ -89,6 +101,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>
>              xa_destroy(&xef->vm.xa);
>
>              mutex_destroy(&xef->vm.lock);
>
>       
>
>     +       xe_drm_client_put(xef->client);
>
>              kfree(xef);
>
>       }
>
>       
>
>     diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>
>     index 750e1f0d3339..d210a535c703 100644
>
>     --- a/drivers/gpu/drm/xe/xe_device_types.h
>
>     +++ b/drivers/gpu/drm/xe/xe_device_types.h
>
>     @@ -462,6 +462,9 @@ struct xe_device {
>
>        * struct xe_file - file handle for XE driver
>
>        */
>
>       struct xe_file {
>
>     +       /** @xe: xe DEVICE **/
>
>     +       struct xe_device *xe;
>
>     +
>
> same comment as above.
>
>              /** @drm: base DRM file */
>
>              struct drm_file *drm;
>
>       
>
>     @@ -480,6 +483,9 @@ struct xe_file {
>
>                      /** @lock: protects file engine state */
>
>                      struct mutex lock;
>
>              } exec_queue;
>
>     +
>
>     +       /** @client: drm client */
>
>     +       struct xe_drm_client *client;
>
>       };
>
>       
>
>       #endif
>
>     diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>
>     new file mode 100644
>
>     index 000000000000..ea7993338076
>
>     --- /dev/null
>
>     +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>
>     @@ -0,0 +1,52 @@
>
>     +// SPDX-License-Identifier: MIT
>
>     +/*
>
>     + * Copyright © 2023 Intel Corporation
>
>     + */
>
>     +
>
>     +#include <drm/drm_print.h>
>
>     +#include <linux/kernel.h>
>
>     +#include <linux/slab.h>
>
>     +#include <linux/types.h>
>
>     +
>
>     +#include "xe_device_types.h"
>
>     +#include "xe_drm_client.h"
>
>     +
>
>     +/**
>
>     + * xe_drm_client_alloc() - Allocate drm client
>
>     + * @void: No arg
>
>     + *
>
>     + * Allocate drm client struct to track client memory against
>
>     + * same till client life. Call this API whenever new client
>
>     + * has opened xe device.
>
>     + *
>
>     + * Return: pointer to client struct or NULL if cant allocate
>
>     + */
>
>     +struct xe_drm_client *xe_drm_client_alloc(void)
>
>     +{
>
>     +       struct xe_drm_client *client;
>
>     +
>
>     +       client = kzalloc(sizeof(*client), GFP_KERNEL);
>
>     +       if (!client)
>
>     +               return NULL;
>
>     +
>
>     +       kref_init(&client->kref);
>
>     +
>
>     +       return client;
>
>     +}
>
>     +
>
>     +/**
>
>     + * __xe_drm_client_free() - Free client struct
>
>     + * @kref: The reference
>
>     + *
>
>     + * This frees client struct. Call this API when xe device is closed
>
>     + * by drm client.
>
>     + *
>
>     + * Return: void
>
>     + */
>
>     +void __xe_drm_client_free(struct kref *kref)
>
>     +{
>
>     +       struct xe_drm_client *client =
>
>     +               container_of(kref, typeof(*client), kref);
>
>     +
>
>     +       kfree(client);
>
>     +}
>
>     diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
>
>     new file mode 100644
>
>     index 000000000000..be097cdf5d12
>
>     --- /dev/null
>
>     +++ b/drivers/gpu/drm/xe/xe_drm_client.h
>
>     @@ -0,0 +1,43 @@
>
>     +/* SPDX-License-Identifier: MIT */
>
>     +/*
>
>     + * Copyright © 2023 Intel Corporation
>
>     + */
>
>     +
>
>     +#ifndef _XE_DRM_CLIENT_H_
>
>     +#define _XE_DRM_CLIENT_H_
>
>     +
>
>     +#include <linux/kref.h>
>
>     +#include <linux/list.h>
>
>     +#include <linux/pid.h>
>
>     +#include <linux/rcupdate.h>
>
>     +#include <linux/sched.h>
>
>     +#include <linux/spinlock.h>
>
>     +
>
>     +struct drm_file;
>
>     +struct drm_printer;
>
>     +
>
>     +struct xe_drm_client {
>
>     +       struct kref kref;
>
>     +       unsigned int id;
>
>     +};
>
>     +
>
>     +       static inline struct xe_drm_client *
>
>     +xe_drm_client_get(struct xe_drm_client *client)
>
>     +{
>
>     +       kref_get(&client->kref);
>
>     +       return client;
>
>     +}
>
>     +
>
>     +void __xe_drm_client_free(struct kref *kref);
>
>     +
>
>     +static inline void xe_drm_client_put(struct xe_drm_client *client)
>
>     +{
>
>     +       kref_put(&client->kref, __xe_drm_client_free);
>
>     +}
>
>     +
>
>     +struct xe_drm_client *xe_drm_client_alloc(void);
>
>     +static inline struct xe_drm_client *
>
>     +xe_drm_client_get(struct xe_drm_client *client);
>
> kref_get/xe_drm_client_get can be moved to the patch where we are 
> introducing xe_drm_client_add_bo to maintain refcount.
>
> Sure. Let me check. But as we introduce infra related to client in 
> this patch. I thought of keeping all basic APIs and xe->xef as part of 
> this patch. Let me know if it does not make sense.
>
Hmm. Makes sense. RB from my end

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Thanks,
>
> Tejas
>
> BR
>
> Himal
>
>     +static inline void xe_drm_client_put(struct xe_drm_client *client);
>
>     +
>
>     +#endif
>
--------------10URbLScov4HMiVgD39X1QTD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-09-2023 14:27, Upadhyay, Tejas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:SJ1PR11MB620440975315F5D0E8D3C03981EEA@SJ1PR11MB6204.namprd11.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.hljs-addition
	{mso-style-name:hljs-addition;}span.EmailStyle23
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
        <div style="border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in 4.0pt">
          <div>
            <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b><span lang="EN-US">From:</span></b><span lang="EN-US"> Ghimiray, Himal Prasad
                  <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
                  <br>
                  <b>Sent:</b> Wednesday, September 6, 2023 9:45 AM<br>
                  <b>To:</b> Upadhyay, Tejas
                  <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a><br>
                  <b>Cc:</b> Iddamsetty, Aravind
                  <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a><br>
                  <b>Subject:</b> Re: [PATCH 1/7] drm/xe: Add drm-client
                  infrastructure<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p>Hi Tejas,<o:p></o:p></p>
          <div>
            <p class="MsoNormal">On 31-08-2023 14:35, Tejas Upadhyay
              wrote:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre>Add drm-client infrastructure to record stats of consumption<o:p></o:p></pre>
            <pre>done by individual drm client.<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Signed-off-by: Tejas Upadhyay <a href="mailto:tejas.upadhyay@intel.com" moz-do-not-send="true">&lt;tejas.upadhyay@intel.com&gt;</a><o:p></o:p></pre>
            <pre>---<o:p></o:p></pre>
            <pre> drivers/gpu/drm/xe/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<o:p></o:p></pre>
            <pre> drivers/gpu/drm/xe/xe_device.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 15 +++++++-<o:p></o:p></pre>
            <pre> drivers/gpu/drm/xe/xe_device_types.h |&nbsp; 6 ++++<o:p></o:p></pre>
            <pre> drivers/gpu/drm/xe/xe_drm_client.c&nbsp;&nbsp; | 52 ++++++++++++++++++++++++++++<o:p></o:p></pre>
            <pre> drivers/gpu/drm/xe/xe_drm_client.h&nbsp;&nbsp; | 43 +++++++++++++++++++++++<o:p></o:p></pre>
            <pre> 5 files changed, 116 insertions(+), 1 deletion(-)<o:p></o:p></pre>
            <pre> create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c<o:p></o:p></pre>
            <pre> create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile<o:p></o:p></pre>
            <pre>index 9d2311f8141f..f9c25cb2f890 100644<o:p></o:p></pre>
            <pre>--- a/drivers/gpu/drm/xe/Makefile<o:p></o:p></pre>
            <pre>+++ b/drivers/gpu/drm/xe/Makefile<o:p></o:p></pre>
            <pre>@@ -51,6 +51,7 @@ xe-y += xe_bb.o \<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_device.o \<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_device_sysfs.o \<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_dma_buf.o \<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_drm_client.o \<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_exec.o \<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_execlist.o \<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_exec_queue.o \<o:p></o:p></pre>
            <pre>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c<o:p></o:p></pre>
            <pre>index 109aeb25d19c..cf59c7b74eaf 100644<o:p></o:p></pre>
            <pre>--- a/drivers/gpu/drm/xe/xe_device.c<o:p></o:p></pre>
            <pre>+++ b/drivers/gpu/drm/xe/xe_device.c<o:p></o:p></pre>
            <pre>@@ -18,6 +18,7 @@<o:p></o:p></pre>
            <pre> #include &quot;xe_debugfs.h&quot;<o:p></o:p></pre>
            <pre> #include &quot;xe_display.h&quot;<o:p></o:p></pre>
            <pre> #include &quot;xe_dma_buf.h&quot;<o:p></o:p></pre>
            <pre>+#include &quot;xe_drm_client.h&quot;<o:p></o:p></pre>
            <pre> #include &quot;xe_drv.h&quot;<o:p></o:p></pre>
            <pre> #include &quot;xe_exec_queue.h&quot;<o:p></o:p></pre>
            <pre> #include &quot;xe_exec.h&quot;<o:p></o:p></pre>
            <pre>@@ -43,13 +44,24 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&nbsp;static int xe_file_open(struct drm_device *dev, struct drm_file *file)<o:p></o:p></pre>
            <pre> {<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_device *xe = to_xe_device(dev);<o:p></o:p></pre>
          </blockquote>
          <p>Don't see xe_device being used in this patch. Better to
            make this assignment in patch where the xe will be used to
            reference ttm device.[Patch 7]<o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_drm_client *client;<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_file *xef;<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret = -ENOMEM;<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xef = kzalloc(sizeof(*xef), GFP_KERNEL);<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!xef)<o:p></o:p></pre>
            <pre>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; client = xe_drm_client_alloc();<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!client) {<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(xef);<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xef-&gt;drm = file;<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xef-&gt;client = client;<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xef-&gt;xe = xe;<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_init(&amp;xef-&gt;vm.lock);<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xa_init_flags(&amp;xef-&gt;vm.xa, XA_FLAGS_ALLOC1);<o:p></o:p></pre>
            <pre>@@ -89,6 +101,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xa_destroy(&amp;xef-&gt;vm.xa);<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_destroy(&amp;xef-&gt;vm.lock);<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_drm_client_put(xef-&gt;client);<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(xef);<o:p></o:p></pre>
            <pre> }<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h<o:p></o:p></pre>
            <pre>index 750e1f0d3339..d210a535c703 100644<o:p></o:p></pre>
            <pre>--- a/drivers/gpu/drm/xe/xe_device_types.h<o:p></o:p></pre>
            <pre>+++ b/drivers/gpu/drm/xe/xe_device_types.h<o:p></o:p></pre>
            <pre>@@ -462,6 +462,9 @@ struct xe_device {<o:p></o:p></pre>
            <pre>&nbsp; * struct xe_file - file handle for XE driver<o:p></o:p></pre>
            <pre>&nbsp; */<o:p></o:p></pre>
            <pre> struct xe_file {<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @xe: xe DEVICE **/<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_device *xe;<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
          </blockquote>
          <p class="MsoNormal">same comment as above.<br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre><o:p>&nbsp;</o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @drm: base DRM file */<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_file *drm;<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>@@ -480,6 +483,9 @@ struct xe_file {<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @lock: protects file engine state */<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mutex lock;<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } exec_queue;<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @client: drm client */<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_drm_client *client;<o:p></o:p></pre>
            <pre> };<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&nbsp;#endif<o:p></o:p></pre>
            <pre>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c<o:p></o:p></pre>
            <pre>new file mode 100644<o:p></o:p></pre>
            <pre>index 000000000000..ea7993338076<o:p></o:p></pre>
            <pre>--- /dev/null<o:p></o:p></pre>
            <pre>+++ b/drivers/gpu/drm/xe/xe_drm_client.c<o:p></o:p></pre>
            <pre>@@ -0,0 +1,52 @@<o:p></o:p></pre>
            <pre>+// SPDX-License-Identifier: MIT<o:p></o:p></pre>
            <pre>+/*<o:p></o:p></pre>
            <pre>+ * Copyright © 2023 Intel Corporation<o:p></o:p></pre>
            <pre>+ */<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+#include &lt;drm/drm_print.h&gt;<o:p></o:p></pre>
            <pre>+#include &lt;linux/kernel.h&gt;<o:p></o:p></pre>
            <pre>+#include &lt;linux/slab.h&gt;<o:p></o:p></pre>
            <pre>+#include &lt;linux/types.h&gt;<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+#include &quot;xe_device_types.h&quot;<o:p></o:p></pre>
            <pre>+#include &quot;xe_drm_client.h&quot;<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+/**<o:p></o:p></pre>
            <pre>+ * xe_drm_client_alloc() - Allocate drm client<o:p></o:p></pre>
            <pre>+ * @void: No arg<o:p></o:p></pre>
            <pre>+ *<o:p></o:p></pre>
            <pre>+ * Allocate drm client struct to track client memory against<o:p></o:p></pre>
            <pre>+ * same till client life. Call this API whenever new client<o:p></o:p></pre>
            <pre>+ * has opened xe device.<o:p></o:p></pre>
            <pre>+ *<o:p></o:p></pre>
            <pre>+ * Return: pointer to client struct or NULL if cant allocate<o:p></o:p></pre>
            <pre>+ */<o:p></o:p></pre>
            <pre>+struct xe_drm_client *xe_drm_client_alloc(void)<o:p></o:p></pre>
            <pre>+{<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_drm_client *client;<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; client = kzalloc(sizeof(*client), GFP_KERNEL);<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!client)<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kref_init(&amp;client-&gt;kref);<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return client;<o:p></o:p></pre>
            <pre>+}<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+/**<o:p></o:p></pre>
            <pre>+ * __xe_drm_client_free() - Free client struct<o:p></o:p></pre>
            <pre>+ * @kref: The reference<o:p></o:p></pre>
            <pre>+ *<o:p></o:p></pre>
            <pre>+ * This frees client struct. Call this API when xe device is closed<o:p></o:p></pre>
            <pre>+ * by drm client.<o:p></o:p></pre>
            <pre>+ *<o:p></o:p></pre>
            <pre>+ * Return: void<o:p></o:p></pre>
            <pre>+ */<o:p></o:p></pre>
            <pre>+void __xe_drm_client_free(struct kref *kref)<o:p></o:p></pre>
            <pre>+{<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_drm_client *client =<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; container_of(kref, typeof(*client), kref);<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(client);<o:p></o:p></pre>
            <pre>+}<o:p></o:p></pre>
            <pre>diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h<o:p></o:p></pre>
            <pre>new file mode 100644<o:p></o:p></pre>
            <pre>index 000000000000..be097cdf5d12<o:p></o:p></pre>
            <pre>--- /dev/null<o:p></o:p></pre>
            <pre>+++ b/drivers/gpu/drm/xe/xe_drm_client.h<o:p></o:p></pre>
            <pre>@@ -0,0 +1,43 @@<o:p></o:p></pre>
            <pre>+/* SPDX-License-Identifier: MIT */<o:p></o:p></pre>
            <pre>+/*<o:p></o:p></pre>
            <pre>+ * Copyright © 2023 Intel Corporation<o:p></o:p></pre>
            <pre>+ */<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+#ifndef _XE_DRM_CLIENT_H_<o:p></o:p></pre>
            <pre>+#define _XE_DRM_CLIENT_H_<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+#include &lt;linux/kref.h&gt;<o:p></o:p></pre>
            <pre>+#include &lt;linux/list.h&gt;<o:p></o:p></pre>
            <pre>+#include &lt;linux/pid.h&gt;<o:p></o:p></pre>
            <pre>+#include &lt;linux/rcupdate.h&gt;<o:p></o:p></pre>
            <pre>+#include &lt;linux/sched.h&gt;<o:p></o:p></pre>
            <pre>+#include &lt;linux/spinlock.h&gt;<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+struct drm_file;<o:p></o:p></pre>
            <pre>+struct drm_printer;<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+struct xe_drm_client {<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct kref kref;<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int id;<o:p></o:p></pre>
            <pre>+};<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static inline struct xe_drm_client *<o:p></o:p></pre>
            <pre>+xe_drm_client_get(struct xe_drm_client *client)<o:p></o:p></pre>
            <pre>+{<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kref_get(&amp;client-&gt;kref);<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return client;<o:p></o:p></pre>
            <pre>+}<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+void __xe_drm_client_free(struct kref *kref);<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+static inline void xe_drm_client_put(struct xe_drm_client *client)<o:p></o:p></pre>
            <pre>+{<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kref_put(&amp;client-&gt;kref, __xe_drm_client_free);<o:p></o:p></pre>
            <pre>+}<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+struct xe_drm_client *xe_drm_client_alloc(void);<o:p></o:p></pre>
            <pre>+static inline struct xe_drm_client *<o:p></o:p></pre>
            <pre>+xe_drm_client_get(struct xe_drm_client *client);<o:p></o:p></pre>
          </blockquote>
          <p>kref_get/xe_drm_client_get can be moved to the patch where
            we are introducing <span class="hljs-addition">
              <span style="font-size:10.0pt;font-family:&quot;Courier New&quot;">xe_drm_client_add_bo
              </span>
            </span>to maintain refcount. <o:p></o:p></p>
          <p>Sure. Let me check. But as we introduce infra related to
            client in this patch. I thought of keeping all basic APIs
            and xe-&gt;xef as part of this patch. Let me know if it does
            not make sense.</p>
        </div>
      </div>
    </blockquote>
    <p>Hmm. Makes sense. RB from my end<br>
    </p>
    <p>Reviewed-by: Himal Prasad Ghimiray
      <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a> <br>
    </p>
    <blockquote type="cite" cite="mid:SJ1PR11MB620440975315F5D0E8D3C03981EEA@SJ1PR11MB6204.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <div style="border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in 4.0pt">
          <p><o:p></o:p></p>
          <p>Thanks,<o:p></o:p></p>
          <p>Tejas<o:p></o:p></p>
          <p>BR<o:p></o:p></p>
          <p>Himal <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>+static inline void xe_drm_client_put(struct xe_drm_client *client);<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+#endif<o:p></o:p></pre>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------10URbLScov4HMiVgD39X1QTD--
