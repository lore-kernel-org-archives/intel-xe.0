Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AF2103E2E4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 22:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E75610E3F5;
	Wed, 11 Mar 2026 22:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ganKYpHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB1410E3F5
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 22:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773266968; x=1804802968;
 h=from:to:subject:in-reply-to:references:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Ox4HuDEZIxiVUeCQgnLr6dlfnqYYgVRPhcsEifXMV2s=;
 b=ganKYpHnB53RNo4y87jixA1YcxyNHxAJ/c9IU7+wcwey9oPN7a/QDNQ6
 oFRfZyqv821H18fpN/yONWcmpnAmqEKeKMY8mzI3/K1XoZUNKELK26x1b
 h9y6Me/wiFP1mL4Rz2X3GdwGNFD9cHeba7BOEZ5xPP9nWIY3//NM87MdS
 h5uSQHRhtWc6XD8NWXZqzNpSAXsTQCseMFiYWDy9rlHGhWQbbcNtRiNbI
 4w3Ll6N5Ko7DBvOholesiK580RLwjAlC+QRRbRT37WpToDjqBakb4Y4lB
 RL7dYS1Z9F2h53esnR1FLIvnTrR6llvVKFhHKLKJ/nvR1uatiYC6B7t1j Q==;
X-CSE-ConnectionGUID: oGvN4UF6QEi0Okh5oknsvQ==
X-CSE-MsgGUID: N4VbHlNuTVO6YMLqGqhVhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85438129"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85438129"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 15:09:25 -0700
X-CSE-ConnectionGUID: V9gx2mNVT1aOoMNulA9UGw==
X-CSE-MsgGUID: DPVzlphTTK+YMLvNKKat9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="220569583"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 15:09:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 15:09:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 15:09:22 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 15:09:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4PdI0Jsdgvb89PFhDzM/892yfyNC3S6TVQWKx0/LwMssanaPRkM9w19zl6BE47syGx26/4tcdP6uPDQsoqY/nTzl1xFyFLupwik/FEkR8adrKpatzYD/I/meyzc10oe86+SfHYOLlXDJAXN7c+m42oFeFYxLVtEdcPWE07/fFzybiA9ITnfLGKMqrSTjUpwV+ro96kJ6SN+FRQet7kCUmTpBdqwjkeaDeDAD8HrjqrToNIdZ3AmUtdu7NZ9MP93ldiMoQ0CZmVGlf1zKOrj0GLFM/GTmPuedV8ag3L3NpU5aNiusymF/htxpgvxZnARVzXgOWEqafJdhZqhyCofpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knK1vyB1iOydI+2+uUYA19PpTs1R16BzsByLkAvk9Hk=;
 b=o3EJ/HoLvWkVLtk3lHz4FrUx/gi6nydh5RPgIjE6fioLMwie+jtdn9THemolJhJXxXlNFZehv7G+aXbVTVNIPf14L47fe1QaWftQ3kyq1OFQdTd0td0XVoHrLhGCV6Jaaof71dl5vXvNn5iv/oqj5hjj2M2n+0KtvYxF0EpG2hsW6y5q1/d8foX3ZRoX7vTEX4QPIQN/EG9wB2Qkc4ap6z+ep1A/e2ANgV9E+aLLHrfN/nV4FWTYgUjdFkzaY9LC5UVO99ec5fT9RwPryqyc0WWejeu/6I4kFh6QY+bzNsPYQ3lrSGa789k4cyGmif0V+DQtUj/JUbSK87UYyTIlPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ5PPFF6F855567.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::861) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 22:09:12 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 22:09:12 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
In-Reply-To: <DM4PR11MB5456C9921D64DCF63901C692EA7FA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v1-1-163d5f826b30@intel.com>
 <DM4PR11MB54568FCCFAA9BBED0EDC4C10EA7EA@DM4PR11MB5456.namprd11.prod.outlook.com>
 <87o6l5m2yn.fsf@intel.com>
 <DM4PR11MB5456C9921D64DCF63901C692EA7FA@DM4PR11MB5456.namprd11.prod.outlook.com>
