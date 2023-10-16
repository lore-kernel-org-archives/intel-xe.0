Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8916CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 17:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7CA10E08C;
	Mon, 16 Oct 2023 17:43:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FE610E08C
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 17:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697478203; x=1729014203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jv44d6MEynLQDoWIxZsmf0w7wWgFB7iKWXeJ/wbkz20=;
 b=TNlPruv5Nbwr32UnoDqFAYC3fWgxc3K4nVdVON518oZvsubRqY8FEJp0
 ZCrzFaF02ZEiYCGOXnNA/3hASwmw9N9DZi0co2IWBYXDLKmloMYnkBfrg
 kT/ViH3JbYSoAngvCwlYPeTO/FIZWWBQAyuwyHA4i9/usXGedNDCLDE3T
 UNc7jkmr/ph0DMLSGt+OQqSkbY/Yd+TaeeOpB+Yq1hg70ioChUdBTLHcT
 TpbT3ULV8gdWYOfv5VTfzTXQfptDH6Qxj5qT24VVuK/GTf1+SguSxpr0D
 F+73UUmizrsXURQoLr2Y+5ow9T0tYhOqt7Kdaeyjn7uNG4cS7UqT1Beir w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449812291"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="449812291"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 10:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="872211227"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="872211227"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 10:43:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 10:43:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 10:43:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 10:43:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 10:43:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+XxnkClgYGwt1FCpmy8q7lOIMRwzqwSwQr8InMPhDLknkZcskKnPyuGiWBGXRNaMGTC5KqcyrZ3ECDP2F5/MVw2urrURsTxG+bQOWk/Ztk+WrWqQEJaGGG0+Ew8y5VDxrDdGF1JZNexRaUs35ESGQLu4Tzquuy7q3ZeJwcdu00HU+viH8NWhZDQe0jTbeaPT7pu2w+4C7lJwvPrCoHeC04404oo0001Tgz+U8gD8PSYhZjomFfIjuJCgzW5LuQ4lUFHGhLQ+lDtYVUWLwylNuE8YkTMovXrucwzRvk5WXMi+ADOHFB3M10+laYtpeoQNj4K1d9cUCkI2t+7ILlcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e33v26OCl7Dhn6kWd7+bg4WsoecCpiBMc1sGALFTFeo=;
 b=Imosw6kgCI//hAJrFSG39DUkb1X7+F1ManicaMTbIlnHNWJ0cqnKsjzXUR+P6PRXye70CuwjoTdw+QC5RAliPAEGc/uni2jfmAbvJ3eI7Ku97E7BPVxI7zInSDsw6K+DGrisRoOq4leDOqrAVZY9oOS4O2R6OnARcNTIq1e0ezfXiTvBulMLV4MOhxh6asKVnySyvHSsL3nGx3ZoqFwGGJw/8tDCPpnG0hf5TZVkzNc+5qu7DygdOnIYzqy6Oyo92bL771c+avIMxecZ1UrUl0swNmtOZF8aBeo0qccx+qD638DeQLhR6o9rPULOhyK3LzkOGdWLbbwGhJ5TkweJDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 CY8PR11MB7057.namprd11.prod.outlook.com (2603:10b6:930:53::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.36; Mon, 16 Oct 2023 17:43:16 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.046; Mon, 16 Oct 2023
 17:43:16 +0000
