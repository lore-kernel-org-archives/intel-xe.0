Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F6CC47258
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 20:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C60E10E681;
	Wed, 10 Jan 2024 20:28:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C5010E67D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704918496; x=1736454496;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6YO2gfprH4EmmXtoXGyiYzsAAhPH03HBQ5pGI3wppHU=;
 b=Q1Dyh6NW0vKEuuIHjJxfTOiBp9b9Px+KK/eMKgM5vSjym+iXNtopCgXL
 9TtdfBGgjk6WJoZtJr3Ztktzk/G6/4iPdHcMT+V1BWXoceJbML+JZU2Oj
 r/E8BwM72/i9lQ8tYLqNH4FfQzDsZQPlH2j7NVXkFTEnbIW9nYdfC8RUK
 vUbYmP60AN5zyTpUmT+UVa74wtbgnLEe08llIs26vBx+zYIZLIM9apSkm
 aQUyPRHuiHD4AtjChDi7UKnnPK0Xtlf+UKAQXDD8a200RpTQdt8Nhf2sy
 OX6gOI8Hm0TbvzHbmF8GFcTPLAY6NMsBWXrUjZSSTNlXNEMbZCpKu7RfU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397507322"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="397507322"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 12:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="24375324"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 12:28:16 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:28:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:28:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 12:28:15 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 12:28:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9wWCrOTFSeBZiiYTrOrPC/kRzVS6zKJ+yWF5kN2z0ht0f3LT+xnYdTIF7lLbIsMnKA/xPCb18Jzp+G0LqkqiM2AGNsfwONE8oc/4si9yMuRiZDPxSQnpmeYiTEB/InfIAMhdIBk2J9UhQBD/dpOgqzhdYUoc8nwDP0XgqSF9YYNo98Yqkga2XmpJLDygTmhfZbouJT8BiyCLQ9LNwsq5FLMTMneWKtkE1BKg8k5xbFbHDP9StHCmVl4O8pW++tSovU+KeecfI6YiyOBa6kvAxyagR/YtdhDeKE6bEbhgZW3kZI58O1ngyCS6vHsJMtB4BTW8vo5SR/fDzKdl4+I0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiioWvO3fybaiAdgC5gnElr9UXc4JoUpaZTaMZEwPMk=;
 b=AfSIqf2ZX3dwWs3jLTidbomELffGbuFlb4mkplv18VSIbnrsjwz9GLA0DHbuQqDJX49a1oVMMC+OZi1RbYtmty9qyHT5toF7ThVmNVQOpJD6zQA+eW+9PL3wTT8N2qWFW9y7W6olIdcaLlmW4eOVjsR17S66+2JR3Qd9ZAq8roZbFrjq5vqXsokVtH0sV8wfkUx3Un2fKKHfCUYrQsyLRebXPQ0DJ+hot9yEPDWDFeya4pFTRBH22ofgpj4sU3kD5ySTM6g0WASfjVGv7ROw0CqVzlO+4fP5fUeQmPNTLM+HdIrUfskLsuqpcy7OB2BwFHRlGl0751XWHiM6xSTU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 20:28:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 20:28:13 +0000
