Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52646C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 21:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A28610E213;
	Tue, 14 Nov 2023 21:12:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD2410E213
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 21:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699996365; x=1731532365;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Ka1FpIoE41ADaB5/Lfg0E2ohsWVcMxmjjvYGYph947s=;
 b=RPpJudpK3CMnFdZk2h0HL2FbvrI2YabylOP9kog/CB+PGXDU8ekRtKgZ
 b5WfpUiNPu/IUZH60sKySnYAmazaTIC64pQf2riiLc7PHnK+HVjtE5hNT
 /0b9yxRbCrxOWmXZMMbze9qYBw3GP1qjObCQaRur77uFCMKC8+qdwEGA4
 1AU4aZ3Cib5rNTOvOI4rSoT47NyGbiLOh17deFegzS1o3KXZdwM6iqfVg
 ctxTIhVPXJ80JNTqqb8L6oAAG/pNOw4YiVd8My11KwNQfxsJaiAZHucN7
 GMmKBj95t15n9OuRZb5Mn4m6O5Umnv8d1RI6LBlz9Q721j+5T7qUGmBv6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393605536"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="393605536"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 13:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="908545952"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="908545952"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 13:12:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 13:12:42 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 13:12:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 13:12:41 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 13:12:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izyf0P9cuvpouJavK2eJIlaqDJDZWZ+tYh3dbQfYd+dKZXXKxLorQ5vyLxzWLEXDyEoabpYYv2R+MtO0jpqb65YMNkf//tOJFxzjxJftC4I7fS+6OuZDmoMDqGtBlOOsT80BWyjaMmt1WgBWWygAzy72PfTJQABOEUwW6SfgGPR/R5jh3N1+t3+wN1zpyN2sRzhBwue+/kkfKyY46uU0KFmHa/x9CJXM8e/5yhYpcYEkkmIZYLjGNvxNsBINfKpEF3lpGK7u5sL8ebgrT0lvLBpIde/x9NXhQvVLGLUK1m1Xb7xs35KokG4wKKmi7mT4TV0rnRV2A1bJD1ZtsWuYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXSvy/a2zFL1CBHjAN9n2trGq7TNCVLl8OyEYpN7arA=;
 b=iZt5z4InvLj836eR4i8djFDqWoqalDVuhxczK1cW33h9+d3oYBZnpuaABV5YyE4QAqEJbzR333GHGJ1b9I2NhUIq4pGapCbnrZSmjWjllHJW9ulWjhTG/FCutT5Bx38QrH5z/LussFBRKMKMYMBbNARoAemNQl0biML90KZXVKbG7xsuPAV+KEXeQ+ErKasnMH9biz6W3gRYo9JJ6os32EsHelS4TIoglmRbj1W95Jo6VQ/jAaibSu5FDgxlR/gqAem8rX/gcld58j4cTtwoeJlOPhTsEI5dm1imlaShw/xmaDigOEuM4UwDSNt/GWXPatDqk2lKKgPjj7XSUVlW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 21:12:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 21:12:38 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 16:12:30 -0500