Date: Wed, 11 Mar 2026 19:09:08 -0300
Message-ID: <87jyvi588r.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ5PPFF6F855567:EE_
X-MS-Office365-Filtering-Correlation-Id: d2db445a-b77b-44bf-65aa-08de7fbad373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: X1HlxkWkSP0daW171laT30h5WMUlnx791UpDzhnCJn9JJ/qctqZUyCxcLaop1hFFSgDFs+pLEYEctrJ5lpu/FvWSHC0CVpSQMSTNppoIRnXXowD/HCD63fcGO/r2MRO2hu7Yj19KXWdMHHQ5N3g2wIuJ2ja0dH5dg4otLHVRdbOcprX+NpCbi5hbbTCGMz8h8vZXctOiI9hIIJwSDoZMMoca7u1e1zFyI5B0QyONPnplqDXHdrTyhw4MqsdLgOZul43W0AY9W+310RTJA04q9UlhrCLZqquoIWhe7Z4m38wWmxckUTYTXW+v6o31uxM5WtldJMzG0gb2NZ4SXfRj6uLnUvLMOaKdMiUqkRpTfQWJNTOfqK+R+qka+jJ8y7qexhk21vigFztAirBIii7RJR+3l9rbW6TPFfvifbx8KJLi0QF96ddSYm17b+h+9LTItPTZuAiwoaC1eeoPlcHfKqTeOLJ3kjfCZaONyNchQieBHtlFJUOTRMdiQLcle90EVNlehCTw07RXGgtOJcy0y2U1twHLkP1ngHYR8XWijR8HnqGJAsQCgH5k3aeKpDJ5+wsquzldFV4VYxkV/R62Dkerm0DI2LdApq9CWraIdIcnEo8GPekmC7dziAcRk/TqPbutXOeJ6Cqk3pMbMBABw8SuDmAn8Ggpy0G0Y4A3QdKpie8SbdeVkvTvehVs0bNk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkFkKzFLcExhSjRzdlJaWElKaEliam9QYXh1MnNXYzFYUjBvaDVaT2Zld0J1?=
 =?utf-8?B?WkJIM2FhTVZ1Z2VnSFdkMmY0N1Y2TWxVa3RuNjI3eE5uOUdxYkF0Wi9YVkox?=
 =?utf-8?B?V0lnTi8veGhyQTMxZGxEWDBlK2VLeFlVWmtKcU53YUZndUNnUktlQUR6TDR0?=
 =?utf-8?B?TnZCbnlVQW9yV1JjeXJFN1FkbnEwZTQ5cjRmdVovaHlRbXExUmZ2T0hWMzZ0?=
 =?utf-8?B?dStBdXlHNGU0V2Y2Z1cyN0x2UUFVbmlMblBWWmxBNEV2VHFiN1NwMUdaUmRq?=
 =?utf-8?B?d2hMUzVLMEpySFVlL0U5aEdCRzVERU9VUmZjclEzWXhhZGVSeUVpUkJ0OFR5?=
 =?utf-8?B?RWpoNFFMa1JQZ2pkeXFGaW4zTjh6N2hXR3NRbWpRY01BcFVCOWFvZjNiWkls?=
 =?utf-8?B?NGdiZ0xHck5EZDdoOVhGOStJNjdOWDRRWTJqckJ1alV6VDRtcFhOS3BiTzNs?=
 =?utf-8?B?V3dNb1I3aWxHZG1rN0NnVnZtWk4vbnpzVFpYamVCVjhlSHZXSm5NZGFYN3Rv?=
 =?utf-8?B?bFN6SHYvb21iWUEzNEZlOE14VFpLdlZVaGJvbzNmMHhsNncyOGlQY1hpa3RC?=
 =?utf-8?B?RnF3UnNMRXNPUGdUOGxCZGdYTVlOUlVoTFJGUDI1UGE0SWZqS0JzT1ozTWlu?=
 =?utf-8?B?cTdoNnNHQy9DMGU0Q3Zhd29mcTVDa09zclJhMzlEb3N5c2FXT3hubWY3aVJs?=
 =?utf-8?B?cjFHa3AyN3dnYi9XdWYxclp3SW5IUUlTa2c4NDR0UWJBTWRmOFFwZDU5Rkgy?=
 =?utf-8?B?T3NCamg1OE9HR3ZjNmhTRjdhL0JwWDJyKzJtQ2IvK3pkLzRKbVh3SDNnSysz?=
 =?utf-8?B?N2pFWlBsczc3dEtsZ1ZJUzV5MXNyWncxNEpSQUdRUzhYd2RGTElwWHZyM1pC?=
 =?utf-8?B?aENiUmd0ZFBMOXBRNW8yVWlrbE15cHRkYmRtbXN1MzZ6UEo3ZHNRaFcxNjc0?=
 =?utf-8?B?OEw3T2EzZE1sSHJmekxva09DWmI1VXcrWEs2cXlkd2FDSnFoSDE1Q3NSV1B5?=
 =?utf-8?B?ckhydndYcG9sRW4zcGw1RnNOeEZZdnFOSUp3N2dvV3E4Q1BvT0pLK1VMVENZ?=
 =?utf-8?B?czYrejNoZDFBOElVbnZQODBudkp5TitXZmg3V3FnUjBvUW9Oc01mVE9jOVJl?=
 =?utf-8?B?aTRVd2xPK3VPVTV0aUJXZXFGNUJTVVkxVVMwbkNNbk82d0JMTDhqaUNKWTJw?=
 =?utf-8?B?T0I3ZThwV1cwaFhGWnNKYXRSQXNVSHBxeWw3eVg5amh2TlNxd0N5dXIxMDZM?=
 =?utf-8?B?cEV6cFV4bUIxMnE2NjlDbzNBVElGWll2OTdqTXFOU3hkeFVVZ2QxRXZ1TjYz?=
 =?utf-8?B?QndqSEU2bXdacmVEUWthalhOWFFPeGtuY09keEVobitYaHlCT3JKMlVLSitw?=
 =?utf-8?B?ZEVJd1lyTTJBRmNHUDlWQloxdzgvaDBhcCtUMjN0YXNhenNPZ05vRjRMNnhO?=
 =?utf-8?B?UVpoa2NmODhQN2RGVmZmOFFWQk5Ld1ZrSlI4RXVnZVRSeXBTaEtyVmVLanBk?=
 =?utf-8?B?R2wxbVVtZUM5czlUNDZvdWVEbmpybytxN2E4blJyT2xjdm1aaFQ1cUxaUW9l?=
 =?utf-8?B?ZkZ6cnVReHpEU3c4L1FJek8rUXVROUNyQ2grd2FxcFJjR0RjNjV5c1NjR1Q4?=
 =?utf-8?B?V3FMaWU0ODRzTmpGd2sxMHIvTWdkaGxXaWFkOURjOWxVMmdxTVVtVmhFZWNY?=
 =?utf-8?B?aTlxRFduRGU2dDVjZHd2NE4xa2hoUkszQ2lKdSs1Q2RDdzRnelpUQzNhQ0o5?=
 =?utf-8?B?TjQ0ZGdsN0pmZnVWSXdDSkxRMDQxemRvSmRZa0xHRlZuaHczNFZpZFVHaUo4?=
 =?utf-8?B?R29FYU5iL0RtMllWSkdIWVJhN0lZSXhmNjE4eEZuakcrazBuYitmTm5zYXBS?=
 =?utf-8?B?ZDV5QlBlZ1pQQ0Rqc25ZUXlMWkMycWNGc2RMTXhZbi9XUTBib1BaOEZaUWc4?=
 =?utf-8?B?cHRWdmQyb3lTUWJTS3NaMjQrcTlTOUVVZkEyY3doNmIxTmRxaXhWU1k0azdx?=
 =?utf-8?B?cmpjYzNNdDZHbnZmVUt6V3kvU2M5SWVjenVwMmczUFpyV0VKMm5wcnAwaUE1?=
 =?utf-8?B?b2pKZkhqdFJjd2tPdjV4THY1WlREeWp6bjlLbHZqNGZqbmoyR3hRTGxOZnc2?=
 =?utf-8?B?STRtRmJ3K1hYd1dtbk14T3VPdGhQUE1UVitSa2Y0MVRvbjVZaUtoSFZ3SklC?=
 =?utf-8?B?RmNCdVBVVkZydmNySVlTQnFndnhqVFgwOHdNbmNsYytCY3FmR0Z5S3g0cmJ6?=
 =?utf-8?B?Y29Za1M4R0plOUgvM2RMeVhSKzg0NG1sTkdyK0d3Rk40WFhXUWtnYmFjcXdY?=
 =?utf-8?B?d0pwMEhoN3IyVlZsMWpEcW1pTHl5enlKeUJxNmg0RnJrTHBNN3kwRWNXZnhM?=
 =?utf-8?Q?5UofCmUSgihTzgCE=3D?=