Date: Wed, 10 Jan 2024 14:28:11 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 2/4] drm/xe: Invert page fault queue head / tail
Message-ID: <t6ss4q3x2j6cdgjc6uxgdd4qrooztxsihmc65v4nwudg2khtk6@bgfflqyrklte>
References: <20240110012439.1400618-1-matthew.brost@intel.com>
 <20240110012439.1400618-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240110012439.1400618-3-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR11CA0089.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5fdb33-cccb-4f15-41b3-08dc121aab59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1v4ZXojKiTJ+wuvfpWBQNQTSd76JRH34d2KbGWmhmMuF3qTfBvI1at1KypQp1Dvuy7moD7do+V0iTG4Q4Z7H5m/sTx6WU6nt5GB3I2XwwXulC38XiOKy37jpXNIrEmePx9AXflE3mPTTKYMX8wsJmoAiJvzxJ5TwL+u5IwzH1H7zWzKSFISy1ZP1jpi/jdrksxOMP0sap2rt9fQLI2i/FxmZvkTal814VRpEnv7Dnl91/h7HDHJXvGu5ssT2+drTBlMK+27KTRHzlzB11yqgkqtpWophRegEWMDNHPQ4cd2+Lib3raqTo9i38X4Fl1cYqy+Gdwpb3UBZT1Bc0/Fzi1x3saZBkdD2FzzqjXCEKbPe2CbhzovUnc6GTRkeFb9NsW25hkZFu0TkJzq6KB4i7f1mFUfdvR+caOFFzKUmgX5JwnB9HmCsyKNsgV2q/OD4gGzQxERAAjqe9o7VzVTNdvW7hQkUq1vaW+IeAMij6OmYdmDicooxQbNprRZlzdjPBl2+lgkNPzwHztq6h5AUZf6qPeXx15jKoDrg1D881yFGeOl7+W9X9lsAK+lOY9IHCJceRiJCkUNuwJMOiMDFXJ2ggKCwcGMig2ql4oxIGOxrqeBZkBanvy1Xn/QWteEw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(9686003)(33716001)(26005)(6506007)(38100700002)(6512007)(4326008)(6862004)(478600001)(8676002)(8936002)(66476007)(2906002)(6636002)(6486002)(5660300002)(66556008)(316002)(66946007)(41300700001)(82960400001)(86362001)(27256008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dZha5IVMWxsB6h1+88+1L4vJVDE5XPKFGhlv4cJNDxsipgFgv7i6rG947Jhd?=
 =?us-ascii?Q?UAagSEDnr26JHa39uikxmCsHV+tqevRvpb7e4RVr3anTVKLCSYJrcS5/QHHg?=
 =?us-ascii?Q?egBOt3CL3+W9kUd/9zF80zI7PNWm6bzDtxfzNgFIZKzwsrCo3TwWkVvuDOWK?=
 =?us-ascii?Q?YCXWN+nhXDEjIq/N7aDaoGF1SpPY+bltGoxcZCRMm6dYmQ6PlhRdzgaLxpDP?=
 =?us-ascii?Q?T8JEaAadbudXg4brLVmOQmzKjd0/8lY1UHRz3lnF3MfrzZyInwQ1PTt6Kria?=
 =?us-ascii?Q?s6pV3ua+niPdJf6ZKqLsy1HMX1IJvSsJ8wHo99T/Op0Jsv9nLLg1sPkhETkv?=
 =?us-ascii?Q?JMYZKnLCa3IzT8UO5wN/9B60GXKSlNeQrL6omiclJkhEgAkOP7sTFzAo7Hv+?=
 =?us-ascii?Q?7WZHSSHolMxc0xb9gXK/4MULHdmKWehXFAFJEZ/6GiUjLXmOt+YX1RYMPbXw?=
 =?us-ascii?Q?cx6TdpKsNmEAJqahjqRwc1IRhuO8ZM3IoNRt9igAzNem5jDEv+3I8OvGPV9Q?=
 =?us-ascii?Q?eHdNtlVeRQf2lhtaXyG+8hyxIGs8D6hWRupRkvBpIBiLOBn8F/KPgAmqsJE8?=
 =?us-ascii?Q?qiVAxjd9SYlF5uDl4qGkxii2JFwu6boaTdwfwM8wjcxQZTqnO2Vcv72k26dQ?=
 =?us-ascii?Q?OwFXgt9x9rGEFH5SGMunp5yCdEyn7MH9Zl26oH/LN/IqILfL/3Vjk28xXtGm?=
 =?us-ascii?Q?DmqzbRtXPbxn9G87CkUdSKFvRO2ZSkBZVwns6jb7feZUvfb3e7tuuT2Mixuo?=
 =?us-ascii?Q?s4ttn993uOyCiwBSwtxgw2FxOfiYkMJ0X1/db03BHJMcTN/lpXia26at3WYM?=
 =?us-ascii?Q?MjO8vQNTlBVzErtbF/vn1axCrMuiU+x+dxiXVViwaEQZ9ooUieJZ/dXaMSkO?=
 =?us-ascii?Q?CMzu2gNqyttlNkYgHi6Zzd6fe5AXn0hs8xkAHjj1bS3N35lrl5S5ivPytvHl?=
 =?us-ascii?Q?xMeaQdflFagQQ50puktTXMkyq0LrPhhFkgh+ktAo/cSMRgeqUbsxvVQDTk6y?=
 =?us-ascii?Q?DfBIEcc6YqnpVVdS620sRPSiW5B/n5JMWUZr6YzljDTJiTkOLCUbtInFWe37?=
 =?us-ascii?Q?FLNSKoAmh07wU4lT33QiCDCL7Jlmh5pzjyrEsepTeJgqKTeeEbaA0s2hNHAc?=
 =?us-ascii?Q?bUjdnG8NEkNzq+Jp3etd+zxiiPFnnqnQG3yyPX+uIVcJNi88q5Pqa8hZ5GLo?=
 =?us-ascii?Q?pr5ylXOP2W9OziyZVkXEeD4v10Vl9FxG6Kb2AQjLwZG8ck6Fu/wFbZ1ABbvs?=
 =?us-ascii?Q?YgmiMuF7oKUOdzHuhdXSVjD24VQSo8zOjO8iQzhe2PBLfB+3nw5m1daGcmNw?=
 =?us-ascii?Q?5Y+AT+2u60oHjvWZeA5bu1HNEjlrr1uvtYHIufDe+lwEeMo4GFfJag8m+04G?=
 =?us-ascii?Q?kaPOzb7zrGBTT75dYsS45JUbwdzzFc9SGTWYC0KpcdUCwyDcd5pClG4IYQzX?=
 =?us-ascii?Q?usCVbAxnQCrsSACOe/ybkSuEYaDnuBHEzGL1Pi7nFkvy27eTHRh6/e2HR9Lr?=
 =?us-ascii?Q?0hT1LgNIFvc36szBf9jy8JG4yoOvmangGTutxaEl7UhO8d71E+NmbjQjKF8Z?=
 =?us-ascii?Q?J5ZzBDXB79+tu8iwf7vgFtg+Pp7eu8KL0wNe3Re0lSA732isr/Wju/kz7BXI?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5fdb33-cccb-4f15-41b3-08dc121aab59
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:28:13.4633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkG1Zse6xf/IPFWS7W0clYViY9aGLAicTk63vZMpfhdNz9RshQhfnQX4edkleQhT7S6pQ9UM1OP+P1cR4X39XGOZiC8ahuwwhJbocJWaBKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 05:24:37PM -0800, Matthew Brost wrote:
>Convention for queues in Linux is the producer moves the head and
>consumer moves the tail. Fix the page fault queue to conform to this
>convention.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

it's a dangerous change if not automated or checked, so I decided to
compare before and after. By comparing the output object, the only
change I see is in xe_gt_pagefault_reset(), and that is because the
order of the tail and head assigments to zero. With this additional
hunk:

@@ -441,8 +441,8 @@ void xe_gt_pagefault_reset(struct xe_gt *gt)

         for (i = 0; i < NUM_PF_QUEUE; ++i) {
                 spin_lock_irq(&gt->usm.pf_queue[i].lock);
-               gt->usm.pf_queue[i].head = 0;
                 gt->usm.pf_queue[i].tail = 0;
+               gt->usm.pf_queue[i].head = 0;
                 spin_unlock_irq(&gt->usm.pf_queue[i].lock);
         }

the .s generated matches 100%, but no need to change this.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_pagefault.c | 14 +++++++-------
> drivers/gpu/drm/xe/xe_gt_types.h     | 12 ++++++------
> 2 files changed, 13 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>index 0a61e4413679..3ca715e2ec19 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -282,9 +282,9 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
> 	bool ret = false;
>
> 	spin_lock_irq(&pf_queue->lock);
>-	if (pf_queue->head != pf_queue->tail) {
>+	if (pf_queue->tail != pf_queue->head) {
> 		desc = (const struct xe_guc_pagefault_desc *)
>-			(pf_queue->data + pf_queue->head);
>+			(pf_queue->data + pf_queue->tail);
>
> 		pf->fault_level = FIELD_GET(PFD_FAULT_LEVEL, desc->dw0);
> 		pf->trva_fault = FIELD_GET(XE2_PFD_TRVA_FAULT, desc->dw0);
>@@ -302,7 +302,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
> 		pf->page_addr |= FIELD_GET(PFD_VIRTUAL_ADDR_LO, desc->dw2) <<
> 			PFD_VIRTUAL_ADDR_LO_SHIFT;
>
>-		pf_queue->head = (pf_queue->head + PF_MSG_LEN_DW) %
>+		pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
> 			PF_QUEUE_NUM_DW;
> 		ret = true;
> 	}
>@@ -315,7 +315,7 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
> {
> 	lockdep_assert_held(&pf_queue->lock);
>
>-	return CIRC_SPACE(pf_queue->tail, pf_queue->head, PF_QUEUE_NUM_DW) <=
>+	return CIRC_SPACE(pf_queue->head, pf_queue->tail, PF_QUEUE_NUM_DW) <=
> 		PF_MSG_LEN_DW;
> }
>
>@@ -342,8 +342,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 	spin_lock_irqsave(&pf_queue->lock, flags);
> 	full = pf_queue_full(pf_queue);
> 	if (!full) {
>-		memcpy(pf_queue->data + pf_queue->tail, msg, len * sizeof(u32));
>-		pf_queue->tail = (pf_queue->tail + len) % PF_QUEUE_NUM_DW;
>+		memcpy(pf_queue->data + pf_queue->head, msg, len * sizeof(u32));
>+		pf_queue->head = (pf_queue->head + len) % PF_QUEUE_NUM_DW;
> 		queue_work(gt->usm.pf_wq, &pf_queue->worker);
> 	} else {
> 		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
>@@ -389,7 +389,7 @@ static void pf_queue_work_func(struct work_struct *w)
> 		send_pagefault_reply(&gt->uc.guc, &reply);
>
> 		if (time_after(jiffies, threshold) &&
>-		    pf_queue->head != pf_queue->tail) {
>+		    pf_queue->tail != pf_queue->head) {
> 			queue_work(gt->usm.pf_wq, w);
> 			break;
> 		}
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index f74684660475..b15503dabba4 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -225,16 +225,16 @@ struct xe_gt {
> #define PF_QUEUE_NUM_DW	128
> 			/** @data: data in the page fault queue */
> 			u32 data[PF_QUEUE_NUM_DW];
>-			/**
>-			 * @head: head pointer in DWs for page fault queue,
>-			 * moved by worker which processes faults.
>-			 */
>-			u16 head;
> 			/**
> 			 * @tail: tail pointer in DWs for page fault queue,
>-			 * moved by G2H handler.
>+			 * moved by worker which processes faults (consumer).
> 			 */
> 			u16 tail;
>+			/**
>+			 * @head: head pointer in DWs for page fault queue,
>+			 * moved by G2H handler (producer).
>+			 */
>+			u16 head;
> 			/** @lock: protects page fault queue */
> 			spinlock_t lock;
> 			/** @worker: to process page faults */
>-- 
>2.34.1
>
