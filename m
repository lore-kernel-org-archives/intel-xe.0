Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9A8C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 20:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E8210E415;
	Mon, 13 Nov 2023 20:26:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9E410E415
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 20:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699907190; x=1731443190;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MbOGrigMB8nEODSSzCiKWuVFdrVhTg6M1BOL6Ve/0FA=;
 b=SZsMRWuKa2UPLIMP88II33oZdfnMbLoUf2vzp459sHpUfm3aZYOwWdDI
 +Z2u3mV5DezxwgbDGL+uL8ilzIdHy/SEgnLEurQ3+9bPzgubez6pb/5Jw
 hTsZf+dzF5yWokUDSGqkpT2NoAEoCciQLk87N0BUheKEkati16TBc88am
 0EF4tTp+1EfIV1HaAaonrtoKqcnmfQDTMrBoPGa+ycfHAJMp3zrldXLYv
 SkDGyHlsRXMFwhHdtQ2Zs3p35PBxJOU4yriTnM4LKUjfk78E0X7GSEE80
 +ze1lKhlwrGbhXrAcnsXPv3V0WJcFAvqEWwdxuO5Wus4DKz8OcfBhhC67 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454802342"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="454802342"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 12:26:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="888019289"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="888019289"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 12:26:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 12:26:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 12:26:29 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 12:26:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gN7DO1s/YgdBA24YZskbldYU2+ET1EZ/jS0q5l3O6TCDkHgo9OhYfFUKkMGZuMwQGKpN1JKFlTnYQFz5gh/eRuSgArItf9PuxRVIeTU/vivtx4fzcrQ3tT5v6+cI/ATH9xSjFGmRJ/FdCgEDVQt5y4Dwr9ZwmcZvTIFhTqcG9V6mhSVjtmwynZsqAFsfpXIJpehza0jtDqAx7m6iK9l3R8/KtLZIEFaaOa0TVPSH9EOjVMHKLsCcpjpuoiYzMPN9DudD90U+ozznSASjYcxYoja32PHizrxC1KLoJ0W6V9kcbBh8ZigW7CwPHOqwG0DWwvpjXpaolplQe/qdxeVUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRc/veEmESZyEgB4JA3OfJdR99rH1gWfd6DtATQQ6zM=;
 b=EozLkE1w2r1SXFiIAxIC1dEnu/dBVNLXNilbvhBB002C4ksM+/3t9UhidVVTbZyXUGjEu/Rs4TyYS4R+RizVNPN+PixVwqBGKlsLQpWGeIvAArY2dGOGEcqAAUfKnZaTBh1dqX24WdoxoXHz3+XABGGo87Le9VXDnDjZo3tFfECfaZfDaWtG+1Ms/QuvevgKGWpW0/WaQFEcUwf2kdUwqcJmjJibV359DkIaSavgm87Gzojo/nWdrf2ucu1Di2EwU+maOOL1X91QIznE33xdTWYQlzdXox7sKckX4d/zyEWAYAtOyFui7iZgJuhHWjpR/VYV2vwNgExCNPJBeE0hlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 20:26:27 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 20:26:27 +0000