X-Exchange-RoutingPolicyChecked: OVUm93Wc72QlIYQnG1gvnqf/8zMyM5Qvbwdx4g/dbtUfj+/frSAZOxMkUxgkGSYVayd2zeM704JCbv01vOwZOZNBiQVVDUcZ7CVXIycj5jJnHoO/nvjywBvU9+CjJTGJ0FlsWryAntb9tISziNKuQtPBoV/GNYXyPIIo0TRLIDdn0iFRDZY05wPNEnvRUZzWBAx4t46yMSuWDShQCq32rUc9V0ZYZ3rRURCjy7AlMQ0kfl1kGfD5FUaYdejSCqNXt4cn9it3Ghdd91xjiRcOaHOYh2vq2m7FSGGuSiFD4yw7gFo4w53u+MbWT+wtEZqG2Vzk/yE50U38Sj8uVerSbQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2db445a-b77b-44bf-65aa-08de7fbad373
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 22:09:12.3541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AC+dQ0UMCLgHHodJ4jSlz7D804Lw44zDCchbnIhNgj1cubbZPjVSJ8F+W0dYNAsg9FIBV6KhA0MqxR0xOVMfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6F855567
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

"Lin, Shuicheng" <shuicheng.lin@intel.com> writes:

> On Tue, Mar 3, 2026 5:56 AM Gustavo Sousa wrote:
>> "Lin, Shuicheng" <shuicheng.lin@intel.com> writes:
>>=20
>> > On Mon, Mar 2, 2026 10:19 AM Gustavo Sousa wrote:
>> >> When media GT is disabled via configfs, there is no allocation for
>> >> media_gt, which is kept as NULL.  In such scenario,
>> >> intel_hdcp_gsc_check_status() results in a kernel pagefault error due
>> >> to &gt-
>> >> >uc.gsc being evaluated as an invalid memory address.
>> >>
>> >> Fix that by introducing a NULL check on media_gt and bailing out earl=
y if so.
>> >>
>> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 6 ++++++
>> >>  1 file changed, 6 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> >> b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> >> index 29c72aa4b0d2..1cac00c17d4c 100644
>> >> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> >> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> >> @@ -39,6 +39,12 @@ static bool intel_hdcp_gsc_check_status(struct
>> >> drm_device *drm)
>> >>  	struct xe_gt *gt =3D tile->media_gt;
>> >>  	struct xe_gsc *gsc =3D &gt->uc.gsc;
>> >
>> > If gt is NULL, this "&gt->uc.gsc" is already undefined behavior.
>>=20
>> I don't think so. It just turns out that the offset will be invalid. We =
are not
>> dereferencing the gt pointer here.
>
> I also thought it should be the offset of the structure, like offsetof() =
do.
> But it turns out not correct when I ask it to chatgpt. And here is an art=
icle to explain it:
> https://medium.com/@Code_Analysis/null-pointer-dereferencing-causes-undef=
ined-behavior-32462a200106
>
> So, I still prefer to move the assignment to after the !gt check. =F0=9F=
=98=8A

