Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BD9E748E5
	for <intel-xe@archiver.kernel.org>; Sat, 30 Sep 2023 20:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E22D10E033;
	Sat, 30 Sep 2023 20:11:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F8E10E033
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Sep 2023 20:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696104695; x=1727640695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tFjrPDuUFKzuFPHO1ZzeW0KmQGheEJFYWJl+A7i+zRo=;
 b=WXiSAFODB/KgyXQZ7p8SOtaUm6GJVIS7Rxo7VdLecVugiQ0WLqt7jIVW
 /ouNvsNB2sA2JH8dU8/6LgezfV7fIi2iz5+o5QaTvXX55mS3Szr1wD7vF
 q8YRZ/HOtN+VMCOhxhuFlaNlH28zMhMfFjBfk7Vxh3Qr2JOWKY39TXJgH
 +0ivqqijk0TWQhdRil9CWWirlFkqYiX53u7bEROpB3TfvGN3TZlcdJdmR
 YzwnYgsSMpJPSInnOSpnGZN7/BPqwwiosWLCF25SQw2pL8jv1XhssTJKm
 xvtHl3htPf2O9mldQv9oppCrznepZ3DCPiNBl+Kz/e7UgrJPXUluXM6E4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="372822292"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; d="scan'208";a="372822292"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2023 13:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="923879609"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; d="scan'208";a="923879609"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2023 13:11:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 30 Sep 2023 13:11:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 30 Sep 2023 13:11:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sat, 30 Sep 2023 13:11:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sat, 30 Sep 2023 13:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2n/fZeEeeDoQopudJtKUAcP3gC5wOEnFAjy1DLgtsD2nQDtQ1459aWn9ArWqNWhLCMbXtP6Ln5s9RxMbtjbY0/mA+UN941CaV7iZFeDKgITAK06xIN0WloKdo8jdNymCsL3QzFD04syQlHbe7DpRDCxNpk9aQycGKRWo5fvSCN92ExSyNFZbZslri1VpHcH9gptTWjPpND3DO/9Q46FsW14uvsxCfKc/pUkfSwH48830UlNtbLW71Ickt/ORIARXDDF8b+eikON1JqCBrSOvQFr5B4HVVI0C0jIfyzq3yMlAnkwqP328D8ev5RJGjsfubA0gWakntrr1dMPBa7fxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZyUPZnRPklcI8fYP/GL1WXE+lBsvilqrOZassBwbSQ=;
 b=aO/6mGW9j+OUUCgAN6ZLMfrvu6F4IVbRnK+2+k7BDrOOiW/v/v0YUN0pYCyQwtEvh60UUU2TLrT9Rt43niZFNGt+MYXF2PT7Rv9EfU35j93dO1IQ4WHIKamYSO6nkkQ/W54W2BlXSq44cPSf3KB6eKwg5ubFZHQ1tAC032aCa7LdCf14DIxqPZPpfapXTT4+4cSQYIcTZbSdBr06mk0sB5QgiCQ4Mi6xCWQxHaEn54Dmhf/Vegbp0tVAcn/5Bhh5hC25dUq2wh82vxG1l/6QbhnIZWolMuwrPDDImBHPlXLJ5rqzoXnLwEIyPe9yd0haNPaq6iICIsqNEn2uz/4DLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH3PR11MB7371.namprd11.prod.outlook.com (2603:10b6:610:151::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Sat, 30 Sep
 2023 20:11:31 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Sat, 30 Sep 2023
 20:11:31 +0000
Date: Sat, 30 Sep 2023 13:11:28 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Kershner, David" <david.kershner@intel.com>
Message-ID: <ZRiA8LQ7DazcNoGD@nvishwa1-DESK>
References: <20230928134816.881379-1-david.kershner@intel.com>
 <ZRYtJxlhG/nU36n0@nvishwa1-DESK>
 <IA1PR11MB64189D31B23DF1F4667BCBB7C1C0A@IA1PR11MB6418.namprd11.prod.outlook.com>
 <ZRceh0kYnudtJpJJ@nvishwa1-DESK>
 <SJ0PR11MB58667BD5E23A37A43F080A7881C0A@SJ0PR11MB5866.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ0PR11MB58667BD5E23A37A43F080A7881C0A@SJ0PR11MB5866.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:180::19) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH3PR11MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c250d2b-f826-45c1-47a7-08dbc1f16fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8Eecr5brtPHsBoHfb/4zm27+8Keji0aakYgX9vtAn0JKWRkvv51kNoVJPMLNC5L1mF2VItfNU8pUPj8UXOcataQ30BSAQBGxTHUGc2LQjYQMIyHXXU/qoWBgu9Q+4qvxQYFmKEn8Wl0M74SYhOwVsHmqzekaSlv65K0HpK8TcC9fDdixXYcWxJkuphj4viGfls+ynon2yjlZTSETQuBwUb9JBrL071dbNHhxBl4RLG5RGR4mRGrj9IpxIloYxP4L/wienZgllD3bxYaYgORN1dZdHQPH4u9vK2EhX1Qo8xq6aMao3p1m0P1kEDR+ypov9OpueyDx6l36VWCPRwtLMX9WL3pg3Vqs4Z4fjQZnf/9MkYJwDcNaqRV3QVErmMmQbVdAShkInolZVZUjsQqhncpIocFvalE1IsFpKwsSqZuaxIlKa8WTyful0rKNl12sPAnSFYU5OIRqDW+N+KUiq24qqivwQKOOxq7OYchviIgRHEbeMkAXxW/uq0E1yEWM635kL31FC1kz/t0wYY+YVq8oe8A90nzu8I0O6DLeHyM59HEiHmYUywlSfAI9YLR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(396003)(346002)(366004)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(5660300002)(4326008)(2906002)(41300700001)(8676002)(8936002)(44832011)(6862004)(66476007)(33716001)(54906003)(66556008)(316002)(26005)(107886003)(66946007)(6636002)(478600001)(6486002)(6666004)(83380400001)(6512007)(9686003)(53546011)(82960400001)(86362001)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O1qt/pil65by967KBgtp/kz+s21iwiIYoHfhI60QCR9bvHLx3UULLLhCKDAy?=
 =?us-ascii?Q?SlajUcZLCnEV9inCa6/F/QYqTLzJYseiLAdBE8dtqEKYgFtP/XZnqkHeWXwA?=
 =?us-ascii?Q?htop4OPWpzo5+4KxxEnjL0/7KCEPRSzzLYzGI16hEvE0AqB8NOZ/8m80GV3w?=
 =?us-ascii?Q?1qaRGRnPRZlvwC0zLOZ9KP3xADghC8n0gF6WI3gOYmAe6xFfEha/aK5+XvHs?=
 =?us-ascii?Q?LtUkMO+6Pg+DF5EaJgfIeDjXgF37uZOQTwmkqvWkQAjJRfu6ZUAOOk8U2pqh?=
 =?us-ascii?Q?igi43ejJ9a8a10PY7te4OVsvZ1IELWTcjETLdbn7pl5EkAiUJ7UAhXnvY4/t?=
 =?us-ascii?Q?gCZJ+7HQpLK6gKok8H7W4oUx2lfQDjkP4pqIu7Eb/CZvOU03MrKNiXlJS7Ek?=
 =?us-ascii?Q?rESfpEVsWmjgRRCY3z6XpEMea0prjeKiRB21/hZkTvpEztCxo/Aa2gp5e7TX?=
 =?us-ascii?Q?SsyzEkzC7uRdvEKjCgQkAaJkCGZq3gZhctlHTKAUqx7hCWZBeX5bpBTEvfCU?=
 =?us-ascii?Q?WHEq2o8DHA9t+u/msG80idUPEdQtOqj/NUyCh+c2HUaePVYmu+8nHf6t6I3E?=
 =?us-ascii?Q?RBDYqOdq7jMJT+Ma0+dJK8wWyFjwKWKhh3PLlflEOjkP9w/scc9N8xlWXWSB?=
 =?us-ascii?Q?tRfrewQzILhl6ohHnNOBgmQTIfk1jyOXvjK6PL78OV4g05jyXdOj3pQWUj1m?=
 =?us-ascii?Q?+79kzOIUV/KKflFrwerkE32vDEoC8bmoy8Q4pj0imKzzwDQ3kqVFNisx2moo?=
 =?us-ascii?Q?w3ETZ7M5tR4aoHC6nqOtTA0YIPhJZ6k2wApUiIVhLTFsmWhvu37uljo67S0N?=
 =?us-ascii?Q?E9Ho8VYZNaVBen12v1JmpThg8TrysPyLVy/li/5eX96yE9KgGRXZ6YUvpGxz?=
 =?us-ascii?Q?e5WNMe2+lxHTu80dRmQ6fBHQLiztGgBtb21SmeDCzBX5NSPd5LVa/+/smBEM?=
 =?us-ascii?Q?iWc4fEj5DrcIm8m9EnPyfKthjTzHHhkQv/xBsul+tip9XOZAlQtUWWT1eMek?=
 =?us-ascii?Q?Yfh5Z1cs42MKfArahprjJgxirMjG8MGJ4esl5nqsHD5tCiwT5k2DQ3H1Ex0n?=
 =?us-ascii?Q?tBmxeFGNyOL9EiiGNWCIIZwIJch0tyQwHiXXX4LLaQOM3lHM/xP1NiCXNEnn?=
 =?us-ascii?Q?hDCqKxf3JjW+VJEAeJW2GlLS+0FfcsFJFm4Xr9UQgCfEh8PL1HBqd/GCbPMN?=
 =?us-ascii?Q?m3t3PrY3wT86i8ZVA9uC2VfzReAWcZeVIJa3NlJUX3sEDV/4kYon544fwcki?=
 =?us-ascii?Q?KyyAbEBlVg3wyUzmpJgbYvEdHIXrj7BYDc8427BDzTXO/ihTwJXbP7U/j1Jg?=
 =?us-ascii?Q?kd6qdkc/6nMDVJoJR2uxnWe+WzaOtjo9a8QmwOLj+W6oJaJVLYZn8XRjPDFV?=
 =?us-ascii?Q?+rTMzwvTZLLdSiDXlTMYxTvWLh7gbUKpbs66/XvtJX4Iz1FA2nO6zatAN22u?=
 =?us-ascii?Q?g3ezAqYc39lC0I4d5TAzObieyQdW1ROboituZYhKjGpaMpnrVvfq7d4Byp8S?=
 =?us-ascii?Q?4rk0RliJaQ9dd67uP1yHRoFZuClX9QYoG6lWSEhzotXoHqhp3L7lpGHgMfin?=
 =?us-ascii?Q?NoTFQ6IyZcRdN2JUMTwEaMHeXcVZYl5BIW4AWC8Gv9QTi5dgicpULeJ/gfTi?=
 =?us-ascii?Q?BlqV5tH/4kWHmC1pKusYMww=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c250d2b-f826-45c1-47a7-08dbc1f16fcc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 20:11:31.2217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWgwwXdEWQ0kJ3X5HsEXtbi67jK9ySfI8fIL+hfy3wxnx+l07G0KPg339SHYpq68Jiy+eOFM5DJHpJPhNqFtHt81Sr5CYeQ9Y2E0al6T2X28dgS7PCD89mphq+shaGFj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7371
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page
 table entries.
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
Cc: "Fleck,
 John" <john.fleck@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 03:45:08PM -0700, Kershner, David wrote:
