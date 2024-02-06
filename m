Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2297EC4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BD1112F1A;
	Tue,  6 Feb 2024 23:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHw97LWi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0817B112F1A
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707260447; x=1738796447;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VlWEsDy88Y6X2MZDdUMOpIoxXq3mAgIogMNyF9pLfYc=;
 b=EHw97LWiGNcj1NAPVOpF2WSPe9lNZGdExHrx38H0/t5Xa2Z2znfUnd7E
 VOKWmxi0kGJxZTOxS/LQgJe3sWEgPWt/RCAR2Z0Y+aKxJ5NChzoWq7IBM
 bV9Zq+GQs8tMEoAXvfyb4h6UlLjNPCcM7nfn7b24DGYR1lIxm9GNt/iyu
 Dvs0LPIQ14VqbfLzCEdRSnusrPcb2niYpZJIUB1kzvLxzUh9zI2dnlT2y
 V97JIiasC2VeDw7o/6Ly6YqJGlt4Lqzn/NizX0WWWzE9A6zsydKbLFEYk
 LrAff6IvRGQ3uShEs/f4v5fSqRg1FBCoRfruOV12x7fKWcMBGimWiwesE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1137788"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1137788"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:00:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1440420"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 15:00:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 15:00:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 15:00:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 15:00:45 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 15:00:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrGujOJyaT/6t1Xvp6+6/1oKY6xygdijk+Mu/pDrPD69Jv7xNHmVtBR/oTqR2kYl7F2208g980iQMDyWW8qabWf9MOMjN/EAVki9vVUdq+QenCln1IVFwD50jwVd4QXuIaR+hCKcQX/TbNO65DIkoCh60FblO3K7S7pYw0mdrjXGCFXoDJ53g/y78aq00RysuAKuT3Yd99RTdCPl+S0p/vwDucHJSSs/qiMS1GPD52YTqKMAvBE7v/yZddqZq9Xe7wXVIDOIBdfsTz1YRmukfEDHEicV1fH5SP4VmBbP+8CVhwcb3wEZ3NHlF2y3+jAqPPj8WJL4rAhjIdm44OwFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfrPfe7AOTUAwE2oNMq/Isc+b5VFaLWKhKfjI7dO6qU=;
 b=Bp10nfJouF947LKctuP+C+0cv25WsZKN+BphunB4e6xWBxLx8PQb5XGFLjH7jyeUzQiE7pbfk8n7jCRh9WVDQNJA0tIRXI+xpaFYHW5rZZvChVez+tFNqohu7Ojg5pToASCv3jPO6XuOTK7l/BwqXI6sAWpYZFDHMUjd9WJoZ1IywLuljco2LMYdC8mFe063nrDt31SEXgsyd6SO0CWCRW8Ch071CNnuaBfanoAKrb4MZZkr9fDqCEgaztxx4rUjcum/oMYi+Jif2EluVgmVyTPZchywCvzjChE7KeUqCVkgmIiE+TvZ74lOzE+5Qd+XD11VE95VQ200a1J59H1WXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 23:00:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 23:00:39 +0000
