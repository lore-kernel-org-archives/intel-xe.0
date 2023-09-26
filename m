Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19FFE7E65D
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 18:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A56110E151;
	Tue, 26 Sep 2023 18:59:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B1D10E151
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 18:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695754752; x=1727290752;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ImzDWb3LNTj5WS/I1QhU42QaThigk1xwVU5Zc16yH/A=;
 b=XC52KJoq4RT9fbzbDTrXw9Ujp6Ep6taLMxWYrhKr61of8oPf85ko9gr2
 uREyX9OxDDG6Kzeu/KaYzcGkG3lCsi0XqlsOqkkfADwDrGBeCCkdVXob1
 dY6ZxkbEuaxaUyNm+/inc/rQlUv7gdXmal77xlWqK6kTZsnNWFH4Pj0Ov
 hFt4zm3l8PjE/5wLSBtQBW1gS73QLFrmgytIadUGMQ4rK/hzfmiK+vA7L
 zJfxU8ox7yke7cT8jk1Gycs9qIYb1AmXfqCZCCBWOxnGu9lbCjKdCazJ7
 /bybeWhht+a5fMeCaebDQNRF/M+Q5RK0pqxTvrv1o5ARIpLKB/SoCoiUw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384425357"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="384425357"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 11:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872606796"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="872606796"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 11:59:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 11:59:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 11:59:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 11:59:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 11:59:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIr5nUrvpUfRBhGMCQ1JuqQ5b/7ySJ2p6ACegpMaPGh6tP+rvsVRQohMDQpY/otgZsbQzXfkOGXxl3iEzxy9c+RHN2CHl81uahrBMZvC7W4gviz3ES0vnJETY5J0ar8MbdoHBb3pONTEfBi2JIejR7jfm0mqJyDj9Kg+NauRGeAacsYksvrvqaZKhKgWjGU+iucOL2/NxEX8/uQo7MSSuzHbq1Xq3ge16c57njyqtSnpTaExPWVVP6O1n7+ccaO4ftbj2eUZv9BkN0CzZrzGbsVrRjWktMCj/frRlNXO3MHZWaLOG3Y7LT7pc3e4QeLdh945iyplZYfgMicSPGSFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzBqD+gEjWGVmiWrRYAKm43AEOap45JfD7TyuKf1D1o=;
 b=bFHIQWRn/8uqvRJC+KqVXwIQdSH1cTizpz3lvCblOP+uum6LSPwnUnp9jdmVvG4UrLBbqYraB9AyHLqPiQBE7rVA7gZZoXF/Vnj2oadfz4S9T2RQiUOFcu4DPQtRt/iXOR/tXgTAvrNpsUBrzi/WC6+GGQloF7WdnTf7MmbKqNgyzZWGl88lvl1hRpUePLuK31UfOe5nhaYUOUADFtcbR7dJTgfGNuBxu95kE6aVr1t5gszby6+Ii0SFvX4MXeb5VFBVDYTeNZXsM16nq3x4ml5k7cXRWjAi9IfVLBxpwF2v7jB3jan0eSkslxiy8oC+OfJQ4k4LNOIKsMwK//p5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH7PR11MB8525.namprd11.prod.outlook.com (2603:10b6:510:304::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 18:59:09 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da%3]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 18:59:09 +0000