>
>
>> -----Original Message-----
>> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Sent: Friday, September 29, 2023 2:59 PM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>> Cc: Kershner, David <david.kershner@intel.com>; intel-
>> xe@lists.freedesktop.org; Fleck, John <john.fleck@intel.com>; Roper,
>> Matthew D <matthew.d.roper@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; Summers, Stuart <stuart.summers@intel.com>
>> Subject: Re: [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page table
>> entries.
>>
>> On Fri, Sep 29, 2023 at 08:01:47AM -0700, Ruhl, Michael J wrote:
>> >>-----Original Message-----
>> >>From: Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>
>> >>Sent: Thursday, September 28, 2023 9:49 PM
>> >>To: Kershner, David <david.kershner@intel.com>
>> >>Cc: intel-xe@lists.freedesktop.org; Ruhl, Michael J
>> >><michael.j.ruhl@intel.com>; Fleck, John <john.fleck@intel.com>; Roper,
>> >>Matthew D <matthew.d.roper@intel.com>; Brost, Matthew
>> >><matthew.brost@intel.com>; Summers, Stuart
>> <stuart.summers@intel.com>
>> >>Subject: Re: [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page
>> >>table entries.
>> >>
>> >>On Thu, Sep 28, 2023 at 09:48:16AM -0400, David Kershner wrote:
>> >>>Device Physical Address (DPA) is the starting offset device memory.
>> >>>
>> >>>Update xe_migrate identity map base PTE entries to start at dpa_base
>> >>>instead of 0.
>> >>>
>> >>>The VM offset value should be 0 relative instead of DPA relative.
>> >>>
>> >>>Signed-off-by: David Kershner <david.kershner@intel.com>
>> >>>---
>> >>> drivers/gpu/drm/xe/xe_migrate.c | 19 +++++++++++--------
>> >>> 1 file changed, 11 insertions(+), 8 deletions(-)
>> >>>
>> >>>diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> >>b/drivers/gpu/drm/xe/xe_migrate.c
>> >>>index 9438f609d18b..848cdb6af2e6 100644
>> >>>--- a/drivers/gpu/drm/xe/xe_migrate.c
>> >>>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>> >>>@@ -114,8 +114,10 @@ static u64 xe_migrate_vm_addr(u64 slot, u32
>> level)
>> >>> 	return (slot + 1ULL) << xe_pt_shift(level + 1);  }
>> >>>
>> >>>-static u64 xe_migrate_vram_ofs(u64 addr)
>> >>>+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_tile *tile)
>> >>> {
>> >>>+	if (tile)
>> >>>+		addr -= tile->mem.vram.dpa_base;
>> >>
>> >>See below...
>> >>
>> >>> 	return addr + (256ULL << xe_pt_shift(2)); }
>> >>>
>> >>>@@ -149,7 +151,7 @@ static int xe_migrate_create_cleared_bo(struct
>> >>xe_migrate *m, struct xe_vm *vm)
>> >>>
>> >>> 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
>> >>> 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>> >>>-	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
>> >>>+	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr, tile);
>> >>>
>> >>> 	return 0;
>> >>> }
>> >>>@@ -223,12 +225,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
>> >>*tile, struct xe_migrate *m,
>> >>> 	} else {
>> >>> 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>> >>>
>> >>>-		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>> >>>+		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr, tile);
>> >>>
>> >>> 		if (xe->info.supports_usm) {
>> >>> 			batch = tile->primary_gt->usm.bb_pool->bo;
>> >>> 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>> >>>-			m->usm_batch_base_ofs =
>> >>xe_migrate_vram_ofs(batch_addr);
>> >>>+			m->usm_batch_base_ofs =
>> >>xe_migrate_vram_ofs(batch_addr, tile);
>> >>> 		}
>> >>> 	}
>> >>>
>> >>>@@ -266,7 +268,9 @@ static int xe_migrate_prepare_vm(struct xe_tile
>> >>>*tile,
>> >>struct xe_migrate *m,
>> >>> 		 * Use 1GB pages, it shouldn't matter the physical amount of
>> >>> 		 * vram is less, when we don't access it.
>> >>> 		 */
>> >>>-		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos +=
>> >>SZ_1G, ofs += 8)
>> >>>+		for (pos = tile->mem.vram.dpa_base;
>> >>>+		     pos < tile->mem.vram.actual_physical_size + tile-
>> >>>mem.vram.dpa_base;
>> >>>+		     pos += SZ_1G, ofs += 8)
>> >>> 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
>> >>
>> >>I think this is incorrect.
>> >>We need to map the whole device LMEM, no just the tile LMEM for each tile.
>> >>This is because we should be able to move the bo from one tile to another.
>> >
>> >My understanding, is that the page table is created for the tile (there
>> >is one per tile), to migrate data to and from the tile.
>> >
>> >How is this different from moving from sysmem to vram? Where is the PTE
>> >info for the sysmem side of this?
>> >
>> >If this is for a general purpose page table, should this be created for
>> >the device, rather than having two page table with the same info?
>> >
>> >I see that the only tests that use this are sysmem -> device and device ->
>> sysmem.
>> >
>> >Is there a use case test that shows a migration from one tile to the
>> >other?  Would like to test this.
>> >
>>
>> We can have xe_migrate_copy() function getting called with same object for
>> src_bo and dst_bo, but different lmem regions for src and dst.
>>
>> We may not have a good IGT, but I can think of VM prefetch
>> (XE_VM_BIND_OP_PREFETCH) and access counters as use cases that can
>> trigger migration of BO between tiles.
>>
>> >>And the identity map I think should start from device dpa
>> >>(xe->mem.vram.dpa_base) instead of 0-based. The xe-
>> >mem.vram.dpa_base
>> >>gets updated based on whats is >programed into PKG_ADDR_BASE.
>> >
>> >This makes sense if there is only one table.  Since the created for
>> >each tile, it will have some over head.
>> >
>> >For instance, the offset for the VMs are currently need the tile offset
>> >included.  The new code does not need that.  If we use the identity
>> >mapping with the full space we will have to break the tile offset out
>> >as a separate value to keep track  (will need to be added per tile..).
>> >
>>
>> I did not fully understand your question. xe_bo_addr() has the dpa_base
>> included (not the tile offset).
>>
>
>I'm confused, xe_bo_addr returns the offset based off of vram_region_gpu_offset,
>which returns the tile based dpa_base, which has the tile_offset in it as well.
>
>Should it be returning xe->mem.vram.dpa_base instead?
>