Date: Tue, 6 Feb 2024 15:00:29 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/16] drm/xe/oa/uapi: Query OA unit properties
Message-ID: <ZcK6Dcg9hmSry1LQ@unerlige-ril>
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
 <20240120020026.1261201-14-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240120020026.1261201-14-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0254.namprd04.prod.outlook.com
 (2603:10b6:303:88::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BN9PR11MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: 265d9f7c-20e3-488e-617a-08dc27677000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PXi9ehNfAvYp/JMqeaCbPV+HCqviUoOXtodEaicPwa66pBK0UY8XqNqj14QovPM8+ANO8og6k1h+ita2xOie35+ae00ikq5lvAlE1um+eOlXnW47MQHjhaLAdV9gGGH77bVX01OTgnbKcLIoNA4rMIzuT/Kc3r/of6683uzRua0Ve88iiokmxqU8NwvTSAipJCcUGnDyOEo78Tn1Gcr+6aJ4BttGDxAPZgB2b713kybv0z6kvyHca+abKseXK+4VREaeCxXNHkp6PPyC1eeLbQhO64giFjgzg1ctjJIWXrb/Y9eQJsEfbO5PnINbhv1tOO3YEVPp0QOxX7RE+Lm/n0Jgq3OxX+7dAJr3RIlu3ClGpNIIXz5C11xTgPMZs5XAXsHfwsOKQkP0yexxT63dvnTw/qpv1n3zhI0QSAkqU0kLhmovhvBevh+rybNqPDQwMjyQz1p1Rclqb3IiJ4VWHZKEBGW8t2fpfmmZOdT9klIfa1vzvREfYDu0d9u3R6J5tT6oJKM7PnbUC/iHGBITRDM3gogf07Mze4zdWpLS3vZM+aVZ7Ju3rp8ITjKciflg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(82960400001)(83380400001)(6486002)(86362001)(6506007)(26005)(478600001)(6666004)(6512007)(9686003)(66899024)(316002)(41300700001)(66476007)(66946007)(66556008)(4326008)(6862004)(33716001)(6636002)(8676002)(2906002)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1ZqZW5HZzgzaWtIQ0srUFZSNTBZaUYwekFhSGVCNWYxVUNobktKYkJUdHdH?=
 =?utf-8?B?TisvcDBzVzdZUTU1dFN2YXpsNHhaWEtDdEJMdkR1N3JNQllhd3AzSnR0MHpD?=
 =?utf-8?B?azJQeTQ0bHkxNEdkZzJyRFRJSzcvWnFJbk9ZSFh5RklmVEtOdGRFd2hlMk1m?=
 =?utf-8?B?OXZWU2dlMkVhUUJCUFVOb3ltTEhnak5tSW1oMUZtcTM0b1ZZK2srSTZLMU1x?=
 =?utf-8?B?NC9vRnJVMDB0c1ZlODk4T3NKNEJlRXVmV3ZZaHFzQUhacjUzMSt2UHNkTktT?=
 =?utf-8?B?Y1gyN3RnSHJncXpRdWozZHIzdWhHejExN3VJemxod0hxYlk5K25FNVJNeUlP?=
 =?utf-8?B?Nm9PTHFJRzJSQWdWRkJWOTNwZTkxNlJhRWlCSWZPWk5zUHdDdVd2MVVyc20v?=
 =?utf-8?B?UDhCOTlKSFZVZG9zYU05eVRsZkxMSW5zd01xbFp2L3VPQW9tbTR1VW9IU0Za?=
 =?utf-8?B?K1RsK1JVbHJkTFNSY0g0VjZTYkVwUk1zN3pycW8zaytjbzZEKyttQ1FhdVc4?=
 =?utf-8?B?amF4dGVPNHE5czN4MEpoT2M4TGhyT0J6d3BSRGxrdHZhazUxakd6WWd1NXg5?=
 =?utf-8?B?aHAwMENENmcySlF5V2hLZFVrZkxsbTlTazhRSVNWTlRZbTY2YWIyT3Z2OWtr?=
 =?utf-8?B?U1lreVkrTXlaTml0REIwVXhOV2pMNUc5Q3dlbnU2ZTg5WWRUWDlYak52eXJR?=
 =?utf-8?B?WFZlMTdBN1I4ZmlJaHJZdFYwcVNDMTlIWXVQdXV2clVlNXFOS01EenliTlYx?=
 =?utf-8?B?K3p2SEEvdFJoNUZmODN3VStEK3FHclNmSzJpZ3FVM0pQdWh6V3c5S2piK2N0?=
 =?utf-8?B?VnRvcUxLY2xyU2lTVEJqbElGUlpsa2lJNmdZUlVtTnhRV214UEhkYVA4ajBB?=
 =?utf-8?B?dWhZdVlPdTZtU1kzbWRMMU9PMDQzQzhVTWwvaEgyVFkxek5vVXM5ZUJaR3dO?=
 =?utf-8?B?RENRL0syY2I3NzJ6Zk1oNlBWc01STDNSWEUzVG84RVJNYUc0L0ZLR0lnMmx0?=
 =?utf-8?B?a3ZwczVvSnJuYlBUd0M4b3dJdkZoWkFYODV2MUJMR3pUT1cvOHBIaExxNkZL?=
 =?utf-8?B?dndFcHNyWXV3OUNTV1RuSngzdjM1WmJ3QUxVMGVHNVM3dVpqcHNTdXBZbEds?=
 =?utf-8?B?ZWhuYXlQVFQ5TEgyK1pvSndWb2FpTHVMN0NJWXptTGxYWTVuWGNFVkR4ZDVr?=
 =?utf-8?B?WXd6NXA5aWNhdm5KTTV2dW5LNmhkUng2aXc5Y2hWUC9qT2ZCN1pqL3A1c0tO?=
 =?utf-8?B?akZFeU9EU0QvV1dFdHhQaTdYeW54MlYrZU0zRW1SWlRaR29DemorZWxWbTdW?=
 =?utf-8?B?MVVyNEhNWU90bE40aXVaNHFpRG1NZkRtWndGRmptNWh0NVh4bVFwa3J6MERF?=
 =?utf-8?B?WFJLamR6K3JOcmgrenZzZ1c4MWxpL3FUWVdTbWtXSXBDTzMzTTlUMFpDT0dV?=
 =?utf-8?B?U2NUNjlZbjB0bDUwWVM3YWJ1OWR0NDdKbkNQOHRDWk56cmdnUjBmUlZ5aWdx?=
 =?utf-8?B?Vm1ZdzF1Z2MwQVd0OUt0bXZKTHgxZFZnU0FpQTk5OXA2V0Vjd2s2OWoyTklR?=
 =?utf-8?B?b0YrRGoveTFoWlhSZEd5cEtoTHVJaVppVForWHB2SWcwdXhsMU84bHdtREVM?=
 =?utf-8?B?WTlEVTZFNjFqdmtkbUkwMUNhZ1hHSDJ2d0VKb3BLWjVpdFNPOGs3Z0lTbDcy?=
 =?utf-8?B?bVRuRzhKcDdqWTBXdkUyMGJCNTJiYllUcGhpZERyamYvSit6R243b2gvOUJO?=
 =?utf-8?B?OEh0YTkzV2JzT294VmpSNUJZOXdLa09NNGNacDlsd2txV3pReXJGOEJLb0ZP?=
 =?utf-8?B?T0J6VVA0SW81Y2Y4THNHTyt0YVpFdnozSXpRa0Qyd3IwZ2trWW9WSklRRmpT?=
 =?utf-8?B?RjRpVXhTdEdlSVBsa25Bek00eWdlSm5WL25Cc2ZhYkkvUHdzaEh2bWJkZGZj?=
 =?utf-8?B?Qkc3d0prSkpHQUgwRVBNNXd5VGc2a1hqZU9VTkNHWGRmSXZMSldZajF6Q0ZE?=
 =?utf-8?B?VzlKK2lZOHNBdUJlWGltTDV2c3JpblJsbWFWcWp1YWZJRitIUnNydDlIbUxH?=
 =?utf-8?B?cEpYUzJlWnJROVVIL2JWOEVpQUVpd3RjQjErc3pUMGVGeEVtKzhWVmlra3Jm?=
 =?utf-8?B?V1o2aVJ3YkZlWVZyY2ZkM2s5ODFOYkR0SCsxUUVhQjVYNHlxUTNMZUNFcW5z?=
 =?utf-8?Q?vOuG0sKjkq0DaNJu/g2KYls=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 265d9f7c-20e3-488e-617a-08dc27677000
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 23:00:39.5611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VW3p8LvuVdRuMIldmDANcRh0L1/tYKo/L2ujB+fzEgoDm/TqyWcUqMgLf0KJ9TiKUBSX0oi4gvTcKxaQpemUgh079Xiw/YMKuDwsL10ml+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
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

On Fri, Jan 19, 2024 at 06:00:23PM -0800, Ashutosh Dixit wrote:
>Implement query for properties of OA units present on a device.
>
>v2: Clean up reserved/pad fields (Umesh)
>    Follow the same scheme as other query structs
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_query.c | 81 +++++++++++++++++++++++++++++++++++
> include/uapi/drm/xe_drm.h     | 55 ++++++++++++++++++++++++
> 2 files changed, 136 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 9b35673b286c8..eac266a3d66d5 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -520,6 +520,86 @@ static int query_gt_topology(struct xe_device *xe,
> 	return 0;
> }
>
>+static size_t calc_oa_unit_query_size(struct xe_device *xe)
>+{
>+	size_t size = sizeof(struct drm_xe_query_oa_units);
>+	struct xe_gt *gt;
>+	int i, id;
>+
>+	for_each_gt(gt, xe, id) {
>+		for (i = 0; i < gt->oa.num_oa_units; i++) {
>+			size += sizeof(struct drm_xe_oa_unit);
>+			size += gt->oa.oa_unit[i].num_engines *
>+				sizeof(struct drm_xe_engine_class_instance);
>+		}
>+	}
>+
>+	return size;
>+}
>+
>+static int query_oa_units(struct xe_device *xe,
>+			  struct drm_xe_device_query *query)
>+{
>+	void __user *query_ptr = u64_to_user_ptr(query->data);
>+	size_t size = calc_oa_unit_query_size(xe);
>+	struct drm_xe_query_oa_units *qoa;
>+	enum xe_hw_engine_id hwe_id;
>+	struct drm_xe_oa_unit *du;
>+	struct xe_hw_engine *hwe;
>+	struct xe_oa_unit *u;
>+	int gt_id, i, j, ret;
>+	struct xe_gt *gt;
>+	u8 *pdu;
>+
>+	if (query->size == 0) {
>+		query->size = size;
>+		return 0;
>+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>+		return -EINVAL;
>+	}
>+
>+	qoa = kzalloc(size, GFP_KERNEL);
>+	if (!qoa)
>+		return -ENOMEM;
>+
>+	pdu = (u8 *)&qoa->oa_units[0];
>+	for_each_gt(gt, xe, gt_id) {
>+		for (i = 0; i < gt->oa.num_oa_units; i++) {
>+			u = &gt->oa.oa_unit[i];
>+			du = (struct drm_xe_oa_unit *)pdu;
>+
>+			du->oa_unit_id = u->oa_unit_id;
>+			du->oa_unit_type = u->type;
>+			du->gt_id = gt->info.id;
>+			du->open_stream = !!u->exclusive_stream;
>+			du->oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
>+			du->oa_buf_size = XE_OA_BUFFER_SIZE;
>+			du->num_engines = u->num_engines;
>+
>+			for (j = 1; j < DRM_XE_OA_PROPERTY_MAX; j++)
>+				du->capabilities |= BIT(j);
>+
>+			j = 0;
>+			for_each_hw_engine(hwe, gt, hwe_id) {
>+				if (xe_oa_unit_id(hwe) == u->oa_unit_id) {
>+					du->eci[j].engine_class =
>+						xe_to_user_engine_class[hwe->class];
>+					du->eci[j].engine_instance = hwe->logical_instance;
>+					du->eci[j].gt_id = gt->info.id;
>+					j++;
>+				}
>+			}
>+			pdu += sizeof(*du) + j * sizeof(du->eci[0]);
>+			qoa->num_oa_units++;
>+		}
>+	}
>+
>+	ret = copy_to_user(query_ptr, qoa, size);
>+	kfree(qoa);
>+
>+	return ret ? -EFAULT : 0;
>+}
>+
> static int (* const xe_query_funcs[])(struct xe_device *xe,
> 				      struct drm_xe_device_query *query) = {
> 	query_engines,
>@@ -529,6 +609,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
> 	query_hwconfig,
> 	query_gt_topology,
> 	query_engine_cycles,
>+	query_oa_units,
> };
>
> int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 42474629244d4..2c0949b248d9a 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -646,6 +646,7 @@ struct drm_xe_device_query {
> #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
> #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
> #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>+#define DRM_XE_DEVICE_QUERY_OA_UNITS		7
> 	/** @query: The type of data to query */
> 	__u32 query;
>
>@@ -1405,6 +1406,60 @@ enum drm_xe_oa_unit_type {
> 	DRM_XE_OA_UNIT_TYPE_OAM,
> };
>
>+/**
>+ * struct drm_xe_oa_unit - describe OA unit
>+ */
>+struct drm_xe_oa_unit {
>+	/** @oa_unit_id: OA unit ID */
>+	__u16 oa_unit_id;
>+
>+	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
>+	__u16 oa_unit_type;
>+
>+	/** @gt_id: GT ID for this OA unit */
>+	__u16 gt_id;
>+
>+	/** @open_stream: True if a stream is open on the OA unit */
>+	__u16 open_stream;

How would the user end up using this? Ideally, I would think that user 
should only need to query all this info once and that would be before 
the user opens any streams. If the user did open a stream, then that 
info is already known to the user that a specific oa_unit_id is opened.

Someone else or the same user trying to open the stream again would get 
an error anyways.

>+
>+	/** @capabilities: OA capabilities bit-mask */
>+	__u64 capabilities;
>+
>+	/** @oa_timestamp_freq: OA timestamp freq */
>+	__u64 oa_timestamp_freq;
>+
>+	/** @oa_buf_size: OA buffer size */
>+	__u64 oa_buf_size;

I think oa_buf_size value also changes based on whether the stream is 
opened or not. We could have a oa_max_buf_size and oa_buf_size 
separately.

Also, I am reluctant having this query return different values based on 
whether the stream is opened of not. Determining the state/info of an 
open stream should be a different query/interface. I think the ioctl on 
the open fd was a good choice for that since that would return info on 
the open fd and would anyways be serialized with close(fd).

If the user can somehow know that the stream is opened and also know the 
oa_buffer_size already, then we can do away with this (open_stream and 
oa_buf_size) altogether.

Thanks,
Umesh

>+
>+	/** @reserved: MBZ */
>+	__u64 reserved[4];
>+
>+	/** @num_engines: number of engines in @eci array */
>+	__u64 num_engines;
>+
>+	/** @eci: engines attached to this OA unit */
>+	struct drm_xe_engine_class_instance eci[];
>+};
>+
>+/**
>+ * struct drm_xe_query_oa_units - describe OA units
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query
>+ * is equal to DRM_XE_DEVICE_QUERY_OA_UNITS, then the reply uses struct
>+ * drm_xe_query_oa_units in .data.
>+ *
>+ * When there is an @open_stream, the query returns properties specific to
>+ * that @open_stream. Else default properties are returned.
>+ */
>+struct drm_xe_query_oa_units {
>+	/** @num_oa_units: number of OA units returned in oau[] */
>+	__u32 num_oa_units;
>+	/** @pad: MBZ */
>+	__u32 pad;
>+	/** @oa_units: OA units returned for this device */
>+	struct drm_xe_oa_unit oa_units[];
>+};
>+
> /** enum drm_xe_oa_format_type - OA format types */
> enum drm_xe_oa_format_type {
> 	DRM_XE_OA_FMT_TYPE_OAG,
>-- 
>2.41.0
>