Message-ID: <a565e56a-3dc0-4073-b657-399a3966f650@intel.com>
Date: Mon, 13 Nov 2023 12:26:24 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-13-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-13-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:303:85::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA1PR11MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: ab566c28-6d45-434d-55d3-08dbe486cfdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXayCgZffpNYeE2NECyiEmCpw7wSU4Pbp6VipS/Z88WHQw82qlbHlxWgwEZ4oohAyiXBCtvMt4PrNwsoWWw5CQ2zBd+nI2zTr2Xt/KIYeiJ3Y7+0+3/0NePgWMgKnD4vfFVWsDICfm58+nFT4euyGs5jcBRTe1UE5IA56OmJ66m/iD+S/3bY26S5vrdH3loXiZOPENh1bbrOihzaeWI6Kr5mlmbpaQL606lCj0MdRT4koO3NhZaRMyUMtc3AhMe1CHIupA5CVvzHjSg4GYLIOkvGjfkTloL+nTSSlTjzymq3q+XyyrGFjuqP0A4yLKizIaF/XZhA3/UKuOvfDhG2tgzM77vb9x0ZOpYHQ3yaAIYDh0U79yEz7D4KKc+LKq/JRV2FKIZxOfgKsdWFTgUwZQy7AL/tzValzWGV51T3Jj+Ys5Ehu9dS3wsCX2gWvvID29GNKI+Wuvc9Z4g0OtY6KxOEKaS0IEmHTDwmnL+DgtC2igZQhwnP/2pLAV6enFHdwrgXEyGqIQAxfL6hD4cVRdCeUMLT2i9hhv1zVTJ466oOISKikpGjKk+hQFaFJD4FDfife3kkCUudvOlR77i5Pd6wuwUaihCxnh9iWlO2CNxJSLKKb6G6KkiV9oJ8U2zHEOeLW5eJCuo8Fzaa+mlVsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(346002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(6666004)(6506007)(53546011)(478600001)(31696002)(86362001)(2616005)(26005)(6512007)(316002)(66476007)(66946007)(66556008)(6486002)(82960400001)(38100700002)(83380400001)(5660300002)(36756003)(8676002)(8936002)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHdzN2ljVE44ZmxBUVI2TlVHTWE2NGs3dit3Rkp6dUJnOG13NG5naW9RRURn?=
 =?utf-8?B?RHZ6OC9kSE5YVFhydzVISkFwTmVXTldTNENPNWt5YWdmZWc5elFRclhEOXdR?=
 =?utf-8?B?MjNMcDVwbWVqSXkxQkhPTlpNVjdRYVpXTVN2dFpJd1c3UGRQZDhJRTV0eGN2?=
 =?utf-8?B?TmJ1bHhnVWsxMTdSMUJQdTZJc0FCYXFHK3dnZ24zV1ZHbUk3VllVbThtZmcy?=
 =?utf-8?B?UGpLN3hENE1nSndvWUxtZ2ZsOUhZaWs4N3hNaHM2YlNCSWhBVWpYLy9ManVK?=
 =?utf-8?B?OHVqMGxyOSsvQmYwSkNQdUt2WjkwOXJRK3BvdnU3bXZBRlFWd2xwU1pnSFJl?=
 =?utf-8?B?T25tdDM3NmhKNDJkY0VpTXd6Ti95TFBkYXRLc2xER1o2N2tQbWJ3VUs5aUZP?=
 =?utf-8?B?QlVnbjBTMUdzRTNxUnhtdFRoODd3bjA4ZWJ6ekVFbnZMTVR1dHJxZEZwQVNv?=
 =?utf-8?B?ejVHeTB2Tit0dElCU2xtcDVDd29OdUJEWkJHY08vRFQrY0d5dmEzL0NFTERq?=
 =?utf-8?B?Tjhobkx0ZENhcEZabmhqZXZ1NHlNWDN1VG5uNWNDQWE5azNpOVVjM3gzT0Nj?=
 =?utf-8?B?cUZEenpLN3N5aDlRSXZzdS9SSFFpWXZmL3R4RzVLWDdYRmRNN0tQaGhpcHpj?=
 =?utf-8?B?ZGhRbWhpWnBkaitremZRMG8zekxCMzdpZUFCNkZZS3hUeUFxK2tFSDFFODFy?=
 =?utf-8?B?NGU4bU03RElDcDYxdndGdG1FQzNrQXFLT3Q1WlJPNm5JenJkNm8yQWp6T3VR?=
 =?utf-8?B?QUIydm5JMmZSUXNHVHgzRjdPdVdiYnZPYmwxaXJ1emxnWGJBTFBVMmNNZStq?=
 =?utf-8?B?N1JnekpTY05KYWR3M2VnZjVLNHRkZytrTEw5dmhTQ0U0aEJTNUlYN1RUbTZG?=
 =?utf-8?B?ZWVRS3FjUEl5MEpxMFdtdkl0N3hHWGovYjdOT0hHZFJwTS9CZ3NqQmNCL2xO?=
 =?utf-8?B?WnB2U1ZZY29wNFR1M1dZMXBzRzBVUHMxYmx5QUlyOEgwZ2RsczZpNTVabjQ4?=
 =?utf-8?B?TGY5SENVSDE3NkxSM1Zmd0NtZFpYc2I5Z2xlRkNmUGhQQVpnSlZLbkZRTzdz?=
 =?utf-8?B?Z2xMRVBuLzdRSWxlbFRuSUpCT2k5VlpEZUg5aUJPekd0enVsVE1jUExwVit4?=
 =?utf-8?B?am9qcmZEVmdzcS9jMnlLaEFBUzhtS3ZzWi9TS1N3ZVVMcXRmMFBDeWR3SGdK?=
 =?utf-8?B?dmt6VFM5cHp2QUc2OENSdTR5TkZnRnJsMHhJQWg3ZjU4dkxEZU02ZWVyaDU3?=
 =?utf-8?B?akJidWtKMzdyOXFBb0ZkbVhvd09WNUZVUVh3NTVBSEM4OFc2b3ltOUpJK0RB?=
 =?utf-8?B?TWN5S1pZdExsYjVKd1NEa2NoOXpONWhHNFVwQitROTRoRlhRdFVFb2xsakla?=
 =?utf-8?B?QjJlMVJVR1JzZ3J1YVhHVldZaHNTWEoyUGowTERDRGxzbnovSVU2MnJQZXI3?=
 =?utf-8?B?TnpNWEpNMHZLZVFWMytQM3grS2NFM0JQTUtCakdKNXAzcEhyMVpKV1dGSTF4?=
 =?utf-8?B?SndxQ2xBbWE5Skk0YkFRTExQVmRBcTRZdzdSd2Z3VzJqaEVaaktuL284VDNm?=
 =?utf-8?B?R1RVTDI3RHRFNDBkb285b3EvZlJ3TnhBNnBUYlhZYVVlalpVZEJwVHQxYzRU?=
 =?utf-8?B?d3VHUWlvTkVYUlgvZ0pPMDB5Tkx1UUY2eWgrRHNvUFdTVVFIbkFpM2dDWXdW?=
 =?utf-8?B?bThmRnQ3TVdDQWdveTVPQUxpL1B2aTdpR2lQTlp0ejk0bXFEQWd1Zk1SZHBF?=
 =?utf-8?B?TDVKN0ZHMjVPenJKTXM4VlRtTmtIcHBMaWFOVk9NNnI5dG43NGdpQ3F6cUtO?=
 =?utf-8?B?YnpZdDJoM2VhQU02L251MXBMSCt6MHl4aWJaaHFZMlpjL3JEbkUrZmNlNUVj?=
 =?utf-8?B?RDV2Qnk5d1loMGJJOUFLd2dIUmNLUVRQQWVLU0IweUM0UlpHc04zaFRzVmto?=
 =?utf-8?B?cHB1OW83TG5IY095MDB5K3h2Y2Rsb1V5L0F1YkxtNlIvM2srNkVnU1p1NHlQ?=
 =?utf-8?B?MHF6VG4wV3Vua09VVmlnTkJFanBQcDN4SmVEWTVjRlh3QjVQWTNJMmlNcTZS?=
 =?utf-8?B?NEJrR0RUb2JYbjlhaFJWQmpuUlRxQitKeWZ3Yzh4dUppcjJLMjBOSklidm94?=
 =?utf-8?B?MzRkd2trRVRHZ0NKVDdmb0FCVy9DQ0RBZE5zVXhoSys3aXhxSHUyYzBNYy8w?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab566c28-6d45-434d-55d3-08dbe486cfdb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 20:26:27.0337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9a/wwzyYlItktcqP+8hAvJeUqR1c0uBDZ02Lw3Q32Yha0cxY5sbTCStgZ+30ms3Q9BWIvS2eLATXn+JHCGOaT2M8VbwB8z+Sb0RUKkmj70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5899
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 12/12] drm/xe/gsc: Define GSC FW for MTL
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

