Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8AEC761A6
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 22:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7856A10F345;
	Fri, 31 Mar 2023 22:45:26 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E6E10F344
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 22:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680302709; x=1711838709;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=863rI9+ZJMQ0nDdp/Ysx94t3Q8zpghOwppegr0C3whs=;
 b=WwTfHw8Y/ixJrPoidEJuH+ub1Rxu61Fi6H1QjQ9vvTlTvZFgwL/d8ycq
 5v0TUN8bK7VLHw8OwqkVysvRsdWJoNa5XhiaZ6ODY/CQzNxa5qkMXNiqZ
 C/ldSquKm3VVRS4TONYlkOYCAP/MU9Wg+9oSrdKIX2iyhaxFNAxXB5M46
 2jrSKyEMl897eRYJGcE9sXkJWsHjrzbZ8TjtpRnoTUmj7ysd+HV7lLbeF
 S7ZKhnO0eWkEDWRXvB/DWPJz+XoEGOSelm1pslU2GgKLXEE3QLoFPysn5
 QJCYE2nxCqRlG8AkGH/Dicr9ANoM0rA/1on9wu+/cO2GMA7quOr2eUjjb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="369365956"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="369365956"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 15:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="796270366"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="796270366"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 31 Mar 2023 15:45:07 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 15:45:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 15:45:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 15:45:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K625uR4ccuLgObhzRalwjF58Hon9E1u1ZSTHngJBptzUHIMJUsb9jihFGNnqyTT1hb34/xZZ0oyM/+bnq1JtPRbw8JOBjRoeNW7EqJsbN5LSCJtEAo/wTsqdDzkOuLqxhhNn0fRBtnPRCV/+GmGXjqOoqABpcR6ndROLJNGLSz3eunGkCKfq1zWBW4SOrpw3OkQzn00LjB0kriV7TNHNQFnDR5ZPOnKiwxdGLheDX3jLA0gwcf1QSvHQTukbOTcfT4JyKg8Rq30zJWCJd3kE2Bmxn2b90nkccFdAEadrb/wvjnt80TZzjVcyh3zhURBbUdVNpIv17b7AguFusk+jiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKH+AGtIVWdxeIQkzZpIL1BwloYSiWszQwX2BsGZg5c=;
 b=KIYMIBaMv75pk75VFWi0T495xyvaCY/Spuu2CsiK+TZgtWcaXhVI78HxqixPbnpP9AuNTr67pka5h5ND2KrPf9L08PzJVp+g5dLO3rB00/LP6DNUSxZ9c1lWhLN3khfAcPVuyBK0X2OJcdaE7QRIwqmbXUC8cAMAwq3YXAcrbZksd7ieSJZ8E3d7CB/29Ofbzx0dyE66/dtfYd6e3vkaC90p41Vgk6elfs2myj4Rx4HqjdxcL8KWCbUqqvq/Z1qfntL08Xh1pUVcXKLOkTRIt71GekfjMEr3TZZZvCQlG2qG0k/ZK7fGu8BkTvW/eWLA2W+SXfH8EvByUyWqPpaoQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Fri, 31 Mar
 2023 22:45:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 22:45:05 +0000
