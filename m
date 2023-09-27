Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D832E80A8A
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 23:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B1F10E5C2;
	Wed, 27 Sep 2023 23:16:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F7C10E5C2
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 23:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695856612; x=1727392612;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/ZN7rbFW7QlODtuICc1CyeMjWufKyWO1eK5MgikXAhY=;
 b=ljNytw0y17VAAMhqGQLud3VpsoDvCFT6QT23JV4wGHRpFbaia4icpQqQ
 WI7RRjBrT/FOWsxNvlNITMqDA3zesyoCu2Xc6kYDCFCL9WrOCJ+saHTRi
 dxy1M057RyUNU6GfRt7smUl3/hn28AkekO1JbR7/ekDOczsAhBt4a+nPQ
 Wa+GD+1EgEHyrJ3lz1sWpwztn1AHbTnCmNLtiwJEiZs4+fxkeKPgQ3ePN
 7PhVPeZJM2GAb7AOzNxDlQrrJ2AaceXfyYEickFLOApV9MzXwcDN6tt80
 fOJQAC60uTlurNli+C3mMynOTeyqzpZFfgP4QblvokboWOOKVQqs+8RPB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="361323629"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="361323629"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 16:16:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="699060193"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="699060193"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 16:16:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 16:16:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 16:16:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 16:16:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGjn90bysc9Bk6v/AUoMHz9CriElR7KyavctWTJQ4C7kykwiIYfmd+r99/ZgrqrOC7g2kq14uVw3iUIYUiQAXp2dts56KeYcT93cq+ejrLVwtD0qJRmyypcMUSwghVB6MUFaHc4j4H0fzVoW/YB1JdAW9qaPb0sMbaNiDC7T+H0WDjFFixGc7neCysMhO+4n4P9Od7Rad3wHkjZbLaZvW4tYSKNtcJ9h19JuN06iGAjTk9QYIrwgwbT+GvVWYjPf53dwjQZfw8fjhjb6GRhLL78aAyolHgpm5wfM+EQ+zrEuuRQtyeIrmDCv1mzJWy21JzpNaVq6i+tszpo2d8Hq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib2qkuUv+uyGR7EccmKMYOCCgBvSg7dD/u0tuHziwJc=;
 b=mZrdy5cCtMRmFY07lh0WbnqM50L8AMQ/h3HlIO3TicINkXb8mhuyNZ/qXH/RMsDLQc9bkmbn/XnZsMYl3MsamR0t6ZVeeB4QaHClbPKSjBbBpBdei/4560UvGN+bdzdO6F02Tb+eVkrbHqcsuOuP7UMqatEHnDCwxKzsA25/+C5Y/4BeysJvV1SXAklMA5l2wsmgxxZIfEcqXuLwBOViLCO0M/5WvmnY0YCNQXr8TbHP8lBA2/oJ2f10NHzIbBc50Oj5Rlbl0KjTs77EeoBA/KFHtrxNe2OhAtMHJjTSK7CQQIAe/6KTpAJ2hIMZTpvSS9EFOqr6zYkHocsNgazliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DM8PR11MB5704.namprd11.prod.outlook.com (2603:10b6:8:23::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Wed, 27 Sep 2023 23:16:48 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 23:16:48 +0000
Date: Wed, 27 Sep 2023 16:16:45 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZRS33TMbpsi63x1U@nvishwa1-DESK>
References: <20230927142919.272895-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230927142919.272895-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DM8PR11MB5704:EE_
X-MS-Office365-Filtering-Correlation-Id: 7592bc82-a479-477c-00b5-08dbbfafd306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDh63Jqr83qi7cCfHsjZbNCI7jw5ckK76N+Gl1tGsMEFVGPgW4lX0l7zEcG3Wl3DlXYCs77HnbZUbPerbMRywuE8JZ+BexVGbf3TzTZBSB74vKN3/Llv21RTC+RDX+8SP9V51p90HkOFv7a19yh3EP0+n+2lBsdZtIpSm9oc7OteSUhs40C7vpnM9bdtJqr5jPzEgXsJAWg52JMZ8IndebEvZX7kWs6mX4NKjgiJJYMThV71w8f2AmLZTWdr4qZla0lmEmQWShaU3SdKjudFRvQgQRKpbB+RDBIWRbzCNqfepIqNVRG4ZL3vLMbgMGRv1hmcYGaVPshSermQoBSqls7//ayLSCwPA4uAie4lqsayJb4YSgCDDeakBmcrXCgBdD7rCgp59TJoIN73e53RNpiXU78s/SAQBP5NpzepNzStnLA6B4MveeIjw6fP2wfDHHXBQ2YCMYJd9SCwONIbZ4fUGyQkLJgPdiuQDzXhnwdsNWn+5ve2yTpjWmO/rvyN3YuO3CH+pPbC2P/ZAvEiCXoTuzvQxEtVFOHaC+yDo0r/k2RAWYZK+nSLeKsez4tV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(136003)(366004)(376002)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6512007)(9686003)(6486002)(6506007)(6666004)(86362001)(82960400001)(83380400001)(38100700002)(107886003)(33716001)(26005)(44832011)(2906002)(41300700001)(6862004)(8676002)(4326008)(8936002)(66556008)(316002)(6636002)(66476007)(5660300002)(478600001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MNyM5JQHv9ZR/5SzjbZnQN91Ov1Vk8yx1NGoOoVCR+gsee7NEx06Kfm9US8o?=
 =?us-ascii?Q?+L7WSOeapFVsBn1mOHgqNFjvz8AGQ2t4gCNc55hSN6NTzIQ9IOn+3wOppKWI?=
 =?us-ascii?Q?Y9xkZ89aDkjs6i+CreVES0ihHHAqXvJiGBT4iiqo8gzpAANUNLIevft+KeTa?=
 =?us-ascii?Q?xj1yqJzzFP7VuEfMfAc4cc2PvK571xrKKszxYQ0zuk4zsy8+Un5rg0YcZT/1?=
 =?us-ascii?Q?pLuqGAB+BBjvregPYbBQsoHfF5NMk5gwnmyDFhJ30/U/EimszW/Dw7xs8xGp?=
 =?us-ascii?Q?8Msa8mjCG9BpRx3it+rntrdSgHtj3Acl86yF40wyGB1TX9RHXJLychBUIkmh?=
 =?us-ascii?Q?tylogS60WKDj4a3wMVjuq6/mwBBalSlRS+zX0wv6H9RrB0AXGoOVXaPQqF/X?=
 =?us-ascii?Q?DmdDNKUt5tSFCLX4/HOTp7Kt+1R04mvexTV6d6Hpsss9RaLKDh8RSOZWiPKR?=
 =?us-ascii?Q?AhaHK/+trXSC1Q1fth8FaZLcZep8a/Rb+FHkyVoooE6sgIe+BJ2h/wE8p0HE?=
 =?us-ascii?Q?28GOy1uDgapPQV2Isev88GTaXBrEL0Bje6NJGWZ0ZHGTohRcid9G1QDm4qQF?=
 =?us-ascii?Q?QYr6Ou5s+JvZydZYuOhePJjLffUQ/fI+Y+iicyNwlislBjnRwco2df3mdsyx?=
 =?us-ascii?Q?iPcHahVgIR8PAIASRKt92JD7qVrut3AbyvHJytJ5WYKuxFJlA9A1yUECvxwH?=
 =?us-ascii?Q?6shHZOn4eg/xfKWkJJ/zjd5mP3xuyx3maEwCZMdvOrsFfEuDCvGyZpff8IdE?=
 =?us-ascii?Q?wQfmVUQbyyoIbn7afc0g40gHx4p8rTFbr0eHaK2GPN2zdvOINEIMeYoBm/ek?=
 =?us-ascii?Q?GWilLI5X44syaSigiw7a0RJqvy2v2NgaGhYkY0JmnEqmluh0TxKiRNrLZHVQ?=
 =?us-ascii?Q?PAyYHG8z5nLz0R3zCn5Hg/6QmFtJi3XlvFXI/QVoAZvLQznr2o65RYGR5BCd?=
 =?us-ascii?Q?snFtg7l5Wqoi1Bfz1zP6LxnzUhvOfuhGHdIlHJMlszWAjwxS0Rpn742U1cu7?=
 =?us-ascii?Q?qZtIjDxygKd16+ukJKdxxMyKS7HTSIvffDPRMJD96JLJEuQisbgZCQLeVerT?=
 =?us-ascii?Q?dl5ytAidTWM92ueojntzb/hf98fwvGTkN4Ew50BEMbX7IxNXm668ui74uVol?=
 =?us-ascii?Q?s9Elt4w2UOKRcCLTPmhc3tZToPgHM5SG4wazymkh0WZL4Ev/eZLiGzHblLK+?=
 =?us-ascii?Q?Egdcp9F9GG+ZOvaAtD874ItJoqzhPdL4hQE5t6b3IoMPdbhU58SDTApaejts?=
 =?us-ascii?Q?Fpmdl8sYbi4sM9wTJJ7M+WiTa0JMBl5W/KyuuGkl42I9vZmwFJ7EJx1c3+49?=
 =?us-ascii?Q?wmk5rQRwDaTqV7mGO/+yxqx4ctlm+lJeI+fYlPd8hhOSFRLbRGfY95f47Z5o?=
 =?us-ascii?Q?FjiNq9K/CtgFfaW+aCjN+hMn8Q58upwh5fvh/DeXRGo39TZK4Fb4vXr2+yUX?=
 =?us-ascii?Q?sBRLxF3bRg1Yp+5/907qiGkxB+nAOKpUXg7aGMBnZmlZQVDjqy6qxGJa8cob?=
 =?us-ascii?Q?Rs3qe1KZW+MS8KyJ3PTZVr6JmLqEOh4a56B8nSzrAz26kvxWubMNdiV7TsJx?=
 =?us-ascii?Q?ecDz+ssY4AJWV344Q7rs0z8Mpv+hUw/nplScf7K9VR+/eHIwt+h2wlrIbTBU?=
 =?us-ascii?Q?A5b09FsSeGenm3wKlnxPh/4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7592bc82-a479-477c-00b5-08dbbfafd306
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:16:48.4970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxNc8IHiBm1PIwdmijC0PdKwAyTFwvZMfL29fF6d6a5Br8RaYdHJIniZ/mu7lA6g9Zyxo4/PIGiBrzFcE9mk7nwVL+fgvufgkMYUt3lsQ2nYWyp8K+wg6AxPOHMTDhx6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5704
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V4 0/2] drm/xe: Count and report low level
 driver errors
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 27, 2023 at 07:59:17PM +0530, Tejas Upadhyay wrote:
>This series adds low level driver error counter. Devided
>into below patches:
>1. Add APIs to count different category of errors under Tile and GT
>2. Add counter increment at all existing error tap points
>
>Focus is not to add new error checks but maintain counter for errors
>on existing errors which can create performance impact.
>
>TODO: Later on when netlink interface is ready, we will export these
>counters through netlink interface.
>