On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
> We track GSC FW based on its compatibility version, which is what
> determines the interface it supports.
> Also add a modparam override like the ones for GuC and HuC.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_module.c |  5 +++++
>   drivers/gpu/drm/xe/xe_module.h |  1 +
>   drivers/gpu/drm/xe/xe_uc_fw.c  | 20 ++++++++++++--------
>   3 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 7194595e7f31..8df7aea64ad5 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -41,6 +41,11 @@ module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
>   MODULE_PARM_DESC(huc_firmware_path,
>   		 "HuC firmware path to use instead of the default one - empty string disables");
>   
> +char *xe_gsc_firmware_path;
> +module_param_named_unsafe(gsc_firmware_path, xe_gsc_firmware_path, charp, 0400);
> +MODULE_PARM_DESC(huc_firmware_path,
s/huc/gsc/;

John.

> +		 "GSC firmware path to use instead of the default one - empty string disables");
> +
>   char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>   module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
>   MODULE_PARM_DESC(force_probe,
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index e1da1e9ca5cb..7f49f95630d5 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,4 +12,5 @@ extern u32 xe_force_vram_bar_size;
>   extern int xe_guc_log_level;
>   extern char *xe_guc_firmware_path;
>   extern char *xe_huc_firmware_path;
> +extern char *xe_gsc_firmware_path;
>   extern char *xe_param_force_probe;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index f57476f57de9..c9360d918b96 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -121,6 +121,10 @@ struct fw_blobs_by_type {
>   	fw_def(ROCKETLAKE,	no_ver(i915,	huc,		tgl))		\
>   	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))
>   
> +/* for the GSC FW we match the compatibility version and not the release one */
> +#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
> +	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0))
> +
>   #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
>   	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
>   
> @@ -155,6 +159,7 @@ XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>   		     fw_filename_mmp_ver, fw_filename_major_ver)
>   XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>   		     fw_filename_mmp_ver, fw_filename_no_ver)
> +XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_major_ver)
>   
>   static struct xe_gt *
>   __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
> @@ -196,23 +201,19 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>   				     uc_fw_entry_mmp_ver,
>   				     uc_fw_entry_no_ver)
>   	};
> +	static const struct uc_fw_entry entries_gsc[] = {
> +		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_major_ver)
> +	};
>   	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
>   		[XE_UC_FW_TYPE_GUC] = { entries_guc, ARRAY_SIZE(entries_guc) },
>   		[XE_UC_FW_TYPE_HUC] = { entries_huc, ARRAY_SIZE(entries_huc) },
> +		[XE_UC_FW_TYPE_GSC] = { entries_gsc, ARRAY_SIZE(entries_gsc) },
>   	};
>   	static const struct uc_fw_entry *entries;
>   	enum xe_platform p = xe->info.platform;
>   	u32 count;
>   	int i;
>   
> -	/*
> -	 * GSC FW support is still not fully in place, so we're not defining
> -	 * the FW blob yet because we don't want the driver to attempt to load
> -	 * it until we're ready for it.
> -	 */
> -	if (uc_fw->type == XE_UC_FW_TYPE_GSC)
> -		return;
> -
>   	xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
>   	entries = blobs_all[uc_fw->type].entries;
>   	count = blobs_all[uc_fw->type].count;
> @@ -248,6 +249,9 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
>   	case XE_UC_FW_TYPE_HUC:
>   		path_override = xe_huc_firmware_path;
>   		break;
> +	case XE_UC_FW_TYPE_GSC:
> +		path_override = xe_gsc_firmware_path;
> +		break;
>   	default:
>   		break;
>   	}