Date: Tue, 26 Sep 2023 11:58:58 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZRMp8rRXkuybDH3E@unerlige-ril>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-4-rodrigo.vivi@intel.com>
 <ZRI1yPmabDfopQ77@unerlige-ril> <ZRMnbYcsX+GSEgA3@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZRMnbYcsX+GSEgA3@intel.com>
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH7PR11MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: e745e517-ae45-481e-de3a-08dbbec2a9d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PorwvdgDjQuub+lbcba7+NjU9v++I2UM96Ef3EOzH5g1hyDgVfNO1xXZ2lhTZ7FCTZrASmtkx2/cvcQq/fjNf5ErUAW7+Q0P+gRpomZBK94TgIN7hsyvOkEkbpRUOaWZz+zrgV5blGplhz2mFifitU41oIeZJZZdtwHXHQwj/nA7DVxiMK/LM31KpmIFlTkjwh50Q+jKIPZlYVlrckDlRbvhx5WFt94s1q9AT54H7WWV7TUE19oFkMCMdKTCajTfd5QSOtNcdMNh9fdDJD4TakXFloZpjPCY4zIpK59gTcJxleLT2I05eZcCphe9q+RNYbWn7TbFdBRwYjmCxvg2Pg9BrZttnm8B3CUQab/UYbg2BFpCslxuX27YCxQYAJUK+T6kxRWtCRg8hqWdqQVBJxH9qqk2Jg2WjbZK8Ifb8y/4AAgkzXpGilqL509tZ2JWX7QEMkyT+ruU+tJBZRuBrpuhgYZnAZ3WLgh/Pk2vNPVFkEGiaGjFRaF7rL/Xr0IWH6763u6Pz1d0LXui0rZBHE/ieHBOIDrGcggYtFXovdjgoWd3Owi1R4kz+KwxXTc/2pq8UFGTntrZGo+lMDT1vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(230922051799003)(1800799009)(451199024)(186009)(107886003)(6486002)(6506007)(26005)(6512007)(9686003)(82960400001)(86362001)(38100700002)(6862004)(83380400001)(8936002)(8676002)(6636002)(316002)(4326008)(41300700001)(66946007)(66476007)(66556008)(54906003)(5660300002)(2906002)(6666004)(33716001)(966005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFRsRFN4ZTNlRmFFb0h5RmQzbTk0MVY3WnN2ZGhNR0tFd1lrUUxxb0pQYko4?=
 =?utf-8?B?a3EzK1N3VTFxak1HMDVNcDh4dDNMSHhsVEpvdllRVk00eTREclZlWi9pM3ph?=
 =?utf-8?B?cDdyRjBGT2JRakxsT0k2eWZxNllqM3pkWXhjTmlYY2ZIbk1iZjZYendwNVhz?=
 =?utf-8?B?ay9EYitId0U2SWRSdHkxWXZodW83dlVBM0pTb2dsQkJZOE5SNTVPa0N0MGhB?=
 =?utf-8?B?Q1lWTHZxcTI1RnhCZUc2enpxVGtIeEVXQ3IxV3pEenVZbFIrN2lnc1ZlQnpq?=
 =?utf-8?B?dmRFSkduU2ZvZ3NlNUhxbWJxanFzZDRwQmQ1Z2VFWDBwSDZhQWdVUlFOazU5?=
 =?utf-8?B?UzJZaTRLUTV1SnFNUFY0TjBwK2Y4RnRrTWlRRXJuanFTZDJDYTdEV3RsQ0ow?=
 =?utf-8?B?cGpSOCtWUnpndHVtQ04zNTRycmZ5bGpnZng1YkRjZk1PNGVGVTRZM1VsY3Js?=
 =?utf-8?B?K0RMQzdrTG50bTZTU0xPT1gvTElLU2FONVdjUC9JS3ZGenpNbm1xL21TTndL?=
 =?utf-8?B?clU4Wk1waGxBMldYQng2ZGNGZlhwQ0E1ckU5TnNBa0RFZzNDbzh4aTQ5QmZR?=
 =?utf-8?B?enJNcFY5cWdMWUZFSHdDbGdFREhxcFBaN28zUWtrNFU4emdsYmhTa3p3Y093?=
 =?utf-8?B?ODFnZW84OFRPSDBqcWtiMFZHWVdGcFNSRHFvakZPd0tmQmhpemFVRnc4VERH?=
 =?utf-8?B?SGlwcUgxaXp2cE5XQlhzMVFYUTN1eFk5b2xDOFJZaHMvZ1lQOHpUam1VWkJX?=
 =?utf-8?B?aTduV3lKN2EwY0pVQ0tUWW4vdytQUHBjSGVXelROVUllMzNMbVR3VjM3ZlNu?=
 =?utf-8?B?QkxRMHEwczN2WTFLZzhFWEtHRXdKaWdHYUpDUHg4VGdKNGhMd01qd1ZYYlND?=
 =?utf-8?B?RkZrMWpydjlodWplVmhIVDNhTFhaZkg5VEo5aUkwd1k5Yks5KzIyVDZNZFVB?=
 =?utf-8?B?S2dlWFhLMko5M0tGQVBEZnVDMHpvaWV5ajFFbTloMWRXL1dJTGhObU5OUnFV?=
 =?utf-8?B?RXRoYnY3N1lxMHljNVR3RVp1bDAxMXJ1LzNkbU1JQTBhVThwS25yVDdJTXVQ?=
 =?utf-8?B?amkvdXdLdngySUU5alFhNFY0WFE2SkVka1VvWkd6ckx6VXY5UlRZZ3hlemdX?=
 =?utf-8?B?aVBtYmlxMy82UnJKZWRQbzIxMkkxVjIxenhjaGNtYWZXQTNMK2VGTk45S3pR?=
 =?utf-8?B?My90S05aSVZXWG1FOHJMU1BLdnhtWHdoZG9HTHBQQ0NJU2F3UGM0ZnJWK0VM?=
 =?utf-8?B?WW44cFdYQ25veXNqRmFJZnFHalFibVM3V1pwWXVmcGlXRlk2N1pNRmxFZ0x6?=
 =?utf-8?B?aGFrQmZ4dEp2dW9xWXdwMm15N1MrVUlKWG96NWlrbE9PbDA3eWZQdzN0WC9y?=
 =?utf-8?B?Sk1yK1haWHlYVWcrNiszMnM0ZldGM0wwZ3BsMEs5bEVYcHRGQ0FqNGFDcGxp?=
 =?utf-8?B?S3hLMFRzbkcwRWtUZHVWZTFCbG5PV20xLzdMZm50dGsxMU9rdEVHT1A1WlJH?=
 =?utf-8?B?N1c2TFo2SVlhaUVGRVJPUjhNb1I3RDJRNHNhcjBBSDFkWGp0aWw3WDRwS1dN?=
 =?utf-8?B?ODI2aFlnOVBGejBIS0F5SHM4Mk01RW1LNTFDdGd3UW1mYjRkdllpREh5NzY1?=
 =?utf-8?B?M21vQ0hNMnE5SFc3elE5V2RUZHQ2N2RXdU9UVzNmanNVekNvUDVwVDBBL3U4?=
 =?utf-8?B?aFh6aFJBaHhPYTZNSElVVXp3SWcranZtMnBCSzNCNTVWL2Q1MVBzdkp6cW9V?=
 =?utf-8?B?SnJaNVB3WjNnbU9LeDVzWk5xb1pYRjhoMEU5Z3ZldnFPSCt4cTNUOTRmek9E?=
 =?utf-8?B?ekFhWlg4R3lQRDRQNmxiSlgzUVZYNTlWWkt3VGNWc2doV24wVi8wejZIL3VQ?=
 =?utf-8?B?dys2KzgzUnNnU0xyaGhiYUt1a0t3NjlsOXYyOUlxVUwxTWhtMklHL3drd0Z5?=
 =?utf-8?B?cUt3emtreUV5THZsWEgwb2wxNkYwNUZsNTZ4TFJjSkpaVkVzOVdTSkZWdnJK?=
 =?utf-8?B?b0U0dU5iUEQvRy9QME02YUszYTlWVTdvWjlVOFhpc3BMNE03WlBLNDFMRkw4?=
 =?utf-8?B?bndOVnVIQ1pzR2w4VndNZlVCeGo5S0N2em9CQXdhNDlVUDRvK1JRektKc1VX?=
 =?utf-8?B?Y21TTFNSSXVndHprdUk5Wm5sTm85eEtuRXMzMUJBRjdiV0FEWGhPUXFwTDlK?=
 =?utf-8?Q?ycEOcqArkpzslUImuHyX+RY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e745e517-ae45-481e-de3a-08dbbec2a9d9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 18:59:08.8939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Fn5btEujq3mEi5ZP/Ae2oZ/PBdF4DNNgP40FlmkZ+MIHfuyBT01khCMMp2gP0olapLRsaaXMk2xozDpdqYZ3P++JY1JI/y3M/tFilItmy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8525
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/20] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 02:48:13PM -0400, Rodrigo Vivi wrote:
>On Mon, Sep 25, 2023 at 06:37:12PM -0700, Umesh Nerlige Ramappa wrote:
>> On Wed, Sep 20, 2023 at 03:29:23PM -0400, Rodrigo Vivi wrote:
>> > From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> >
>> > Perf measurements rely on CPU and engine timestamps to correlate
>> > events of interest across these time domains. Current mechanisms get
>> > these timestamps separately and the calculated delta between these
>> > timestamps lack enough accuracy.
>> >
>> > To improve the accuracy of these time measurements to within a few us,
>> > add a query that returns the engine and cpu timestamps captured as
>> > close to each other as possible.
>> >
>> > Prior work: https://patchwork.freedesktop.org/series/87552/
>> >
>> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > ---
>>
>> Should already have an R-b from Jose based on this -
>> https://patchwork.freedesktop.org/patch/552682/?series=122440&rev=1
>
>While incorporating that and fixing IGT, I noticed the inconsistency
>present on the v2 that was not part of v1.
>
>Why we have the struct name as engine_cycles now but the query itself
>is still cs_cycles? Which one is correct? why do we need both and
>cannot align in a single name?

Jose had commented that XE does not have the concept of CS and asked for 
a rename to engine. In the latest revision of this series, I had 
replaces cs with engine everywhere.

We should use engine.

Latest series - https://patchwork.freedesktop.org/series/122440/

Thanks,
Umesh
>
>>
>> Thanks,
>> Umesh
