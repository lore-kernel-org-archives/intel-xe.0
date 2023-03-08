Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22F2C678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 07:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD57C10E59C;
	Wed,  8 Mar 2023 07:23:58 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C29710E59C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678260237; x=1709796237;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=spL51gRA5U0zTDPguVdwHV3sjEf6elgYWE2Y71tlGss=;
 b=NmyGDsH8NfE+KCKN8VMUHrOW9E9wtQjcN7KRcvw1b1JhIFDS2QGJyn3r
 K/mVnnzFVxeaOsTF/81Dn4na5vOYO1YeFb2vt9Y+IEhbrog7urbK15FDD
 ba3/brD7asDDCYu7NB/CXAu0xEfMuM3+Kyr8JnquBEkr0yVA6tO/yoFng
 Qvp+mussPP534G6907kgVZppslkN/QLp0dzRp3cm/JGIG2UdfPbDP9xyG
 Urd9/RUe9SlmojSCVGbwKCP1g2CLo1Ql6pvQjDjxImSKI7A/6eKAfpwvg
 PDFKpcUhQYfQA+rgLdw7u/7ku+DM6lH70AfQoPcpp1W/4t/lVJrJUrZLQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400910697"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="400910697"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 23:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006209483"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="1006209483"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 07 Mar 2023 23:23:56 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 23:23:55 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 23:23:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 23:23:55 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 23:23:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9CyPgOBtygNAAKE+FZ1cjParbY62WyV4oYCTbIZYAdMSHN0Cz8A2ZdGiYWRdM1KR69+w5xyfTKahEiUewukWdvzoNEfpK4uAS5KEsEY1Yqr87BedNsfVVMtgVEoVOCG2zR/6JF+V/usjh8HfOHuxlqbeJhwU0xfVuKf2ANN3S4gfrp9yFmDxLPOoN8VwFOixt7vwFPbA3BFGA+AbNfka6mHzBlGlM4AuV5nMbdArCqzcJ4VUbo9WYw7arONGxI414tIXsWiT0qfeS1UrIbTSEKmhAoJhIlz6Ojgl4fhAeZDG4de4dUDTZbxF7IHGxrnPnxoByjaxP09W0fbOXs1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SM95zD4pZv0BxWpVMhZrPmcDFpo7VZ4+ws5Ty8gSivg=;
 b=gbFSLEZDCr3cS3VxJxtIlMZ7SL/aoR+idNU+cSarW9ZyvHXHxa66R7M6HQOo1/yDiLgb6KhssMMj1Gfo5UeHk9tdngpu7r5usN9AMjtG89f72Ea+zvxBTypel91ucpLN+5mcgcLZTb6v8hvTz/OgFQom0yFnS8AltlYEPPXF34TIEvBERe6G2VPARgWspFrc4kGNot1TIws8CkqaNSCkAb83hZAmqt3gbAwtcaALJKwfu1Su4kR40kz/5lP0XY7pxmxLinVjSo8SheMoRO9zoYVxPm+dP9wfe8HKTnJ4l3X8bHr76wBaY3Xp10soWhHhzNiOUDXbYeL6Tx3lZv4HGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 BN0PR11MB5693.namprd11.prod.outlook.com (2603:10b6:408:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 07:23:53 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f%2]) with mapi id 15.20.6156.023; Wed, 8 Mar 2023
 07:23:53 +0000
Date: Wed, 8 Mar 2023 12:53:42 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZAg3/nLdxx6cBavU@bvivekan-mobl>
References: <20230307080916.275289-1-balasubramani.vivekanandan@intel.com>
 <ac35f9fd-5be8-c388-e780-7286a1e2f218@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ac35f9fd-5be8-c388-e780-7286a1e2f218@linux.intel.com>
