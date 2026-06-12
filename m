Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3931BCD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 16:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DC610EAA1;
	Fri, 12 Jun 2026 16:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCWI/pJe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5592710EAA1
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781281462; x=1812817462;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Fr19pzKIWjGM959QzGMdfI9DbVtWzVirqwfYMan3uiM=;
 b=JCWI/pJeUB36QzPdRlxdodbDtiAORver/1xjXNfeZVAxZaD6xPxRtIKn
 pW37QvNfdP06SZUOla4I58zUOplBtr11o3628B4sR8m9sPWpFz9MHck3l
 P1iMb17/u3jpWjB0Z7QGF1TqkrXQnMC8/YC/6RWzhaT5oDmtrQfTznuuC
 5RgIgytw5h9dF4OK6Q2KYbEqtKS+wiSytA78bXglTOTD6Dy1EOHkByo2g
 exaynPmsHLWE9PyuwY+RsQhtduQsJZOLjUQCGn0HrGpvmSvvdpXD5WLtU
 4syWHB+mELIV7fSnw5Kti+WFDmuPH/lj4RvnYqxF+7/EXKGmnDvTG44RT w==;
X-CSE-ConnectionGUID: lMQtGrzTQdSWwSgs2K/ZDQ==
X-CSE-MsgGUID: UrxkWhAlRwGt7gMeSj6mwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82304875"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="82304875"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 09:24:22 -0700
X-CSE-ConnectionGUID: IVx0UEhrSbaekV/QLtQp7g==
X-CSE-MsgGUID: AkqlOxujScGseCdgJxZV2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="245749721"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 09:24:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 09:24:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 09:24:21 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 09:24:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZyFGHwkXDgzerlRltder7L0bUM8IaPMdvY81+N4+GX5nFz66hQqXav+dNavYjSlJroM+EalsqtzwIS/SfiKWlU4FUePDsAynqX8PAamHuI3gpIOVvE+FfBw9hkxAdZWGLXpQqthKTfNPX4CDioHXTZRIOx0m7Na+VEIbY8OVTh4CRDteTX3XfrZS9yA+KZ+V02p4j03cn4+jJy7EGyL0cPo/Fo97kc5zyps1GJfnfP2ko1KmF6hT/NR7booEO5DZpwnDDZldyP5l5UebBQ9DwZkdI24MyBrGg7L8OdASWn9TCt4Alu5ajqnp/Fl/K9DOED32r1sBEoMkEjOklBmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eeTOXbADM5lFlDFcQQCvKzuqN0tT//jRYJiW7ni43I=;
 b=C7vRLjBEuzauZPnHvc8DGIi1r+NvWdSr3KbS0517OknwhCtNNYNDQygRosbTSe5xa7IgfPsxdb6fEFL4JjTM7yfLS3lLaE9qmzXSRke/f+4//muzP+RMRaxT8QXnJMJgCAWheBzF1IM6wsgpJbS6RO+tjSIFrhhX5UqJlTkL3GMY7j/QjHZyCz3ex22ncn+qa+5y/+Lw5BUKQVErQHAOvKhvf7CD5gwTl3LPGTSiL3dMOcd9kk279bD+7qDKSmLPXnErF3ipIHHgY0pv3dmy5sAUofDMoCWk3/JgeF5KAgG1WD4+bjS4uoNoir22hjPCHZA1NcUBFAiWSwDJDaz75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DSVPR11MB938433.namprd11.prod.outlook.com (2603:10b6:8:37a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 16:24:19 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:24:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Sanjay Yadav
 <sanjay.kumar.yadav@intel.com>
Subject: [PATCH] drm/xe: wedge from the timeout handler only after releasing
 the queue