Date: Mon, 16 Oct 2023 10:43:13 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZS12MUHgYriRokD9@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-12-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-12-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::9) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|CY8PR11MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: db4fd0c4-86e1-4451-b429-08dbce6f6010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFasE2wL4vaGuaxh+yXbBHofT8DBvi80DvK9yjWyb6GGIuGVmyLjI/TWvw933myDgbGmDmbyBSRrBjq8pCmQILAvIwlWtByGRlPC7IdTVQVHDCBJmKeC9gu9CtcXaiAYIxd/mwSodpw2VR+z7Cli8dV4Jly1ZiUQC7l3zs/r5fjOPf5kecRCM6n2nEbtI/MqBak+9/YjpGKzbm68z7yqjO7MIVG7w8g2k9HYVnlwKN3JCELiHCmSGVlvDsl8eeZx4qW86J3431ctbNLnr+b3gOLOxVCdD8wAosqmn/vwbyDkYxDvUeGupM7RLskrMMeCV/nKjoAXOjSXNy5CResW017FsimiBtnLFK8tL+OnPw1Ex3yEgnr7vFX48C3Jx26Qw0TVjWGG5Rg60SYcqSb9MrliE0qSgAzRcUQZTfk3A8CVP4aqfivGiMAL4D8xXWaVT8PkFPv/i7oGczaN582eoMCFjOKsBH9IpaJtg4a9b1yJQWm3P8jGO97wx85fcsJJliX3f8LnG9mN9+QZ8T2C/UuAspxXAYtQvWCi0teYhRYbP/cRmWkyuR7pMHDbEEaW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(366004)(396003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6486002)(82960400001)(38100700002)(83380400001)(9686003)(6512007)(6666004)(26005)(6506007)(66946007)(66556008)(66476007)(478600001)(6636002)(316002)(86362001)(2906002)(41300700001)(6862004)(4326008)(5660300002)(8936002)(8676002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amw5MXhnU0cwN1FCZzRyQ1hNYmNYNVNKRzgzZWJPTzREOUh5OEZ5bC90OEZy?=
 =?utf-8?B?UXJUbHZMYkNYMFEvTDgyTDhLTnRVOFptRElwK0wxaUJwczVwbkt2ZzRSTTli?=
 =?utf-8?B?QXNxZEttcDhpdmgyK25MM2NqbGV5UzV5U3RWUnNKQ01CRVN0dFIvKy9ZTUpo?=
 =?utf-8?B?dkN3U2tWYUlibVhmek1RSkFXWGNoK1BJSDZDRmw4emxCUTBtVDZvaFJwOW5r?=
 =?utf-8?B?Tnl5Z0ZINm1VNDYyVzJFMStucDh1RDQvMHpCNm9uZG9ZVUhTYWw4V1FZaXkr?=
 =?utf-8?B?ZXF2bEYxR1F2OTRrem5veG9xMmVURldJTHlkaWdlZUxNRlFFWjYvYTU3czhR?=
 =?utf-8?B?RU9GZXNZcjcwYXdLUXFNVC9GU2lNQWU3aW5nTmZVd2N6TC9KSC9GU2NyempT?=
 =?utf-8?B?YlZnU2FJeWpINlBCREVMUFpHRzVJSDJJRngxOEVZaWZjaUs1b3ZZTkJWT2Vp?=
 =?utf-8?B?R0krUnB1QStUdUpuZmtqRjcxamtIV0plTlhBbk9nN2FvWmo2cjhjMElMS3lD?=
 =?utf-8?B?U1ZrK0R6TFQvRFRXeStJK2NzeE5YQVJ2TGt2My9QRC9GL28xN3hxYzZTQjEw?=
 =?utf-8?B?bnBINUVyY3dWdUVNMWZJZ0NRV0VCcWNqdVN6WjU5cW1PTWJ3bjJKdURUR1Fa?=
 =?utf-8?B?LzV2d3JnLzgrMEd6RnVJMk5vOXlKNm5oT3J6NHVvWUFNTXNEamQwODh2UCtI?=
 =?utf-8?B?WEZrRXArRlVJSGdPU1lrSkhWS3QrMlB2enBIcWNjUWVzMjRpbVdXS282OXpB?=
 =?utf-8?B?Vm9OcGIyQUQ5eitCTmxKNHVKMDZoZlo5TFpadk4rNnNmUS9RYXdGU0U3aXND?=
 =?utf-8?B?cXRSZ0hicS9UbHJEeDZHRGhWTGtNcUhlVEVJTnhJMGpBbmY3TGc2U2Z2WW53?=
 =?utf-8?B?RWxhczJPRmRqb2tzMnI5YUZOMTgrM2YzZ0JYVWlkdlBBWU5HTCtkcVM2bWVH?=
 =?utf-8?B?MDk4ejNPbkJDaXRZaGl3R0RCZUw5ckVVRFQwQ2Q1eW9tYzd5VXJTajVlZGNV?=
 =?utf-8?B?Zy8vNTA4OEYzTDZyYm1WRDhrZFJyMG9Oa0ovZjdiTlprN0MyLy82VVlzTTlp?=
 =?utf-8?B?MGVwdnVTb3ZRUGl4Z0xKMnJvYXkvQVh2Ti83Ull0ZzFHaC85VExveit6U3hj?=
 =?utf-8?B?YTBUT1JIUmpUZ0dSV3VSd2pnaHh0b25PWGppeldxY3FHMjdsVzJLV2VGZENX?=
 =?utf-8?B?b29SUFNJcnNuRVJsU0NlOHN0cGtRSWhFWjFFOCszaHhDTmY1UWdZa3Zpdk1O?=
 =?utf-8?B?Z0dhVE5HM2d3d0RlYldqaExMTXFmTHovRnd4UnUvVWhuWVQwMVZxSTZ2TWxN?=
 =?utf-8?B?dmxFRFN4d1VoaE95SUNpTVNXK3pVTmgwYWlWZU0wRXB1cDNVcURFSkdUS0Q0?=
 =?utf-8?B?THl0MU9NTExVQjQxTnRjL3ZPSG13eEdIbkE2ZkNZSVB2K0Y5L2lxMWxpRi9a?=
 =?utf-8?B?UWpHakF1MVNQV0djamJYNDRQYzVoUFpKRlRGOXRKSXBsdlYzS0J0Uks1dDhR?=
 =?utf-8?B?REpRdU5IL3FjS2xxUytFeUV5SFRhNHJwZ2VKSFBWTnR6a291RlBuVm9lM05K?=
 =?utf-8?B?REIvdUJGUzR3QVVMK1dVUzVMcHlPUEQrOTdiQW1rR3VlU0p2ZHV1czlGbUlJ?=
 =?utf-8?B?d3NXQW1pTm5ZTEIyS1l3WTk0dnpwUy9xV3hkMmI0Ym9rdGpjKzBpMXBiNzBF?=
 =?utf-8?B?aDllQ3RFNVZvMldrN3F4Y0p4b1krZXZpT3JZakNEWEhOekNnYVpIY2FOQW5P?=
 =?utf-8?B?RGZEVHJkZS9KQ1hra0FzYklOYVRnK3pzV3VWd3ludHdKSXdtbkpJaHdaRXBy?=
 =?utf-8?B?QlR1QmE3dHJNR3Rza2FXVzlrRnVqb2M3WXNOWmJveTYvcmJ2aVZjRkNoMlMz?=
 =?utf-8?B?RGE2T3VEN1JBTEdobUpHaFVkWFNnQkZGb3FaR2IyVWovS2dlL2RuMEh4T0lv?=
 =?utf-8?B?NU50YmdCcVlobE83RGE4a0EzYkZqWDdPWlpFQjFkU0hzSXFrcjdMajFURDRM?=
 =?utf-8?B?TkFtcFhoeUtmTTd2K0RndWk1UDQxd05GVS9DdDRwMHRKQzRUYnAwVVEwSGtG?=
 =?utf-8?B?TERrblJzOElxL1FTbUFPUHhLcko2bHJud1dhZW9yK3pxcHdzYjZMYnZZZnFB?=
 =?utf-8?B?Wkp1WElSb3RxQmZZV2psdWo0VUg5bUhybjExbFJHaVZLcGZpV2xpY3lLVVRE?=
 =?utf-8?Q?soq8QoGZZsMGtXnqqH3lsS4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db4fd0c4-86e1-4451-b429-08dbce6f6010
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 17:43:16.2358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vo2an32wDLeRX912QezWsOIi1fA80CbN5pG1HKn4cOOZqMaPpMZtwDhxpiVsyxA0tQE4oI+ZolpNgfqhuBlBu7eCe7XW8o2pgJJwKImDjFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7057
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/21] drm/xe/oa: Override GuC RC with OA on
 PVC
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