I don't have access to the C standard, but the article and its
linked material sound convincing.  Thanks for sharing that!

I'll incorporate your suggestion.

--
Gustavo Sousa

>
> Shuicheng
>
>>=20
>> > I would prefer to move this assignment to after below check.
>>=20
>> I think that might be unecessary. Would you agree with keeping it as-is =
based
>> on my argument above?
>>=20
>> >
>> >>
>> >> +	if (!gt) {
>> >> +		drm_dbg_kms(&xe->drm,
>> >> +			    "not checking GSC status for HDCP2.x: media GT not
>> >> present or disabled\n");
>> >> +		return false;
>> >> +	}
>> >> +
>> >>  	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
>> >
>> > BTW, if gt is not NULL, then gsc cannot be NULL. So this "!gsc" check
>> > could be dropped.
>>=20
>> Yep. Makes sense.
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >
>> > Shuicheng
>> >
>> >>  		drm_dbg_kms(&xe->drm,
>> >>  			    "GSC Components not ready for HDCP2.x\n");
>> >>
>> >> ---
>> >> base-commit: 40e52ed6c66cef091579dd7fe49ccd2de135f5c5
>> >> change-id: 20260302-check-for-null-media_gt-in-
>> >> intel_hdcp_gsc_check_status-071898b8a402
>> >>
>> >> Best regards,
>> >> --
>> >> Gustavo Sousa <gustavo.sousa@intel.com>