Date: Fri, 12 Jun 2026 12:24:15 -0400
Message-ID: <20260612162414.287971-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DSVPR11MB938433:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c779b6e-34eb-4169-6d59-08dec89f0dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: y46cUokfZu0HLtaHf7ejtDoU9zwUFMfjKgJ8gRl/3R/fbnGCgG54jwt2xUHEVBC6KcDyjzWNKIxEdf1nnVShfp0uPcXWvtYSRR2NfaT2mfTCnLacTxKbQiydIZjs3+TC1HGJiysNqGuRIKACqCD9IZ6hBJMuGq77JDZNc63je6BIAfXU72u9HXeYbPRXIo8CtS1PBmSOvQQqvyCEqXzzaZg/FfqXfX41qls079X1/WRgmSVGB3OEV6P4PDrgKujXZIfXHmpTbft2hlUyWrhYMYrq9YyAx6tsLlyOuYPYUy2/fVdVT+oOra3j/owA5JoTr9+mBxWPmadrMYrKeeQAHII3lUG3he/b/9KwubbE24zL8pNgZVjMPeaWiFmWbuK98+aJSRwojf/8rxD8c/D4aJuITX2iW0bB6h5pQiLf5rzPv89WfMonwPAcCbSQCDt58SC9t3tBkX1hPaaz4NWt6MSM1fCffSuNKSS1wA/lw5ZGcXjlxZP4wwxF89tg2hoHUB26lAuJMC5yRN4aCrQ+enWy4X/oS59VXI+6UlewZNoYPM5o4QDGdmRQalS+3UNlpR3QKPMQNrdljkDVd0TcrLVzJLKjes29StrvC0gIexUcu4QdeVAJvZqG8if4+F9nA4rA2wzDrkrXyZBztzE7LkFJbNEdsPyrhY2IPzenxhj92CuOh/TB5YbpfVBYAmWJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU41ZTZoTURRbWtDdjlwdWE0Vk5hS1hJaXRTeHRNVExZQkV2VEhieHJzdmJM?=
 =?utf-8?B?MVRKUUFnZGx2SUFEOXJLQ0FGUFc1dWJQdlU1UUJRVk9qeHBXbHc0VXZySTQ0?=
 =?utf-8?B?OXJxUlRVeUs1WUlsSjJORElML0x2K3pWV0VyTFY1NDNDRlkwNGlXSjhYZk15?=
 =?utf-8?B?Z25VWFdROUIwQjdYQ2R0K0VIcS9yK3RNUzlxeWVObWtXUE9JUzAwd0l4RGUw?=
 =?utf-8?B?QjZZMkFYSnU0MUM1QThvbk9Qd3BTazdjZFR2TVZGSTVaMmo4QmZvd1lBb3BW?=
 =?utf-8?B?WGhDRVVYUlM1NzV4UnVSa2twVTFDRlBOVitUeHIyMnFJZnRUM0FzT3ZoNTVH?=
 =?utf-8?B?OU1UVUlPaVNDbVpVT1BodmU4Ymc3Ym01T0dUWFJZcWdrWnB1Q1ErN0hhWStX?=
 =?utf-8?B?Wmo1WSs1TjU5WTRBdzlMMXpYMUZJZEFZeGFENFdTaUoxUWR6ekNLSXdsZzVO?=
 =?utf-8?B?SXgra2VITEdBZVVNc0xCTUswa3pVL3B0WVRVRUxBczRmK0xrVmhIWFhOK3Ny?=
 =?utf-8?B?dE5vVC9rWjJGeTF2b2hpVHRSNU5NOXJxRExZS2s1aG9mRDAwb3FKMGdTNVV3?=
 =?utf-8?B?WXlpeTZRUngrYmcwT09IMUdoZnMrMGtNT2d4MjNTbS9wR3JaY0FXOWRWME03?=
 =?utf-8?B?QnBmNFFVM0tYODZHdmYyL0YrVTFUM2xnTWdQcnlJTnBzTVJDaEswK2hXVzBO?=
 =?utf-8?B?TVkyVFZKazJmbFlnSUl4d3RPd2RmVkNUMDJvV3huQ1dCRHAyRUpVMlNQTXZZ?=
 =?utf-8?B?YjNBd1hCMHB4VHVCa0owM3pkeStYRDV0ZStFd1luUjhJZHNxN1VGWVRsd0NB?=
 =?utf-8?B?WWF4azdYaFYwdWJiSWVzSy8reTNKWVB6K1k1VlVMYUU4VytPd25scWdiQUY4?=
 =?utf-8?B?dHhmK2NjaThWWUVMQmZ5Wk9iZnZhMXdWTWVBZzNlemF2Y0J6TVI2b2tUTWNT?=
 =?utf-8?B?RVJBK01rZ2pPb2FHcm5yY3FEY3g2dStsS1BoMEhtWDBBUHNBUWpYbWFFdVlF?=
 =?utf-8?B?VWFNS0RkaTB3RWxVcDhadE1SRFVkWnpEN0Y5TUM2OFlMbDdYMlBNVVA4Ukoy?=
 =?utf-8?B?cTNDcWhYUVlqYXBNRldoWlFzWnM2VGFOU1phOFNmQXMyV3pBWmZVKzVYRGtG?=
 =?utf-8?B?Zk1TRTBJOGdSZmhwU2xXVXJFWVFVd1FuMkRZZnQvVkJaYjZhMG40Ymd3Q2pS?=
 =?utf-8?B?SWsrN1pSeTVDcUJRcnl2ZnJCL20rOEF3K09ZMHRaNWVDVHZveVN2amdmU2pm?=
 =?utf-8?B?alI3NURsMVEvNHlqRy9ySVYyM0tEdVdEZGNIRnVhUzNuSVBRQlpyNDIrNUMz?=
 =?utf-8?B?UEd0VXJEalJyeWFpVHdlSzQ3TjFKNDJ4bDdXSnlVaU9UMEJCREZnZUZCcHQ4?=
 =?utf-8?B?KzFwc1U5VFpXVkhSYlRnOGxkZzZuQ0QwRnBUc1BNNG5DeVQ1T0s4Q3dNWFZY?=
 =?utf-8?B?RTV6RUY3dUZCRkw2aDM5QmtlR282bjhTK0dZOExLYjdXUXk1VS9Za3Z4bzVq?=
 =?utf-8?B?aGtGeHRtU3VoVkErbmsrUFdLd3Q3Vk5UdWRnYXpJcFkwaVpkdWYrTUJCWUlq?=
 =?utf-8?B?bFZibWs0OVlCTXFFRDh3RkU1UzZuZ2dsV3d6ckh0Vk9WamhvY2EvRi9yQnJo?=
 =?utf-8?B?MEN6Y09ScFgwa21KT3FYZGxNTmVUVTNiY09vM1hsRlVsbHRtMXEzVVRNME9T?=
 =?utf-8?B?dE5OZEh1TWNZRXc5a0locWZtWmhPcmpvd2FGMjNnb1UyRGVlTGEzcXkrZ01X?=
 =?utf-8?B?T2tjcUdETE92a1FpYTVHYmVQb2Q3YXArL2QyS3JacEpESTZnUGQ3dVkyc0Yx?=
 =?utf-8?B?QXhpKzJNaFN4YVNNWmlaYnprM3NlY2ZOUzZ2WTZzdENCTFRLMU8xT21OamJI?=
 =?utf-8?B?RzdpeGo5NjEzRzlpZlVxVnR6UUxBR0VCcXllY2JLL3A5U01keHdtYnNNb3pM?=
 =?utf-8?B?RHJFVUJZYjVCU09icFU1a2E3S0dNaXVrUmMrZEYvSVZPSHUyTU42TnB3QjhY?=
 =?utf-8?B?RVE1VDN6UGRIT3lwZEl2aHh0YW5haTNmQjdZSW56V1E0QWVUTCs0cjBzeGxX?=
 =?utf-8?B?dWxIUjFxaSs3OFVOcnY4ZWNYWFlZQ3FCRlE1WGoxL3plbFNZMGJ2VjRoRXZ6?=
 =?utf-8?B?bGpqUm9ES0pEVGlNMVBTMHcwQTI2ZjI1UjNsdVRiRnEyOVdoL0s4ekxLVzZZ?=
 =?utf-8?B?eEVxTE1rL2VJQjRTN0tLOWYxenREMjZSWVhsOFhtdktOVkd5NHRNdU5OMGpW?=
 =?utf-8?B?TWIwZVN4R1o3TmllaFBVc1lFR3h5ckNEUUZaamZzc3ZHbFRmcENSWDM2VmJi?=
 =?utf-8?B?Y2NEbkhqMEZqTWxGczV1cjFVYWNqQUtkMENDZFVNbzJsTVg4VDJQZz09?=
