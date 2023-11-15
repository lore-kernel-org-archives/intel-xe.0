Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF41C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 17:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0366210E0D2;
	Wed, 15 Nov 2023 17:58:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B41210E0D2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 17:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700071128; x=1731607128;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ANj9ThLQF/6WbfUSocWGmkQZXMgTM7RRmCD5/33M5hA=;
 b=QumWIizzd/WvrXnmu/CYtpBuLMMiQqQh0RJ0b9FPLwe+GXB9jNTNrg+g
 ONBarI6V9mn4BRE1f/4CF7Z7pSkuGpsKA/VoZZM3wrxBzuN5hPOSXBo8m
 0hJxuMbtBvhtD4PQ54KPI+gHFidVwfjyMbE0TTKg/U9uuUTZnph+lUZrj
 vGU8ljPno9vgiYnyMybBhvTKwKmVLjiTi+xmN5DP5Iia/KXowTID2+xhB
 H+e/RQeAIy/4SH+ptKiVFWEJYzWm9VpVVkHK5MOeLgv9mCatVQI6nZF/f
 i+WM56qPyFICeaeWhN6AEpGC/idGLSq1575Xm7QFAJXw0c/8hrhSap19/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12473656"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="12473656"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 09:58:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="835468641"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="835468641"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 09:58:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 09:58:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 09:58:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 09:58:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwHN48WPj4krfX5e5ZahtlJvIJXWA6O4IVthhxMNJG5t6xRbQ181Gy9CTQLnSfMEpYUt8hr6uHX4mZoArJV2mF6lrZJshyXL0naIFpmmyaJSgeRXFOYmt0sx/dU8l7HeFQ7jFGHF4R2FJFA3TzYHhqFylfwMjIx4Nx7DwtIVCBwxvUoJZ4FM7kl350cSCZNy5xvuuvCoz4FgaIfo3q3uB+Z09kyFTkr8Y3nCXWGMOg4KJIXe1Lrmeu4uNe3EuvJnDViwoYMDOOp0Xkn85HLGKsu/RkTiGHwyErtPkZDv1ZPBi4HiSgQPgn4MzV1td6kMnE/9LF6vMeckePFAGsKUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SO5IZ8sTjkRX+USO7MpR6YXdzqvWx6Q1lqSGrhUj/v8=;
 b=Lg/mwl+FyTDT7rkLZw6uj8PkDoaXO92t4Dc21rPAMS2N8n0ZC0mN4WalRTwEyjho4dJR9n1jW+iQmEwkw+1yH5RuCZya9xIQSOqJ6zr7QWmBJi2r+XXwN8I0TkJXEzCpcf6oozL5mZcJO1hFTqPpFDXVbp386qbWPZ3hUhdXI32RKFznN/qD+TE2bFEwwfU9XT5icdGqp54J3FTpcxK4GYEJwKWtPDJMPuK+oa4kjNFRDsCeunu75eY7b08vHaLMMPGvpjXKnvbq+y/zLh7tHvqaQSRUnnq6yitNeEfits4ePtOH3ucLTQqPeSMgvITcjSNYAzeYwO9WedGM7wbV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Wed, 15 Nov
 2023 17:58:44 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c%7]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 17:58:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <y2icpwmp4huod7wsfg3ln4e7bxm2ezgiutgqqcvwcfpqxzruvp@jzrwflkzsx2h>
References: <20231114220922.88268-1-gustavo.sousa@intel.com>
 <y2icpwmp4huod7wsfg3ln4e7bxm2ezgiutgqqcvwcfpqxzruvp@jzrwflkzsx2h>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed, 15 Nov 2023 14:58:37 -0300