Message-ID: <20231114211233.498338-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0083.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c80fe94-d8f2-4370-96d6-08dbe5566e50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6o6/iH28bh/hPFofgI+2V4Nfx5zbpRTkfjUUOo8nGbXcOAOS7hEFbLg7hoAi7ryhbj2kUA6/PTncjwfYWII6vm0IjMehSjdyN8RhtIiVm2fSTaZ/qxrIg+Px0qGSEnCNTyfKD2B5fjETZyRB0xbAquVyatMd9OUOYpH7c/eMiOZPTKV6muo+17Y2rJNiUJypYpbiWDpnDlQj9BIvUljSpk/HEjhxZexBQXXvb7/AoxKO3CxtSXZ6RhrsavB7xX5Rt7yckOBEUIuvsv01YzjJq//GkSFMH8msJnMrzxY5aPVWLB5i7rlwO9kj9icvhRdGPW35MY9H5vgEOZ5J+CrhnHHIOgLsyV7ew7MK+UK9hpn3Z98+lwvQAOEjWvbdKPddIKVGiGOJJBlia622QPxJVTHFv+RS6MVwXoMMzgfj247nHDtp6V1tA8IWeACdvEpNgIywJHcxNC6LxYRsxPpBsu7JRYkCEZR7GZp/5NH3Pg86oHm+ym8Q8bk3hvTxK6QnGqFWvSn1JDj27OXhN0IArB4xZdEoR8BsrV5+FHjFBUl3x5KeJvZuiPh8GoMvMIuw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6666004)(6506007)(38100700002)(26005)(107886003)(1076003)(82960400001)(66899024)(6512007)(41300700001)(2906002)(4744005)(44832011)(8676002)(8936002)(5660300002)(4326008)(86362001)(36756003)(6916009)(66556008)(66946007)(66476007)(316002)(2616005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ovLR7+wbIkiqjZrwOLqYuho2We2eT8g/zdAdac0G3r6CsJpbXZ6i/PFvTLeP?=
 =?us-ascii?Q?Uy7OebcwF6KD6VPbu2Mzf8SSXmu0wo0PT62aBKgG5ZbK0b4lWXDnGgXDLthr?=
 =?us-ascii?Q?eSx3AqBkG1xhuN7vNAFrFemUyQkE9kTd1EHX4/DaOnTt19Nj+RdXwcqavQnI?=
 =?us-ascii?Q?BAgtFzNCg97HGLOx0j2PUHRiytBfa0U3zFNDp1sW3uM18fXMbUCtOdgejUmD?=
 =?us-ascii?Q?Sh7ilAUQ5vCKLCo2EvkgD4Wki9/nUxVCuvccJ+Je42AR4KpA2DRrmnC+bA2Y?=
 =?us-ascii?Q?Afs1nSMOAoVUhuIeBnLRcC7DMentp7uCr1wTfZi9XjTRxm1Vs0iiA6DPlasA?=
 =?us-ascii?Q?30eb2acBHfTew9xbf/JuBbFNS+6Mvqz7/2GTViUdh98AYjHFyP9M7c2n1Flu?=
 =?us-ascii?Q?WlNVBjVofWRd5LvkNgROCY7stdc1FLllYSi8/jmx+ZV1g3GQG2X+DHkqdf68?=
 =?us-ascii?Q?lg6ut6RYF8CJCEhPqcRKzjn0ya97TLc8qeoz8k0Fto0JBRtOW4p5i6PVJB35?=
 =?us-ascii?Q?FQI3e/dOxfS55FZzXhjh5NvjyBdAaEjiP9nrSKf1qAucfn7hR8IFEq3aqrvQ?=
 =?us-ascii?Q?WoDl8BRucfCMOKQTd12yKM74zFWjCJ/W2ViYejjjvrnp5k8PVGPuo+i1zBB5?=
 =?us-ascii?Q?jJBK4ZCqY6CJcMiPAIMFvZSALgm9+lrWyIV1VSYl+8KKVCFzj8+FR+15U0gN?=
 =?us-ascii?Q?ZkWa6xBNQ5PXl77EAMUxtSV/rbnZnxVwOCzjQN0uRCQI87DLj/UqJHwaQWvT?=
 =?us-ascii?Q?hV3APsXMd9J6nKWXvni7tZQxcp5ECeSbUpQhc4MOfFpW0xToTeex46iKt5q/?=
 =?us-ascii?Q?t0YRkV/Se55pfxZJyWA4YrNUwUQUFyUuecKGVj87WHHi8wiUuracsmVKCgwr?=
 =?us-ascii?Q?bnh/mQYjjsb5nNYM7bcreYnziZZJ//TEli3zjeYHIENp3ZpJ2UXLLBpikInY?=
 =?us-ascii?Q?omtnhKFyUUuHM531ykHODznXMgavRf2gjcJawVhHaU2ZMThMuly9WkFBuEGf?=
 =?us-ascii?Q?+yUZ8tzgpxBJT/vKo5KsaLCTrD+JQu85qQa8L4IVTpQFdsWpK+7kJZshFrQO?=
 =?us-ascii?Q?umsePLOLuupqY7GNr54RImBYsqpBS426GdX4ZwoeJqXoK/OofyRAh1z0XWD8?=
 =?us-ascii?Q?AW8f68Pp3sUUMpIMOtmn/FX/Th6oaUE+myZItgarNbXRU78X11olWvSI9MYb?=
 =?us-ascii?Q?ZcnjYnQ8aGfPMzbwNUU1EyCq/mR0O+rx4I54RJDf5Kd2JDDthVJRPtMKaNfT?=
 =?us-ascii?Q?0Oq84L0gjD3aPjP3P0I+dVHMRxAOIPs9DNeFZVcIzlTPYprmYZwSRjyQShv8?=
 =?us-ascii?Q?OtbROrDw2DxflexQQVGUNBCHJ8ASzYtBqHI8nkd5ZfJCFC+9YFMR+TeofJFc?=
 =?us-ascii?Q?VmOwMl/zl6pAlF5ftk80Pd9uWRcx0g+w8nTaDKzt2z8kfph2FBt9vu4lrbdK?=
 =?us-ascii?Q?6bKupURx4MGVYb9hMRKyTLwk1wpn6XdbdQeTV/MT2NU+BATCZgeFrD7JV3At?=
 =?us-ascii?Q?dzCYPjjDdzbs8LWRo5PhYv00I9nPq6+YqZauDQ2+WWna5sZczs27mOXEjfzo?=
 =?us-ascii?Q?ZOR1ARWKKPFHxtSy2WndVNI7O3re/XFH+7RhbTHk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c80fe94-d8f2-4370-96d6-08dbe5566e50
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 21:12:38.5432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLkm8y33AnOyX2hhMytKJzss9m7Vi6ENfghh9J6B9+AfCbyz1wP4W8HWydELypoLLEeByu1mMU6cHvqVYm8oEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 0/3] Split i915-display and xe-display patches
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We cannot have this patch as is because it is touching both i915 and
xe in the same patch and also because the change in i915 is part
of the commit ("FIXME: drm/i915/display: Remaining changes to make xe compile")
that is getting split and cleaned-up.

Instead, let's squash these changes to the original patches and then
deal with the i915's FIXME patch later.

Rodrigo Vivi (3):
  Revert "drm/xe/display: Allow scanout of bos that can be migrated to
    lmem"
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support


-- 
2.41.0