I am not sure if this is a good idea.
Aren't we making it kind of uapi? User can also get this information
from dmesg. Besides we can add trace events if required.
Is there any prior discussion of this design which you can point
me to?

Niranjana

>Tejas Upadhyay (2):
>  drm/xe: Introduce low level driver error counting APIs
>  drm/xe: Update counter for low level driver errors
>
> drivers/gpu/drm/xe/xe_device_types.h        |  9 +++++
> drivers/gpu/drm/xe/xe_gt.c                  | 18 +++++++++
> drivers/gpu/drm/xe/xe_gt.h                  |  3 ++
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 15 +++++--
> drivers/gpu/drm/xe/xe_gt_types.h            | 10 +++++
> drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
> drivers/gpu/drm/xe/xe_guc_ct.c              | 43 ++++++++++++--------
> drivers/gpu/drm/xe/xe_guc_pc.c              | 16 +++++---
> drivers/gpu/drm/xe/xe_guc_submit.c          | 44 +++++++++++++++------
> drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
> drivers/gpu/drm/xe/xe_reg_sr.c              | 19 ++++++---
> drivers/gpu/drm/xe/xe_tile.c                | 18 +++++++++
> drivers/gpu/drm/xe/xe_tile.h                |  2 +
> 13 files changed, 165 insertions(+), 53 deletions(-)
>
>-- 
>2.25.1
>