X-Exchange-RoutingPolicyChecked: kMxZ6SrNnFAPzIc+q8jUwuAkVPduZNkfYrYFHzDyMOEhMt3nXdhc7Shc7/N5EyupA5tgYGY5bcQefmCug4v3df+SE7U17sWc4IyomChDojNQ9Eb+UuTHXp0sp3qc/qO16k7J79BUBdLZNCNbebScQLLYdgiJRKBllT3wi/ItX8g9qlRluzZGoYDDIEZRHmcIE9q6UvZ/890QYGOVeSP9207R99gXh09xcnJjbjsoX/EXmu/HjbYSNpB7GlKs8klPecSk+QyNzHwiaXUs3vRbalSnfudWB6GrcdVwmInCeiG0PgbTGH8phK9e/Bqy9h2Apu8AECvZbLx4qn8lgzQZYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c779b6e-34eb-4169-6d59-08dec89f0dd4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:24:19.3843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7gCc05/hNWGBqlFzaWYgdn+kmEgo78aAzFvri6fNgW/t4aVE8Ha4TC1nqxKNUPWTrr4q6gomPCAnymYNYOGbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB938433
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

A kernel job that exhausts its recovery attempts called
xe_device_declare_wedged() directly from guc_exec_queue_timedout_job(),
while the handler still owned the timed-out job and the queue scheduler
(sched = &q->guc->sched, stopped at the top of the handler).

