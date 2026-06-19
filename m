Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94BFCD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 19:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F10710E104;
	Fri, 19 Jun 2026 19:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZaLIaa4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB61910E101
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 19:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781896313; x=1813432313;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=EEVz7B7ZEE4UIuxQ/MNrNHtMDo64tT8jy7jC2zalEfY=;
 b=RZaLIaa41AY4DI7PU8QUNKt4U8h2D1pEUts0qpYfz/PchEPixvC0KyOL
 p97SxV2tBrlMK9YZW2YRLyF59PydLqHwQq6NhYATZn8uaszwK87/EZMeq
 +0Q3vTIBfGAuShL96vpkz6dDXokG6tYsbIhbtrVtnq7HTZVI3ufe1kPSu
 RDwYQfajbgHtSD5Pu22gDL+HBkK9KBWrkPj2x+L/onNStWMY/vior7maj
 jwQ2oTtjcX6J3cTHUQ/MvDYpBGMQtE6QL37AzOxAAs6QArVSIYWrXjylO
 tXnhHCgJz1DuU7McEQcILlI9eH43D+M2EEAFfrELX76hR/uFDiWRDi5oq g==;
X-CSE-ConnectionGUID: 3J8lZL2dTF+fwXGG2ZLA+w==
X-CSE-MsgGUID: maJD3H3KRnWIaXTLoGswNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="81845214"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="81845214"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:11:52 -0700
X-CSE-ConnectionGUID: 2swm4RNzQd6yPejul+5D/A==
X-CSE-MsgGUID: zvN5Ud4lS8a3mFOX+w2cjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="248753216"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:11:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:11:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 12:11:51 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:11:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGwIrIDySkfJNh6jJLERXDiVTt1yyI92kJ55nVcCIyrb6gj8c7c2NDVCtilAcWu2PUHQBQ95fE+wrtCewmCmqhRJuzY7QL2xXZDUwOunXQRKHAH0cxtXCXV4bYhXciFQj/job42QJFw15W0Efj7PZJvvRrcgbovDaveaw4fByzJSdZ8XyKTuGFSHWKDiZxylKLZ/IjlZKiUFEdi2+Kj/g1/Ym6v+Yt2W1dR4TtkiqbXbm4fAIISjbSKb5ahk8jIuvLlaG2UsqNgTh4/HlDwM9fUVJTkGK1OztuD5hzII6mE6vZJIv0yOf/A48iMdLzGNMOYS+Z1OCYiXPLcec4Dprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fq2Qs1Bp3zdnjuzGjhp8Lmzv1xFFIadOfynvfQ6iEhE=;
 b=dfI+bw7+bPJ4ew77t0uotLK3zl0DrFjn+GRHZRIyS4AG+e0Xlh+x9pu5TIQ+gbxviP+45n4VIP8bQdwStdTOfjrdkhC0NmGuGYUnV2kI63gpAuDo+8Emx9IHnOt6jGumh0cT3dQDO4lQsEgKPNMhQjpChjNxWe59+C0q629C0kJ3I/zvwJRyP6OePvvcSKWnJsRsQkhwP3LLEo5sJOKmQswCI7PgYAXE3VstQsISXQAkAvegAbK9XgBmkwt+p9XMqQjL+Ym1YuYf8wcRZ3R5JVDfq95HIoYg99necuX1tk9mjZPQBGd/EttjWzvFRkiTZAIF2xkB8vrtrnDoDJwpQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 19:11:45 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:11:45 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/7] Prepare GuC resource managers for VFs provisioning in
 PF admin only mode