No. I meant xe_bo_addr() already adds the DPA (not just the offset of tile from
the device LMEM start).

Niranjana

>David Kershner
>
>
>> Niranjana
>>
>> >Thoughts?
>> >
>> >Mike
>> >
>> >>Niranjana
>> >>
>> >>> 	}
>> >>>
>> >>>@@ -441,8 +445,7 @@ static u32 pte_update_size(struct xe_migrate *m,
>> >>> 		cmds += cmd_size;
>> >>> 	} else {
>> >>> 		/* Offset into identity map. */
>> >>>-		*L0_ofs = xe_migrate_vram_ofs(cur->start +
>> >>>-					      vram_region_gpu_offset(res));
>> >>>+		*L0_ofs = xe_migrate_vram_ofs(cur->start, NULL);
>> >>> 		cmds += cmd_size;
>> >>> 	}
>> >>>
>> >>>@@ -1027,7 +1030,7 @@ static void write_pgtable(struct xe_tile *tile,
>> >>>struct
>> >>xe_bb *bb, u64 ppgtt_ofs,
>> >>> 	xe_tile_assert(tile, update->qwords <= 0x1ff);
>> >>> 	if (!ppgtt_ofs) {
>> >>> 		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update-
>> >pt_bo,
>> >>0,
>> >>>-							   XE_PAGE_SIZE));
>> >>>+							   XE_PAGE_SIZE), tile);
>> >>> 	}
>> >>>
>> >>> 	do {
>> >>>--
>> >>>2.35.1
>> >>>