X-ClientProxiedBy: PN2PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::29) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|BN0PR11MB5693:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e301bb6-9294-4647-3c17-08db1fa611d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9f6lab5r766GyEpgbJxfPJ9tsXjwJXRuWApx7xaBkE/FgI7H/7Z5D/pRtM6aU15mpXIKPVwIc0SfLXLfEN3/xs2HpP1MdTlXWXgqynYwku+Ys9kMcbCy8zy2Ef+Pm+uaeWcIBXG4Rzqj88NlZkZ9oSZXHxWA4vNrvQJhlsHc6axUweXdKNFT7+AycsouCGSBiNsxZVW2+GXkPI20ybvqfHojNrnqnmHR4gab09ilPb9FkF5s4hRVXLURjB558s4D/yPhuwca2rydcRE9pRzQvUKYKKjV5M/y7snmZtyserO+LZsAn5LWbPodFHEiolM9GlqGnj0Aat0i0mHPJAFr0VCgAhXs5hwv8bCfxQAYJspgorkG61ZwFAdUckfrfEvHpz6dSwO3JwqPTpIJ8rL3FuHuXznb5fXfkZ6AXwrVmfaUZqhrDcWAxbDqT6zwi9k7gRDP6xW7lQVhOUZ/0xuqmHx2LVF3X49mBiZd/ybA9HFF2atBChclF3EPJLl5mEogMEAfqRM+r8RPO5kqSNUV7RZVbDnHC/6HGJNibuMim1akDVNcnRfTp1Kj8xwkalhLa8YaHwcFL7pzkeLGq1F+g4q2Ptevc1Upwmcpc8I2XYMOzat1YQOWtIHZfZXbGPvRtvRglmDncJFBDS6q9UjPKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199018)(54906003)(478600001)(6486002)(316002)(8936002)(5660300002)(2906002)(66946007)(66556008)(66476007)(8676002)(4326008)(41300700001)(44832011)(6666004)(82960400001)(86362001)(38100700002)(9686003)(186003)(33716001)(53546011)(6512007)(6506007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THRtS2ZNVldyNjVZcnYwSERIaWRjc2lvK1JiTFl4KzF3bDN1azgwWFdxc1Yz?=
 =?utf-8?B?V0czOVR1UGpzMS9zMUd6TkV3WERsemNKQ1k0amJxRWpDSGdNYkhzY0xLSlNL?=
 =?utf-8?B?S0dIMEJRcHhrQmxMVWl4ZjhDa3JLTng1Ukx0OE5KWnJBZTJaVHV0akFnMmdP?=
 =?utf-8?B?cjNiejNNaFlrR2hQRllrbG1XV2YvVkcxVzBGY0t5bDgvQlE4SXRXbkpsVGtH?=
 =?utf-8?B?SHhsZGRDbEQzTGVoc3o0L04yMUFJa3R5RnNGZGJCbXVFZVlOeDJSTG1mZ0or?=
 =?utf-8?B?eFhYSnZCdC8xQi9iQzJFSjk1YzZyVWtaWmFwS3ZieTJjNCt1c0RDM2NjVTRQ?=
 =?utf-8?B?WlhQQ212VjhyM1FHU0t3cWNQS1VkQzN3M2gwRFl2WFUyQzkwR0p4cDM3OHpB?=
 =?utf-8?B?MmVBZUdzT1JyZkNQZmNtZE0wcjRKSVJmK2dTWk1UUG5hd1hYZUFHckF0L0dx?=
 =?utf-8?B?YXFHalBDWjN1cmdLcmFSUnlKNnl2NG9EWEtCOWhtWkhmN2ZXZnBDV0I5NWZx?=
 =?utf-8?B?aTZpUWJaUGdmQUdkWm9MR293NGJmVzBnQ0lhNkNQWDhac2lkL1Q0enZubDQ0?=
 =?utf-8?B?Z1NTbHppaWRoL0J3ZmVDekM5bHEycCt0S3BpMy9EOXNEWmV3UzlrQUNmS3hn?=
 =?utf-8?B?WXpSYTNqbENySW92Y0hwSlFoZjZYVkVmZlJoaCtwNlFhQTNDamZRWCtlNVlu?=
 =?utf-8?B?VjdDdXJ4ZW9hcmFOVUNZR1RVaDBOZEp0NmhjalJ0L0Z5cnIyaVVUZzJ2RCtN?=
 =?utf-8?B?TXJIaG04Z2VDWlRCWFhJSlo2dG9GdkxranhnY29tRVc1eE5NS2tLMis2Wmhp?=
 =?utf-8?B?ZHZIU1NhaWxpR0xNa1JsdVloU21scmJna1Y2eS9qRnREUi8yQ3FsdXpSckFT?=
 =?utf-8?B?WUlLd0hLSW0rMTZkN3pOWTRqN3N3M3AzWHJpQW9IbDBKd2liZVY1NUh3Wlp2?=
 =?utf-8?B?VXZYVURlNWIwY0k0VzloekYwR3lnSlU2N3N1ZTVHTks1MGs2UU1UV3JKWU9M?=
 =?utf-8?B?dXFBaERXQnMxUGhTa1BNSjAyWk8yckRoUU1tQUJ6NFRtMDQvbHIza0lQRnVC?=
 =?utf-8?B?UTRvOFNKQVlMQjQvc055N0dCeW1zVUtmaDNUU0Y1dHlha20rK0NrNUtzTUF6?=
 =?utf-8?B?UktBVGU5K1pNTTFWdHNORUl2ekw2L0tvZm5YZEcxbWo2dmF4RW9lMnNoMlA2?=
 =?utf-8?B?cDFXc0V1OG80dUJwMmZ3cWxDTmZaSzkvWi9QMVJJUkE5OWhaeTJNMU9wL1VU?=
 =?utf-8?B?akVlcGlLRjd5eU9LczJtRmx3WWRhQTlSTUxaVEQrVi9xQklnR2VWVFFSUVpK?=
 =?utf-8?B?d3o3Zm5uWDI5bHlSTGxqeHVoNUZPejVocXo1VmdyTHFFNnFSOVo4MkM2ajI3?=
 =?utf-8?B?UDh0Sm05cmxpcFZrS2dIUkliN013U1J6cE9EYUt2UkYwbzhRNXB4STBDcW9o?=
 =?utf-8?B?YXlMaFZYd1lNbUNPeGNVRmZMT1Q2cGRGRENJd1RVQ2xlRnc3SllMcWV1MmVO?=
 =?utf-8?B?ZVNYa2QzSDV3QkdhSTVPZlFKRktRZ28ydTRmUng0T2FkVzEvRlI5SERQUTdj?=
 =?utf-8?B?Z2hFUWxaMzNicGpQVEFScjhDSHkvZEdsOVErc1QvMkdHZjlLa3NGVVVsYU1j?=
 =?utf-8?B?N1NFTkFQVlRLajRqYjJ3U2pVUE92dUdDVU03SXlJUmJZOURhZTZ4dTBXaFUx?=
 =?utf-8?B?V2ZQQ2duT3lSdVFuK251VTYrV244Y1FxdmxRb2hGSXBXRGlmZENHSXQ0enhH?=
 =?utf-8?B?U1JxcmhraG5ZdkVmRmZYNUVCWE04UUpRakFRczh4d0IzR3RqS0Rrek8vdGhQ?=
 =?utf-8?B?ZzNJL2NzWFVrOUU1TUpuWmVKZE1ZbFlrdFIxVytranlqbFA4bGpPQng1alJX?=
 =?utf-8?B?RC9LOVJlbUZwZ3ZNZmxEejFIeDRZZ3BCcVd6R3JKS252UVhvZU5mVnZ4Sk52?=
 =?utf-8?B?TEFkUDBnZGVYWi9mS0RlTkpqNFgrdjVGeFl3SWJBa01Sa01xK3ArTmI1bEJs?=
 =?utf-8?B?QzVsRzZrNkx4Rm1ZRlFuQU5FZ01zSW16UzVHZU16R3hNdVNPa1dRYXRmMUhr?=
 =?utf-8?B?Z1FPK1JiRFU1czZqQlZ3YlRJcEY5dSt1dThEQXJRSTRRb0E5cnQybGI1d1Rk?=
 =?utf-8?B?YmMxenhJczQyZktPUmpQTUJiUkVoUllTNGkvQ3JEWUx3eE9zTzBDY0VncHdJ?=
 =?utf-8?Q?FDFgpxIW2GK538DL0jMtYqEC6ssi0ZeXAW/MSOf42U/1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e301bb6-9294-4647-3c17-08db1fa611d2
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 07:23:53.1454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UK87zh8UxC8/63eNEq7ou4UKbYa5SW1DPRddYLau0yj0tYP8JlVfla1cYB0F1L54b1H2pWG3WouWxipL9XYRdRc99sIB1izQYnC7XRLcNFkqVusgoAx24+TNt6e26NYA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5693
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Skip XY_FAST_COLOR instruction on
 link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 07.03.2023 17:17, Maarten Lankhorst wrote:
> 
> On 2023-03-07 09:09, Balasubramani Vivekanandan wrote:
> > Link copy engines doesn't support the XY_FAST_COLOR instruction.
> > Currently this instruction is used only at one place to clear a ttm
> > resource while migrating a BO.
> > A new device_info member is created to know if a platform has link copy
> > engine. If it supports, then instead of using XY_FAST_COLOR instruction,
> > MEM_SET is used which is available both in main and link copy engines.
> > 
> > BSpec: 68433
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >   drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
> >   drivers/gpu/drm/xe/xe_device_types.h      |  2 +
> >   drivers/gpu/drm/xe/xe_migrate.c           | 65 ++++++++++++++++-------
> >   drivers/gpu/drm/xe/xe_pci.c               |  4 ++
> >   4 files changed, 60 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > index 288576035ce3..df9ed4fbf2bf 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > @@ -6,6 +6,8 @@
> >   #ifndef _XE_GPU_COMMANDS_H_
> >   #define _XE_GPU_COMMANDS_H_
> > +#include "regs/xe_reg_defs.h"
> > +
> >   #define INSTR_CLIENT_SHIFT      29
> >   #define   INSTR_MI_CLIENT       0x0
> >   #define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
> > @@ -56,6 +58,13 @@
> >   #define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
> >   #define   BLT_DEPTH_32			(3<<24)
> > +#define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
> > +#define   PVC_MEM_SET_CMD_LEN_DW	7
> > +#define   PVC_MS_MATRIX			REG_BIT(17)
> > +/* Bspec lists field as [6:0], but index alone is from [6:1] */
> > +#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
> > +#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)
> > +
> >   #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
> >   #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
> >   #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 199bd37fce9a..a73c5e1d7503 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -95,6 +95,8 @@ struct xe_device {
> >   		bool has_4tile;
> >   		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> >   		bool has_range_tlb_invalidation;
> > +		/** @has_link_copy_engines: Whether the platform has link copy engines */
> > +		bool has_link_copy_engine;
> >   		/** @enable_display: display enabled */
> >   		bool enable_display;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index bc69ec17d5ad..59fd588a1faf 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -750,32 +750,57 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> >   		      u32 size, u32 pitch, u32 value, bool is_vram)
> >   {
> >   	u32 *cs = bb->cs + bb->len;
> > -	u32 len = XY_FAST_COLOR_BLT_DW;
> > +	u32 len;
> >   	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
> > +	struct xe_device *xe = gt_to_xe(gt);
> > -	if (GRAPHICS_VERx100(gt->xe) < 1250)
> > -		len = 11;
> > -
> > -	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> > -		(len - 2);
> > -	*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
> > -		(pitch - 1);
> > -	*cs++ = 0;
> > -	*cs++ = (size / pitch) << 16 | pitch / 4;
> > -	*cs++ = lower_32_bits(src_ofs);
> > -	*cs++ = upper_32_bits(src_ofs);
> > -	*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> > -	*cs++ = value;
> > -	*cs++ = 0;
> > -	*cs++ = 0;
> > -	*cs++ = 0;
> > -
> > -	if (len > 11) {
> > -		*cs++ = 0;
> > +	if (xe->info.has_link_copy_engine) {
> > +		/* MEM_SET command supports setting only 8-bit value.
> > +		 * This function is currently used only to clear the address
> > +		 * range.  So the value agrument is not really used. Need to
> > +		 * have a better handling when there is a need to actually set
> > +		 * a value. Print a warning if a value bigger than 8-bit is
> > +		 * passed
> > +		 */
> > +		XE_WARN_ON(value > U8_MAX);
> 
> I would change it to if (value); 0xffffffff would likely work for example,
> but is bigger than U8_MAX.

I gave a thought about changing to `if (value)` but dropped it because
it would then restrict the function emit_clear() to only clear and not
set any value. Though emit_clear() is currently used in the driver to
only clear the memory region, there are some kunit test which try
setting different values. 

0xFFFFFFFF was caught by the warning. Confirmed through testing.

Regards,
Bala

> 
> ~Maarten
> 
> > +
> > +		len = PVC_MEM_SET_CMD_LEN_DW;
> > +
> > +		*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX |
> > +				(PVC_MEM_SET_CMD_LEN_DW - 2);
> > +		*cs++ = pitch - 1;
> > +		*cs++ = (size / pitch) - 1;
> > +		*cs++ = pitch - 1;
> > +		*cs++ = lower_32_bits(src_ofs);
> > +		*cs++ = upper_32_bits(src_ofs);
> > +		*cs++ = FIELD_PREP(PVC_MS_DATA_FIELD, value) |
> > +				FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
> > +	} else {
> > +		len = XY_FAST_COLOR_BLT_DW;
> > +		if (GRAPHICS_VERx100(gt->xe) < 1250)
> > +			len = 11;
> > +
> > +		*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> > +			(len - 2);
> > +		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
> > +			(pitch - 1);
> >   		*cs++ = 0;
> > +		*cs++ = (size / pitch) << 16 | pitch / 4;
> > +		*cs++ = lower_32_bits(src_ofs);
> > +		*cs++ = upper_32_bits(src_ofs);
> > +		*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> > +		*cs++ = value;
> >   		*cs++ = 0;
> >   		*cs++ = 0;
> >   		*cs++ = 0;
> > +
> > +		if (len > 11) {
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +		}
> >   	}
> >   	XE_BUG_ON(cs - bb->cs != len + bb->len);
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index c4d9fd2e7b2b..e555f13395ab 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -72,6 +72,8 @@ struct xe_device_desc {
> >   	bool has_4tile;
> >   	bool has_range_tlb_invalidation;
> >   	bool has_asid;
> > +
> > +	bool has_link_copy_engine;
> >   };
> >   __diag_push();
> > @@ -224,6 +226,7 @@ static const struct xe_device_desc pvc_desc = {
> >   	.vm_max_level = 4,
> >   	.supports_usm = true,
> >   	.has_asid = true,
> > +	.has_link_copy_engine = true,
> >   };
> >   #define MTL_MEDIA_ENGINES \
> > @@ -413,6 +416,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >   	xe->info.has_flat_ccs = desc->has_flat_ccs;
> >   	xe->info.has_4tile = desc->has_4tile;
> >   	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
> > +	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
> >   	spd = subplatform_get(xe, desc);
> >   	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