Date: Fri, 19 Jun 2026 21:11:00 +0200
Message-ID: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::35) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 91afb529-df23-45ce-c1ca-08dece369abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|18002099003|18092099006;
X-Microsoft-Antispam-Message-Info: hdTzX8ImHpMw2drL/FRyepWeoa5zEx+LCUdAPvExDdkhuARAf+/XOWN3wg2sn/aP+jTEjM6thHGj2mDc1WIEHYktp/cDLl/6hc5LzBynd4XZstPOvFGNIhmlkMe5uT/AiGir+nyLlkqk2//QRTPGWhu9hxmsZNHiDp+haoLzIZUxJP5ff6ZlzhkzxgBsYAR7bxG1MVPJJhpr2PYStYomyS0PZaPtToNnCOe8dDHbGxAhlHs6x7+zh5NESXla9d0ftfjI7czMns5odXmckZXhGXCz9xDY/8c0UZyql22dchgo7WzdLCbkjUj7Vc6Y+Oih+KBZdjAmeaN0WwlGnhebmaZ/f4TRThTSL+AggtTMiVHQE9h4KDZG1VRml/vNJHgaUJtq2Arz6lCBplF9DC84h0hJ/40VeOV8+0DKm2JEgo84b+eAS0UxPMbJk0SXIPN03bX7cqei2Qv9nQzshkpmAGE3odYKd3lXxkij4SijKK9HIC6E1yrBT7ckh4ZhMFOsBtocO50OUvIn5qzHFYqcyra5mrdGQK0tZuplvJCdea4VtlBGV9ogqI7v7UCxGQjtdJzr0v60a1XRM38sxA9VeGeZi4ITVd7FWo87kWvzBy/O9NW0CTjqM9CrX8VY0sfv+oUooZTTev0nR8SRu3EEPAUU3Sesh7mHzqMG/xPv16U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(18092099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzVaUmluSVNzM29wKzI4aGZqNU5CWnFZWDZWcmw0U0pUTkh2dGNqak5mQmRk?=
 =?utf-8?B?c0JnWExnZTNyaVNveTB4QzRHdllXcFRJOXVvS0FMMFI1QVJiM29xMm5ZMjdp?=
 =?utf-8?B?TW12amJNWWRWQnJkKzN1WHowRW5SaEZxZ0Jzd011aTZHMzlIMHFWcEtQb3Vk?=
 =?utf-8?B?Tnl1TFJDclZpd0dpenRWaFlHd3hodDdzZkk3WVBTZlYzUnVQWndlMTdXZDBV?=
 =?utf-8?B?L01TMTBRbEZQTUJ2MFNGOFJGY1NERTc2NzNoV1lZaTNydGJjU0wxNmhyd1BW?=
 =?utf-8?B?L0lDazkzaGVTS2VjZU9NWjVEZDhiNzVXdDZaSDQ3Y1ZJcndGU1pXcS9ZTTFj?=
 =?utf-8?B?SVN5czNiNi9kZGVyYXBQRTg1bTJuWDQxTUtLSlVDRDZtUUdYWHBsWEtXMDVl?=
 =?utf-8?B?TCtsYU03TXYvQUtqeHFNR1IwOVFReXdSTFIyL05HZ3VDaUlGZXBxbzFnNE0y?=
 =?utf-8?B?akRabmx0Q013cGQ2L1VjS3BRMFJDQ0RoRUdQd0RNWFFsOEROVTJvUmFXczIw?=
 =?utf-8?B?eEszQndRb3V0TEhsdWx3THdYeU11LzlibGxRb3hxZ0cxcUlRZkpsNjFpZEVG?=
 =?utf-8?B?Qkxpci91TWkvMVlIM09XUDg5Z09DaTBWL3YxdXc2ZWFVa2ZvZXh2MC9SU0F1?=
 =?utf-8?B?Zm1JY2xmbThuVnFJaFZSZUZoL1QxM3B4VjFuMk02MmYzNll6cjRqSXRubE45?=
 =?utf-8?B?WkRraHk4NEd0Sko5NGI1U3pBYk4xWUFqN0kxUlg5M2FnT0lHalpaOUw1VmJn?=
 =?utf-8?B?WC9PVFp4bjNYNWV0YnlkbnF0YmVJS3ZTM0dyeUNKMUtTSTh5Vng3YzkwUEFp?=
 =?utf-8?B?Ujh1UEEvT2k4OUF6cWtrL3JBMjMwZllkOXVzVzZMNGNVT1JUTDNlYUtVUjhN?=
 =?utf-8?B?YXl2TWZvVkN2SnM5T0NocVlHZjYwMkRqWENYZnlENUJ4WkthSmdxRjQ4ZXAr?=
 =?utf-8?B?bGRuNE9OK2IzRTVKaGdLN2M2WkI5YVo5V3FQN0s3cEpqemwzcytCMG92aXB2?=
 =?utf-8?B?ZFcyYWNtTThPMi8wRU9BQVBOdzdON1RXSFRYQVhOV0hRSHBSeTArSXdycDNh?=
 =?utf-8?B?TjZQSWk4OCtHTUhwN1VaRDQ5K01aa25VSEh3Sm1qOFZVUlVRRzl3SzV6Q3VG?=
 =?utf-8?B?SHhob2RPajdMNTk0ZTVmVWp0YUdNNmFGUGo3VXFDRE1wS3BCYWxpRVM4WkhL?=
 =?utf-8?B?R3NMMEZQREh0aDdnWlJPaWN4a25tM3M5VEoyZ0ZzNUd3OUY0K1JuMCtjUFg4?=
 =?utf-8?B?M2NITHJsREhRSytRN3pLUkMvUjZZM1JNdE1ZclVKeFNvdTQrVkIycCt3Q1U3?=
 =?utf-8?B?NThCZGFzUDVUR0w4YVU4M2NZZStFVHh2K3FiMEJBak95WHhEVWVUemdwdGR0?=
 =?utf-8?B?OGNKWENvRkJ3UDBpS2hhcC9sbmRJTkh3TzVWVXFwUnU5K0kyQm91cldaSk9Q?=
 =?utf-8?B?STJFNWRkNG1vc1JNR0J3NitjQ2lid1YxOFYwOFZrTXVXck55RFgra3FKU0hl?=
 =?utf-8?B?SmNDWUEzR2NreTdnR25SSjRLOXJPbEViaFRqYnFNcWhkRFRmYjdCK1N6cnF1?=
 =?utf-8?B?RVFOZE5ETjJzZ1hHTFdQZnNqOEVTSGZrQmJodmlWdEErQ0F4S0o5aVRjbFVG?=
 =?utf-8?B?WHlRdzM1NFIxNUozRFRoRlR6ZUlCTHVuckQyL29IeDFPT01iSHkwZkxzR2N3?=
 =?utf-8?B?QXBXeGhPeVpjQU5YanJOMEtxNGYwaEpOYzY2RW83MnBtY3hkMk5GOWQzZFI0?=
 =?utf-8?B?eHNvTDFEZ1VsTzVMT05ZMjhKQldrZXNpTTFJb29QbWFpYkFyZ1NvRlpyWVpq?=
 =?utf-8?B?UE1SNVdEdk8xT3JPcXNLUmYvaW45bHMvT0RRUzQrWE8waHZBWjZ1T2llZXRE?=
 =?utf-8?B?YTNkTGVxTW14L1pReXNvblEyaUlVUHNoUmFtRWVPOTBHMG04bUMvc2U5aXM2?=
 =?utf-8?B?cU93S1dEUHJBSFpwYkdmN1UzQ0I5S2h3M2d1UmIxVGVtTjZ6eVFJK0JRY3NY?=
 =?utf-8?B?aVBCdHNHL3JkWGFSdmpjOXNENlBUd3RCdGJlWkNTU2xvSUpXR25HYTB0dFJ3?=
 =?utf-8?B?K1BTL1NFek90T1djcW5BdW8vWEZYcWUrbjJXYTZMbklhZEhmUmpGTC9yS1Q4?=
 =?utf-8?B?dThSRWtTK25VTXNORUpidHJLZTdLL3FZdTU1dkpNZnJoVVFjTXdsU20rOE41?=
 =?utf-8?B?YW0ybWEzb0lHcTRpMXV2NVU3ZDRKWjNnZ1dFV3pMcUk2M2o3ZWI2VG5xOFFp?=
 =?utf-8?B?ZFU2clhscFlxV0hPaTFWNnZlSzFFWVFYVHJzeVd5UytwbE9EaTNFN1dCSlEx?=
 =?utf-8?B?OG5nNDdNRm0rOGo2SFkyeDdBY1hXVzJCbkpOSm5TUHBqRm1Jc0ppdEtvNmJF?=
 =?utf-8?Q?1iXNMy9ejM2PCE6Y=3D?=
