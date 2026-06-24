Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3991BCDB47F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 09:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8D210E092;
	Wed, 24 Jun 2026 09:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvzfdYMe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DAE10E092
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 09:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782295009; x=1813831009;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Vv/RciuMk5PnpAFoCBOY7fYGn3zLZboXXUxf2s7No9I=;
 b=HvzfdYMe411Q03PQhkQcQBykoO2hwYD7lMtaAEaoLqH2O+Wc3CmA/LE/
 mSkW43oB/OM0NZQQM71h0yo7satD6rX9+4U9nyG+lpmrG9bS1J0XQRa1k
 Oq3wE5MBigDzJZF07rJop4l1oXul3mgOVRWYIrbnsJqjwhH13UKvENNwc
 2lQQWl6Gplg4foqh4HgOinaHZsUNXHmM4iuGyWAdhOYwmcW8bQrynawHH
 R1EBFSWjL8VR2V5qGwLUKuslfCJ7CdZRhPXbPxWl79eWIYDUQXFb2QRp0
 tpjeKIbsjdI6ghrOTi6gC3ach+RGBkPe/HtnEL/bhSFrtFusgqD8jXEgt g==;
X-CSE-ConnectionGUID: cYI0L/AxQtiWuikQdRqWHg==
X-CSE-MsgGUID: 8f8L0lbtQcqX2XjJksRspA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83171963"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83171963"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 02:56:49 -0700
X-CSE-ConnectionGUID: hd3RcvdPQhOlmj2hA4eX7A==
X-CSE-MsgGUID: 8eHh2+CGTtK1k7bCWKxaJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="253677320"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 02:56:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 02:56:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 02:56:48 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 02:56:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfPgyFiZlxCXbGF7Uko62uOhSJbkh46XudqvtSQ0uHvFJ71fXgjfyTsGz247k5UbGdFZhdlfH6FGBqrQthKR2mQ7tfZLgfJMG487XP1kOdklWfRlQyEbRn9cRJgd0uJep91Z6Bc/5r/YmclpkqM2G0DYwvCmw2xyiQoUIhQLV1rXNNaLricOO7yg2QsOBDNDSmTseVFysl5B1VZkajuzHASVtnIY5a+D1OUboF7Ggsi8Vlo0D/p5RBJtC0TeKhyuGFvAkv62ktboTeBnMW2kV5mXqz6p3oBcKxqVYLg5dhjAFHh9YysK/LqA0Mnds6Tk9n6nJdB7iV+kvF+yGEKa5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3SY6QY4hAfEuUM+n2Poc1qmcG9qsD7sJVRQ3i8XX+8=;
 b=Ts9qZ8lFhdjo15F68UwOg1YG2KqJ5FJx4aUUdghGL2WGgzYm2y2/KbPBDbCFSqfPDZ1wyQ6RCyPG8VltHjYQVma2mxHSHLj7eWYG2NfVwVEINw4J3QZU8OnUxuYGFARnLBO9B8vHkRZ5OSmFhNePwY7NoornZavrvAD0TORkceTsNYHUq4hQSSmN5Mgb36ep2eke5ugrVoO/GooHIkDVoqlKu8/1i9tfHUZ27NO2OVbqUt+m3onwxjt0J+849x8R1PEMKquY8hKv/qHXHSA54L+lHk2EaLa9bv3HxoTuKAKMCPSME7MX0gp16P4MJBOTuZsNxaFIxHsoiPSAlGBTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:56:40 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0159.015; Wed, 24 Jun 2026
 09:56:40 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH 1/3] drm/xe/pf: Do not return an error for unrecognized VF
 events