Date: Fri, 31 Mar 2023 15:45:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230331224503.gbvdo5l3lxhopcdv@ldmartin-desk2.lan>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
 <20230330182405.43993-5-matthew.d.roper@intel.com>
 <20230331222012.lm25bzafbq3z42nn@ldmartin-desk2.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230331222012.lm25bzafbq3z42nn@ldmartin-desk2.lan>
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: e3de5821-9f60-451a-d0d9-08db3239925b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmHz9fLCcMYfIydNj/6rP6SUj+0NXY486CPjOJlcSwUP9aeE3ibxXd6pmAiPUGiZ81V99qyrQOHefDxZ7kB6T+spmFozlhO0ywyPT8ufz+KJyxJD0Jf7ODxMDIQlQI5slRExpP9IJKe/ZaBxfGFQJR5ZEloN3CstKyDIqk1este97QHmMV+rAkRmM4eMdsSLy26YK0hPnRXnrAUJy5jmuLuwfNNR+kVeliSv6lPqEwjzmnSjFyt0gmUF8Nr0k6yV9WIJbz6RQKAhrkghLNQGN9bYdgQOAFCLFzCY//xQqvm52mNFW3UJbqEuSi+WoSqE/0zdIUaP/TFN+fPuWzYfeX9JszfWoeJls4sJxVrfzgMHdBi/ICK3DFZxxomjQVApGgSmdwnO6JIEPIJgVzc4IePMXdhZ6TPf2rMWPlU0zocLvAvy79tF5ggBmeigcqcSEd/A6kcgt5QtTlhlVgPIULEC8sw58dh3Dsy6g68eIRlutHUnShvQdSTQPaLJ1nkjH+uNSP/x1liaA9UVNooP/y9T9j5I+ZX0928mteQg+TnT43y1ECjfsn2oa0k3i/Ej
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(8676002)(8936002)(6862004)(66556008)(66946007)(66476007)(5660300002)(6486002)(41300700001)(4326008)(2906002)(6636002)(316002)(478600001)(36756003)(26005)(6506007)(1076003)(6512007)(9686003)(186003)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFo2TytneUZWNHlvaHlzcXhyakRYVjNOL0xxT1ZlT1dRVDE4dUlOQm5BQkpY?=
 =?utf-8?B?Q1hqMzNNOXNRdmN6bWZpem4wUW13dFVVTEUyMWNrbmYxSEQ2TUlCVmJPMGFB?=
 =?utf-8?B?ZENIQTdKZVNPTUF4MVVVbnlEY011UXZyenorZjVMT2RYUkFsWmhPNngyWWlk?=
 =?utf-8?B?SEJoYzlPRUtpeGVLT1Vrc1lxbFl6N0dWZloxQjJOT1o1aDd4RXBEUkNYc0JN?=
 =?utf-8?B?di8yMVhqMXozU2E3NXhGdkJ2QjZCdmM5bC9WNlZXK0d6VWN5c09zaXlRcTN3?=
 =?utf-8?B?Z2VHMGNuTk8yUHIzTDN5bzMxYTh3ekRkWmdDemtmc2Y3UmttYXZoaVRicndq?=
 =?utf-8?B?OHFURThqK3hmQklJdjdjdjB2OU0vcDM1cFIyY0RPS2NZRUxweFUxSXYxajNP?=
 =?utf-8?B?Y3dUdGtyMm5KU0JZWmZxaTdSd2FDWG5ZMldjWFRsc1M0SkpwOGo0NGw1c3ZQ?=
 =?utf-8?B?ZWpNK1k3UlRZdWhNNUwyZXVpZlk5SS9Qa3ZrUmZuVGZic0ZpQkxyNTRrMGlF?=
 =?utf-8?B?UlNEK0YrLys2OE9Ba253dVErS2JjUmxxRnRUcHpFaGtNV1pnN3lURHVvWmtk?=
 =?utf-8?B?cmNFaDNGNC8vbkNFV3VtR01FUWVaTGdGZnhscFVtaENsc2tuRlNqZjM4RFkx?=
 =?utf-8?B?SHJWZTcyWk4wa2hHV3NDYU5aemVvYjJBOWV5RTZhV3pzejBYWjRkTldZZ0Q0?=
 =?utf-8?B?V3hCVWxWaGlLdVM3T204TTBtZXBFR00yZkNKd2N1eTFHRmhNZXZpMjZyUmtk?=
 =?utf-8?B?YU92MnA3S1Rad0psU0dKc3N6S3pFL2xRSHdFQVRRd1dUWWprLzFhN0FuTFll?=
 =?utf-8?B?UFNhekhORUltNnprdEEvNGFMT21yM25HUEYrSW1CejV6b2pHVk5WQkFETjN5?=
 =?utf-8?B?OVBtYUdTUmtGS2ovbU8xWkZrWi90b3lmdW1NWG0xMy9IaU10OGFFZ3haTzVN?=
 =?utf-8?B?K1FVcU1WRW1WZ0FydVVZMTdaSjV6YXVjVHl0Q0JPTHlmZEg1QjcxMkxFcEZV?=
 =?utf-8?B?cnhZa0VqZEt6VXFjN2l3ZVIzSjVnM1NlOVptZEozQ1lBdW5lVGFjcTQ4T2pR?=
 =?utf-8?B?Ymh4cnFmWmp6MFYxWWNRK2FTQzBHUmY2dlI0ZVQ0RmJQRkRITkZOKzVKMDNx?=
 =?utf-8?B?bUk3K1ZCYUhGcVBrWVNiRkU4Q3lWV25KWVhhVlJXVXVxZ2dRMmFyR0o1S245?=
 =?utf-8?B?Z3Z6SFQybWFYdW40YW80WXIxM3A3SnF3dytpODlFTGlreDNFckozMkpiS0RX?=
 =?utf-8?B?RVVyMFJVQzBEZjdhUnlDRnB4MUM3VTkyYnp2cjdJdlA4bC9JWTBuc3pNZjMx?=
 =?utf-8?B?M2R2SzVYY2RKYWpscVRXQjN2WDMrMkFqWGR3dFhZU1NBSU5IOVhKRVdRWENz?=
 =?utf-8?B?VDZ2YnI0T1U5NnF2ZDM3NVRaSmI5Ty92SFgwTWlYTlp4Y2M2bkt0bGRnU2Fs?=
 =?utf-8?B?YXkxVStrZnRMdUJNVWNtNk5JS2VydTc2WVRodXVmRUlEVng2dEt1WDdnM3VX?=
 =?utf-8?B?WEpES3lWR0dXNzRSNGNPMmtjM01qa0orWkh2dXNFSktDYWxZK0pZT3RSZUIy?=
 =?utf-8?B?dzVJOURzM1NJdEZVcWVHVE5td050UUoxSTBBMWFNYWlRZUhjL3dGcVhVRkls?=
 =?utf-8?B?WGl3a1VIdDQySi9KNS82WVVwRzJaMUgwWFNoM3R0V3NWRzBOYnBYSWowZTlP?=
 =?utf-8?B?YW9WTFl1L1RPRC92QlNEcjROWHpYNklYL2k3anlzaUtkNURWS0NOZFhmeUJ3?=
 =?utf-8?B?WnRZU1E0S1RoU3J0SDJ6U044ZkFxcDhjejBQWFFyNHRWZUk2OTBKeXpSV3VN?=
 =?utf-8?B?c3BsQTF5MTdxRnlqMWJUT0N6VFFNWlJSU0J6NFh6bXFQVjNiTGFuRHJFSVMy?=
 =?utf-8?B?ZHRtcGtka3E0Tmg4dUlHWktQWVBiaHJidnRsZHo0cWZCU1hzRHBiSzVpelpR?=
 =?utf-8?B?OVpseDdHUWdEdTNTbUw0WExLMHhIeEIyMXd2SGozTzBMQXh5ek5YOHlodE13?=
 =?utf-8?B?NkNHZEtzcVkzeTVVY3U3UDg3bStpWlNmbUtybUhZVzFhMGc5empSWG5VdGJi?=
 =?utf-8?B?YjJ2K2NOUFAzRVR0MzBoSVVQNUdOWmdtTFBycWswL1BWWHErYWp2V0VMRmY3?=
 =?utf-8?B?NExTUW5KQ1pSRWZLdlhFRy9oUExrNlNiSW9aU1Y1bkp0NTV5VFBnNGR5Lys3?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3de5821-9f60-451a-d0d9-08db3239925b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 22:45:05.5604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWaNyAboWBp7hR8p0ZdA1KdkqAA3+JbRA3njz2PtLUin6gHIyTJLFQ00kMN+G174ZiDzDMwhhL5x6pJxHRm3+7aSGX1kVxH5vGw/K6pMWQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/8] drm/xe/irq: Drop unnecessary GEN11_ and
 GEN12_ register prefixes
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