In the default wedged mode (XE_WEDGED_MODE_UPON_CRITICAL_ERROR),
xe_device_declare_wedged() takes the destructive path in
xe_guc_submit_wedge(): guc_submit_reset_prepare(), xe_guc_submit_stop()
- which calls guc_exec_queue_stop() on every queue, including this one -
softreset and pause-abort. That tears submission down, signals the
in-flight fences and restarts the schedulers. This is the correct
behaviour when the wedge originates outside the TDR, but not when the
TDR itself triggers it: every queue should be torn down except the one
the TDR is currently operating on, which it still owns.

Control then returned to the handler, which kept using the now stale job
and scheduler:

  xe_sched_job_set_error(job, err);
  drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
          xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);

drm_sched_for_each_pending_job() warns because the scheduler is no
longer stopped (WARN_ON(!drm_sched_is_stopped())) and the iteration then
dereferences a freed job, faulting on the slab poison:

  Oops: general protection fault ... 0x6b6b6b6b6b6b6c3b
  RIP: guc_exec_queue_timedout_job+...

Defer the wedge until the handler has finished operating on the queue,
right before returning DRM_GPU_SCHED_STAT_NO_HANG, so the teardown no
longer races with this handler's use of @q.

Fixes: 347ccc0453fc ("drm/xe: fix job timeout recovery for unstarted jobs and kernel queues")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Assisted-by: GitHub-Copilot:claude-opus-4.8
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e82018445b7c..afe5d99cdd8b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1493,7 +1493,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(guc);
 	int err = -ETIME;
 	pid_t pid = -1;
-	bool wedged = false, skip_timeout_check;
+	bool wedged = false, wedge_device = false, skip_timeout_check;
 
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
 
@@ -1638,7 +1638,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			}
 			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
 				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
-				xe_device_declare_wedged(gt_to_xe(q->gt));
+				wedge_device = true;
 			}
 		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
 			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
@@ -1658,6 +1658,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		xe_guc_exec_queue_trigger_cleanup(q);
 	}
 
+	if (wedge_device)
+		xe_device_declare_wedged(gt_to_xe(q->gt));
+
 	/*
 	 * We want the job added back to the pending list so it gets freed; this
 	 * is what DRM_GPU_SCHED_STAT_NO_HANG does.
-- 
2.54.0