Date: Wed, 24 Jun 2026 11:56:32 +0200
Message-ID: <20260624095634.1250956-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::33) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: b93698a3-9840-48d2-3f66-08ded1d6e33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: zYzPaO+wUG2V16/Gg6yk3A84HDqkJ09EkTUrvn5PD62G8VlaoH0usvk2Hrs0CKPmT2PKmUJmKaG1j/lXckguskD9LWd1oYTjNEPb9/KfKP5hGCgvBAwFlbELDqFRHQjfPU9mrppG3L0mOTX7EX9kWXpZW2UEPBRjmgaKEWRK2AtlpRKuQoAF8UuGu3LIATZ5sqfW4qedr6PRLc62dw7XICErHUdYPkI1GdLhbtY5yCOAhJPiEqM6N8gtoCAazCb7+1lwnFqHbDYw36sz4PNYI7FA1/nW94RxE6Kzjl7h9ybAoy3PLR9FMPMkg9DMH31r71bc31ggWrWdbDSPzBAMU2Gcms9k6eAf3id7ypiegkIo3BNbJiD7DyDASwsltPyAyTLqf/WjqnEfExUarnFbQ/czafBdzE6HXqAa4CrhBL7WurzDN8ROhBPElCKI7zPAl8XnOOLOzYD3LFuJidpyUvNp1wa4MZ2RDU7YJtTuRPKw4HkUGpi97iHrYD1SZ/qEd+14o/z9BJO3aTqYI2WFUdGczUVLMeasMDtzAGEpPqTrakitObdRpFT4PT1wYrwsEQeziTfwBKW6WpwGRcDfchBeI+shKNvih1ZA3iMty0eNnYv8w1t9o9CgpFTLzN8oFyiALHkoHhWdoTSwHl66OBLdh7R1U6UoTTyfwBvRFlE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVYxUUxMQ1BIQkF2VnU0OXJLdU9GMEZteHRKYjhPS1djdithV1k3cSthUFZs?=
 =?utf-8?B?MWlmYURsRUE1TDExUkN0SGx3d0xRUEZtbXRNbS9talFvaW5XLzQ5dkRaK0tR?=
 =?utf-8?B?TVl2MWZocy9NOVB6VVoxVENEcStwaHZZMHUxL2ZCODBEQ2lFTDJvajdyMnox?=
 =?utf-8?B?V2Jtc2JuOUc5cExPcVVLRXgzNFkzV2FqdWhmQ2pZb1dlTGozbE5hRWg0TlRR?=
 =?utf-8?B?M1dNRDNTY01Rcjg4WWcySkZkQlNJaldXQUJueWlGVTNTS3NDS2V1cHRvcCtO?=
 =?utf-8?B?YXl2bC92NUdVODhKMGJzdjBqVEtIZUZZaUtLM2FnQ1Y0K2t2eHhzR2FWdWJR?=
 =?utf-8?B?U29Ia0RoeDBGaG5CQzJhOURXRFhvYW9zaWlDeE9UbC8yMnRHTEVRYTQ4Ymk5?=
 =?utf-8?B?YUROTDNEVXNqUHBLNGRTc0FnQk9EdUhRaW54OVNPL3p5TEpja0tKaUszd3lE?=
 =?utf-8?B?ejFTeHdzUGlHaElvQlcvKzEwL0E2dkVvQWoyaUw0bmJLK1M4citOTkhFWDQ1?=
 =?utf-8?B?SW9QMi9BVWxjTHljUEVmV21LR0xRck8wOURKRDEzZ1luTHRmOEpYaHhMdHhH?=
 =?utf-8?B?Mk5oNFYwek5NR2huYW9sY0dJUTVuSk1OV2lMZDJ3UFowS1l3VUc1a2J0MXRP?=
 =?utf-8?B?SkMveVhnTWVHSjhCOFdEano4UTd4WHIzZzBPbDNkTEZtbVBJNG04QzBoSVds?=
 =?utf-8?B?elhVQ1BHWDE4T0pwRjRvTE9jaHdMWThIOERNVDZidW95NDQxbGpVUUNITGZL?=
 =?utf-8?B?d3RJN3NwTHQ1UWJEYXVaTnY5ZjZnYlZQK3Z6Y3pla1NEMU5XTEJ2emJycmJP?=
 =?utf-8?B?RFNldmRvWVV1MVFYZER4cWRGc2Fqc0N5OHoxRUhtRUd0d05yZkhwRUYxbzlV?=
 =?utf-8?B?WVBuREo1eG5nc1ZOcGhsYm9RZWphd3MwL0J6WW50cVhrbTF3U2locFFZMDlp?=
 =?utf-8?B?aHRHU2VlTkY2Vzh3VTVIUEg5RGRRV21HMUpCNzhtbHgvOWlsdFZuZFVGOUE5?=
 =?utf-8?B?WGdLKzBYT2w4eEtZd3UxcFdvR3Q5RmdtY0w2RjV6OUlET2Q4Nks2OWc3K1lZ?=
 =?utf-8?B?eEpxK3BQODVPN1RnL0RtQlJqYWhWNVk5WWRsd3VMcWZFOW8wYkcrWVZ1cjRj?=
 =?utf-8?B?eS9pQ094NGZUeDJaN2ZkeDU0WmcwajFwVVhvTXBBaEVWM2U4OHNJYnA0NHA2?=
 =?utf-8?B?MlFCemt5c3oxM2F6bW1tZXJObnljSlh3ekhKbmJVRDZaUlNtZDhZM2NDeTBB?=
 =?utf-8?B?aWxWd2lyZFV2QVcxR2tzUzluaE5UNEhkelJnQVhEMytTS1E5Nk8vbmJIUENj?=
 =?utf-8?B?anp4MGR2SVVydjB0NDJFNEExRjR4VHpBcWhkL3RGWGpaVW03ZDRvVWRNQWg5?=
 =?utf-8?B?VHNlVTlqNXVaLytxd3hvQ29yd1dtZWp2bmxGREJOc1ZNcmxUMnVjWWprdWRq?=
 =?utf-8?B?bktCWkN2eE1id3dEai9zMnZ2eXlVVDc2TEdWVUU1Tng5NHVaNGhScWVrRHcz?=
 =?utf-8?B?WC9Ja2RyT0h5NlU1TjJUR3ZMeEM1TnNyMGZHY0E2RGRoRzhoUnVXWDc5Zzhz?=
 =?utf-8?B?TnI3QW91eWxNMkRZd2k2T2pGK0dOYkU5Z0RwKyttcjFacmRwcytMK0E3NEpY?=
 =?utf-8?B?L2s0WjQwb0s5U3UvaWswZzQrVS9RMjBJYXEydEpIZmRVTjByUUpBcThNTDdZ?=
 =?utf-8?B?ZDd2a1VGMFM4Z1BDaDFScTc2RTJ0dm14b2ZHRXU1K0lRL3VTekVFSjdDZ3Zm?=
 =?utf-8?B?VEg0RlRjUUpSZDhhcmpTeTUrU1Rob0NJaXdpNHkxREFUMU9ncFNMYitETXMy?=
 =?utf-8?B?S2o0N1dzRWxwa3kwVEFqSmFtNndKV2xwaDVqMkdmQkNaWnhjMXB0TjRFcjIv?=
 =?utf-8?B?RkJTa1drVkRlT1RiazNuaGlRZ1gwSmZwQlJqb3JFQzQ0VVhRRW82TndNckZ6?=
 =?utf-8?B?QVFSMGl0MlA0bFJqVnFkYlJUQkdJcktVUU10YW5oZ1QxRW0xRmpMWTFUVlVr?=
 =?utf-8?B?UnhITWZOL1lHQWhnM2lQYjFqV3ZRSFk4SGRMM3NGSUtmeHdpQ3dvOXVKZFNN?=
 =?utf-8?B?Z0dTN0FpcDB4Q0JPcHl5TXl2Qzl5cjhtRW9yZlp5MGpnR2dERXg5SUVhZ2Nu?=
 =?utf-8?B?bHhIQUp1eU5JN0c1aDBNNkd1YmZ4cmVFcnRLV2NrajA1bnRuaTBxMUhBWmpD?=
 =?utf-8?B?YWd0SW5kUzNjNVVUTHAyOVR6Y3o4SW9vb3RPMURmT0VBN0VtcGdCQTlWV2tM?=
 =?utf-8?B?ZEFGMk5vOFc2OTNtVTVabjcwVVpMMEF6alNFR1luM0Fhcy95em82QWUra1Ny?=
 =?utf-8?B?SnBRT2lxYko3dVJOMjNtQzJGV2Y0cm8weWd4bUhQcWtTdFdjZ1NWZW40ZDJq?=
 =?utf-8?Q?Me7QEMievM4vHw8k=3D?=