On Fri, Mar 31, 2023 at 03:20:12PM -0700, Lucas De Marchi wrote:
>On Thu, Mar 30, 2023 at 11:24:01AM -0700, Matt Roper wrote:
>>Any interrupt registers that were introduced by platforms i915
>>considered to be "gen11" or "gen12" are present on all platforms that
>>the Xe driver supports; drop the unnecessary prefixes.
>>
>>While working in the area, also convert a few open-coded bit
>>manipulations over to REG_BIT and REG_FIELD_GET notation.
>>
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>---
>>drivers/gpu/drm/xe/regs/xe_gt_regs.h |  42 +++++------
>>drivers/gpu/drm/xe/regs/xe_regs.h    |  12 +--
>
>I was thinking more on an approach of cleaning up the entire driver:
>get all the defines from regs/* that have the GEN*_ or _GEN* suffix and
>drop the suffix.
>
>I wrote it some time ago, but was having some issues with display/
>failing to compile because of that (some of the ifdef's inside i915 use
>our register defines).
>
>Since this is done for irq, with more contained changes, I won't oppose
>though. It's going in the right direction.
>
>Checked with --color-words and it does what it says

but fails to build:

../drivers/gpu/drm/xe/xe_display.c: In function ‘xe_display_irq_handler’:
../drivers/gpu/drm/xe/xe_display.c:278:26: error: ‘GEN11_DISPLAY_IRQ’ undeclared (first use in this function); did you mean ‘DISPLAY_IRQ’?
   278 |         if (master_ctl & GEN11_DISPLAY_IRQ)
       |                          ^~~~~~~~~~~~~~~~~
       |                          DISPLAY_IRQ


Lucas De Marchi