Message-ID: <170007111735.1634.7618023957528021915@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:303:b6::15) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DM4PR11MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f8ceaa-7452-4ce8-a35d-08dbe6048187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vvTA0aU/Cnyeh7OIERXmkPqECXe61RYR+yI3Q8CW/tnsJaBCYPDdjKLHMsNg8ZtUn9h/X2swBCgoq0Gu50koCrp2PIj19G3nwX7BHmCh4Wti0HPHHbpACTmzcpa8ccefBDPVvV6sO7lg3dGoWUbFvh9N+JkQIvUt7h35fzRVd/a2wNSfPBKFWwSsx9d5iDm24BgQfmOegd7xeoOces5/DlQUVMJW5l+dK/2dmXy3cCVH47t4nDOcOwqd6vIHp/lk0hi90JhM/H2ffMlB1dZTW6Vm2mU2tgCKT6HkOIqF8tKkyJTVZFLK1lIsNWPqGqc6La4no6ypx9rm9LezrC+qPdW8xAA0dlhUcyZHTb3FsPQ+Kb2ieVcGdLiDluI1DPYL4d0QTHxFbvuB8qPHE1Vp2y9YdCGSjqzZ9zkw1UEpXETPivyfexrsFq3dbVIBxzj2DOXX/xQIrIvWxCc743PAMNoAT/Ua9azBYnatvIPxSiJDM1eOIX2vYSNcaHb9yby5Wql+WNDrSwamYEYhou8p4aKVi/u6TJbrrK4jGLzaJHFdHGlu5IZhhP7p8jpp6+MT018l/zulZcQcQWNeN3uRuXhHKVYl8k7gtih4zkyhaRyKW7B7s4Z3strIVkulGYYs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(376002)(136003)(39860400002)(396003)(230173577357003)(230273577357003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(41300700001)(9686003)(6512007)(107886003)(44832011)(26005)(4326008)(8936002)(83380400001)(8676002)(6862004)(2906002)(6666004)(4001150100001)(478600001)(6486002)(38100700002)(6506007)(5660300002)(82960400001)(316002)(66476007)(66946007)(6636002)(66556008)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk1YSGZSaUhnemtIM1RoYjhWOUpHREdWYVdmbGFJczlQTmZNNy85VndWaEhY?=
 =?utf-8?B?NmxhZ2o1YUFTZ0t3dTYwbnlxRXo5Zms0SEZXNGhPVWVFWEREQlo5cmF1bUl5?=
 =?utf-8?B?LzFZeFFIS1lTMGNvMFdhL3krYWhMazZNWEVmckkwb1crQzRTVUxtaEhQTnBq?=
 =?utf-8?B?Uytvb1QxcmdvNjhPYkRvVkJnSTEwZTJSUzRLS3hlK252d1c2RmFVQStkTlUv?=
 =?utf-8?B?VmlmUGRaZzIwYmoxQWE2WmFXc3kzaVlIb3VnTjhmbERDSnU2K3I1OVY5NURW?=
 =?utf-8?B?RDlacStMKzNEaXdZZFBUb0RUWGJiQVV6b09BaHBPOFRxbGJTb05YMjhieSsr?=
 =?utf-8?B?eGwwVFlkSFk3eHNZMXkxNmp5bG1CSFdDL3RqZHRuRU9QNDFnU3JickZzSDhJ?=
 =?utf-8?B?UGg2ZVE5T0R5TDVoRi9EZ29COWZYSEtsNWdiaDU1WWcyaExXeXB3V3M2eTJu?=
 =?utf-8?B?VnZqVDlkVnVDZTY0REYxNVJwa0FUMmYxTmpORG5EWFc2QmNTd0Zoa3RsTG1o?=
 =?utf-8?B?Q094ekhEV0pYRlVrSzN1amFQMXpRK09oUjhac0VKUE5uOTdqM1F1YVhMVGVR?=
 =?utf-8?B?Y1JXVXoxTGFmTDU2a0x3VFdtVTZrRWRZdHBUN3FDK3dMNVI4d2pibXM3NEZz?=
 =?utf-8?B?VGNZRkZEUTlYZTJneW5ZUGIvaEpGQk1EbGlLSU94M2JBM2lZaXhha0hKVzRR?=
 =?utf-8?B?ZUJnUDN5SDZxU3V0eUErWXR6Rk1ubFRUZjR5WHRwWkMwNGFvVWN6dUdOM1V5?=
 =?utf-8?B?dUtVTnVIcVlQZ0JKMytFQjNWSHJReitpSkFHOXRDUzVwcjM5cWd2OW9jVVZj?=
 =?utf-8?B?SmN2SWVTUE43K3REVW1ER0xPTEcxdUIzRVZacGczNmJvTHI5dGZnWUNxYkcx?=
 =?utf-8?B?RVVDbjBCTFFqMmtvL2NabmNTNWZWVFNZSmhDUjAxYllHc2hmV0habi9waFRX?=
 =?utf-8?B?NjNua0c4cDM4YTJJM1Vtd3hNK25WZlB5cE5yckgwNXphWDR3UjE5eDROeGw0?=
 =?utf-8?B?SERQcStSWTJEQXNxaHpQVzNnc0VyNDRMZ2ZDVVJKdmRaTlkzL0EyUCtsQzV6?=
 =?utf-8?B?Zlk2LzFmR1VEZGRiTEZvOS9ZMWZpL0NrMmZSMk5zbHBiclFHWkNsd1Zrem1V?=
 =?utf-8?B?aHhaTHhIRUdjZTl4c0RZbGgrOUFRYmZHZW9oUEl5OTBJdElZSU9WbU1ZeDBa?=
 =?utf-8?B?bEdoWjZKZVJJWFhUem1HSElBelRUTG0zeTZFZlQvTWd5K01ERXliYnN1WTl5?=
 =?utf-8?B?UGFGOVRVUUM5YVpUSHdzVzA0QzRVQXcyWVhYUDF6Wkhjb1ZyWEw5aDM2UUtz?=
 =?utf-8?B?SUozRHEwMVlzMVpISFZ3blBoWVJnb1FNS2ZwKzVsTHpFR1lnM3o5K0t2clk3?=
 =?utf-8?B?bXEyczRWNGF1eGhRd3ZVbks0dVgrTmNZalZmNXJ2WVpQNUZiemhwWksvTzJi?=
 =?utf-8?B?VDFRa3VwSkl5SC93b1RSVmEzcktXWm9xVHR2UnpjWVZoWExPUnpNamd6Z1l2?=
 =?utf-8?B?dXBLMUc4WHdsWENmMktVdmluVC9rWXV2bEdlWHNqVDkzM2g3WkNUZmJkSmp3?=
 =?utf-8?B?WlhqMFo2djhVWTRiaENFVWNhU2grUUNJTHBuN1c1T3BrVXVtaHJTMnpwUDBl?=
 =?utf-8?B?cW0vai9wVjlXb2V6b1lVNm5YSUxHK0lpbUI0eEdhQmloUUx1L3FFU3dCUlVi?=
 =?utf-8?B?SjV5K1Z2WUN1bGpmVWZRK1V3L2V4MFRtL1NHbGVOOHFCaWRONGl6bTNOZ1RD?=
 =?utf-8?B?eHgrUUxCdjljc3BVUDhHOVdBQ3djYWJDWGNRaXhVbEk4cTEwaVpjN0NyRldZ?=
 =?utf-8?B?RlY5MXFHaFhRcFpGL1NCNFZPbzcwc0l0YURhcVRzdisrQ09vV3lFT2VIdml2?=
 =?utf-8?B?bi9KelMvbldYaHMwMXI4VVJSbXJvV1g4YjF6TWZOT0sxU05qTnlBREZuVU9U?=
 =?utf-8?B?SldSU3B2SW5UMjgzdWJnYzJEY0RiczdzMzQ2ZjhjTEdMZ2pEdTMxNEtwMWNS?=
 =?utf-8?B?YXlobkJkbjVmOE13ekxrd0cwMkFxSC9RZld3RkhmclJwa1RpMFdOV01ERita?=
 =?utf-8?B?RHowRTdOZHB3bmlyWmFjaWI4WUxIR3M5YjRhZDc1TFQ4UDN1SGYyMCswVmxr?=
 =?utf-8?B?a2ZUa0dGblpyS1JGeTNxbmJrR1NQRUpIazlic3VLZVdqWkRDS01EM1Y3OHNE?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f8ceaa-7452-4ce8-a35d-08dbe6048187
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 17:58:43.4725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j71fIvZitvysJqzpcP/upKq/0Q5Tzmp/h3YHnDSas5lJacSYY59j9V/sy0XBu4q7um2R03LXxa0/BoIX7mvuVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mmio: Make xe_mmio_wait32() aware of
 interrupts
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-11-15 13:51:41-03:00)
>On Tue, Nov 14, 2023 at 07:09:22PM -0300, Gustavo Sousa wrote:
>>With the current implementation, a preemption or other kind of interrupt
>>might happen between xe_mmio_read32() and ktime_get_raw(). Such an
>>interruption (specially in the case of preemption) might be long enough
>>to cause a timeout without giving a chance of a new check on the
>>register value on a next iteration, which would have happened otherwise.
>>
>>This issue causes some sporadic timeouts in some code paths. As an
>>example, we were experiencing some rare timeouts when waiting for PLL
>>unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
>>we found out that the PLL unlock was happening within the expected time
>>period (20us), which suggested a bug in xe_mmio_wait32().
>>
>>To fix the issue, ensure that we call ktime_get_raw() to get the current
>>time before we check the register value. This allows for a last check
>>after a timeout and covers the case where the it is caused by some
>>preemption/interrupt.
>>
>>This change was tested with the aforementioned PLL unlocking code path.
>>Experiments showed that, before this change, we observed reported
>>timeouts in 54 of 5000 runs; and, after this change, no timeouts were
>>reported in 5000 runs.
>
>good find :)
>
>>
>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_mmio.h | 11 ++++++++++-
>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>index ae09f777d711..4d0e816a81ac 100644
>>--- a/drivers/gpu/drm/xe/xe_mmio.h
>>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>>@@ -98,13 +98,22 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, st=
ruct xe_reg reg, u32 mask,
>>         u32 read;
>>
>>         for (;;) {
>>+                cur =3D ktime_get_raw();
>>+
>>+                /*
>>+                 * Keep the compiler from re-ordering calls to ktime_get=
_raw()
>>+                 * and xe_mmio_read32(): reading the current time after =
reading
>>+                 * register has the potential for "fake timeouts" due to
>>+                 * preemption/interrupts in between the two.
>>+                 */
>>+                barrier();
>
>we are only protecting here against the compiler reordering this. I
>don't think it will due to the external call to ktime_get_raw(). Do you
>get any failures if you remove the barrier?

Makes sense.

I put the barrier here to be sure that the compiler doesn't surprise us, bu=
t I
haven't tested without it. Maybe it is not really necessary indeed...

>
>Anyway, we probably don't need a full barrier and just using
>WRITE_ONCE() for both would be more appropriate.
>
>I wonder if we could do this logic better and have a header / wait /
>tail approach. In both header and tail we read the mmio and don't
>care if timeout occurred.

Yeah. I was thinking about a something similar, but ended up sending this w=
ay to
have a single place doing the register read.

The difference from your suggestion is that is that I was thinking about
adding an extra read once out of the loop in case ret is still non-zero.
Basically something like below (the patch below would be a substitute for t=
his
one):

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index ae09f777d711..2b65d8387cd1 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -118,6 +118,12 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, str=
uct xe_reg reg, u32 mask,
 		wait <<=3D 1;
 	}
=20
+	if (ret !=3D 0) {
+		read =3D xe_mmio_read32(gt, reg);
+		if ((read & mask) =3D=3D val)
+			ret =3D 0;
+	}
+
 	if (out_val)
 		*out_val =3D read;
=20
--
Gustavo Sousa

>
>+Rodrigo, shouldn't we move this to a .c? IMO it's very big for a
>inline.
>
>Lucas De Marchi
>
>>+
>>                 read =3D xe_mmio_read32(gt, reg);
>>                 if ((read & mask) =3D=3D val) {
>>                         ret =3D 0;
>>                         break;
>>                 }
>>
>>-                cur =3D ktime_get_raw();
>>                 if (!ktime_before(cur, end))
>>                         break;
>>
>>--=20
>>2.42.0
>>