X-Exchange-RoutingPolicyChecked: kNEBZ3pfutnM5zwdAul0ZYq48iLuFu1x+GIkKSeCgE64QfHj43j7y8HwGlO4uBt2ULNfzGuDhI6xAsD6uRIhMjg9xjC/PGk4dP+SquX5aNWR7IIWhOlhim7O39YzS7hzznBhfnlc7sieSBl3zZZZgZgeCrqtJS5mXE/2b+myhYqz+WW0jvY3pRo3FNTLCxZgDOXNTzUO+Rw0jWE1wORF8c3W9NaYbEAGOaRB5gSycGm9wqLuap1lmbPo0CvSRYhA7HzJdiMVfZc0ze5CmImOLbl00GkgPrXh71s2h+ScZZfYTgic0r7sIrc59gIB/mALIWBemBrJ/t3bnC5m1T6qBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91afb529-df23-45ce-c1ca-08dece369abe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:11:45.4723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMC3FL9CoIIL2xO9MbVxo5aq+siPEkldkpzHBGynq/XEJaANWfYOBh4qopHzJ8sYsEahtu7HmNzX2B6clPDOxqYR+pPPMuz7KgEiztC6YsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series prepares the GuC context ID and doorbell resource managers
for upcoming SR-IOV support that will introduce dedicated resource
pools for VF provisioning in PF Admin Only mode.

Currently, both managers are tightly coupled to the GuC submission
infrastructure and operate on full resource spaces starting at ID 0.
The planned VF provisioning support requires the PF driver to manage
independent subsets of GuC resources and reserve dedicated ranges for
VFs without exposing them to the PF submission path.

Piotr Piórkowski (7):
  drm/xe/guc: Use ID manager to get total number of contexts
  drm/xe/guc: Use DB manager to get total number of doorbells
  drm/xe/guc: Decouple the GuC ID manager from the submission state
  drm/xe/guc: Decouple the GuC DB manager from the submission state
  drm/xe/guc: Add start offset support to GuC ID manager
  drm/xe/guc: Add start offset support to GuC doorbell manager
  drm/xe/guc: Allow reserving GuC context IDs without retained range

 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 49 ++++++++++--
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 51 ++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 21 ++---
 drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 72 +++++++++++++----
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  7 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 80 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  7 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  5 +-
 drivers/gpu/drm/xe/xe_guc_types.h             | 45 ++++++++++-
 10 files changed, 271 insertions(+), 68 deletions(-)

-- 
2.34.1