On Tue, Sep 19, 2023 at 09:10:39AM -0700, Ashutosh Dixit wrote:
>On PVC, a w/a resets RCS/CCS before it goes into RC6. This breaks OA since
>OA does not expect engine resets during its use. Fix it by disabling RC6.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

lgtm
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_guc_pc.c   | 60 ++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_pc.h   |  3 ++
> drivers/gpu/drm/xe/xe_oa.c       | 26 +++++++++++++-
> drivers/gpu/drm/xe/xe_oa_types.h |  6 ++++
> 4 files changed, 94 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 8a4d299d6cb02..a91de057f6246 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -225,6 +225,27 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> 	return ret;
> }
>
>+static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>+{
>+	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
>+	int ret;
>+	u32 action[] = {
>+		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>+		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),
>+		id,
>+	};
>+
>+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>+		return -EAGAIN;
>+
>+	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>+	if (ret)
>+		drm_err(&pc_to_xe(pc)->drm, "GuC PC unset param failed: %pe",
>+			ERR_PTR(ret));
>+
>+	return ret;
>+}
>+
> static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
> {
> 	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
>@@ -768,6 +789,45 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
> 	return ret;
> }
>
>+/**
>+ * xe_guc_pc_override_gucrc_mode() - override GUCRC mode
>+ * @pc: Xe_GuC_PC instance
>+ * @mode: new value of the mode.
>+ *
>+ * Override the GUCRC mode.
>+ *
>+ * Return: 0 on success, negative error code on error.
>+ */
>+int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
>+{
>+	int ret;
>+
>+	xe_device_mem_access_get(pc_to_xe(pc));
>+	ret = pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
>+	xe_device_mem_access_put(pc_to_xe(pc));
>+
>+	return ret;
>+}
>+
>+/**
>+ * xe_guc_pc_override_gucrc_mode() - override GUCRC mode
>+ * @pc: Xe_GuC_PC instance
>+ *
>+ * Unset the GUCRC mode override
>+ *
>+ * Return: 0 on success, negative error code on error.
>+ */
>+int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
>+{
>+	int ret;
>+
>+	xe_device_mem_access_get(pc_to_xe(pc));
>+	ret = pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
>+	xe_device_mem_access_put(pc_to_xe(pc));
>+
>+	return ret;
>+}
>+
> static void pc_init_pcode_freq(struct xe_guc_pc *pc)
> {
> 	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>index 43ea582545b57..0a2c7b9a4dc97 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.h
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>@@ -7,12 +7,15 @@
> #define _XE_GUC_PC_H_
>
> #include "xe_guc_pc_types.h"
>+#include "abi/guc_actions_slpc_abi.h"
>
> int xe_guc_pc_init(struct xe_guc_pc *pc);
> void xe_guc_pc_fini(struct xe_guc_pc *pc);
> int xe_guc_pc_start(struct xe_guc_pc *pc);
> int xe_guc_pc_stop(struct xe_guc_pc *pc);
> int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>+int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>+int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>
> enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
> u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index fc0159543dc74..506dd056805b2 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -23,6 +23,7 @@
> #include "xe_exec_queue.h"
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
>+#include "xe_guc_pc.h"
> #include "xe_lrc.h"
> #include "xe_migrate.h"
> #include "xe_mmio.h"
>@@ -909,6 +910,10 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
> 	xe_device_mem_access_put(stream->oa->xe);
>
> 	xe_oa_free_oa_buffer(stream);
>+	/* Wa_1509372804:pvc: * Unset the override of GUCRC mode to enable rc6 */
>+	if (stream->override_gucrc)
>+		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
>+
> 	xe_oa_free_configs(stream);
> }
>
>@@ -1344,9 +1349,25 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 		goto exit;
> 	}
>
>+	/*
>+	 * Wa_1509372804:pvc
>+	 *
>+	 * GuC reset of engines causes OA to lose configuration
>+	 * state. Prevent this by overriding GUCRC mode.
>+	 *
>+	 */
>+	if (gt->tile->xe->info.platform == XE_PVC) {
>+		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
>+						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>+		if (ret)
>+			goto err_free_configs;
>+
>+		stream->override_gucrc = true;
>+	}
>+
> 	ret = xe_oa_alloc_oa_buffer(stream);
> 	if (ret)
>-		goto err_free_configs;
>+		goto err_unset_gucrc;
>
> 	/* Take runtime pm ref and forcewake to disable RC6 */
> 	xe_device_mem_access_get(stream->oa->xe);
>@@ -1377,6 +1398,9 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> 	xe_device_mem_access_put(stream->oa->xe);
> 	xe_oa_free_oa_buffer(stream);
>+err_unset_gucrc:
>+	if (stream->override_gucrc)
>+		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> err_free_configs:
> 	xe_oa_free_configs(stream);
> exit:
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 4063c81e353ff..126692718c888 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -291,5 +291,11 @@ struct xe_oa_stream {
> 	 * buffer should be checked for available data.
> 	 */
> 	u64 poll_oa_period;
>+
>+	/**
>+	 * @override_gucrc: GuC RC has been overridden for the perf stream,
>+	 * and we need to restore the default configuration on release.
>+	 */
>+	bool override_gucrc;
> };
> #endif
>-- 
>2.41.0
>