X-Exchange-RoutingPolicyChecked: fLTSo1EvCalXxNd2pcHm6Tf8F+AG3YEJlQt0BMyPzk+PkUhDSJWqxPMh5gSrXkQonf1Xj7o66n3CbbA78BxTrRoS/POFPvhKaPf0t8opps2q7326Yg5JfMHo4RUb1NtWS5Gy9Ohpu6unwsqslBBPsdCx8vbXUrQLGrB/4HrJibdlxZPX//wFcsyqFgdvZrZbnPUQo41j8IgIA6OrfSfLo/C/hV06Ps0BkQV5TmyGuEuLbf/V7qbbanF03Akj3n09GUWOO89gfdOngx2pTNTO4yScl3EOIxE6N6jEWXvCEqidQL6wsBpfoO2AAzTAxTaVSBn3xRw+Sd/gEtYivwmyYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b93698a3-9840-48d2-3f66-08ded1d6e33b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:56:39.9801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVZ7G1vw95rIhbco8LB7wLfwNPgPY/5cC24/Jl8tt5oIKLdp8CvRo/cAGr1yflBayCz8aBHfxC41MxBwppbRDoPggs0lMXG7kgjNnXNacJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
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

Notifications about VF state are generally not considered critical
enough to warrant PF GT-level error and subsequent reset.
Convert the error to dmesg log.

Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 058585f063a93..65f015d0ede51 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -1973,7 +1973,7 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
 	case GUC_PF_NOTIFY_VF_FIXUP_DONE:
 		break;
 	default:
-		return -ENOPKG;
+		xe_gt_sriov_notice(gt, "unrecognized VF%u event %#x\n", vfid, eventid);
 	}
 	return 0;
 }
-- 
2.54.0

