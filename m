Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CEA606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 23:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eRJFtu9d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjdJWl0i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735C610E05A;
	Wed, 25 Nov 2026 23:47:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7163610FC97
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 23:47:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6APJgsfM3661445
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 23:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v4EPTRFRpp7XGFI+5X2K4uKoxAmcr26/1DpjMKxoo3k=; b=eRJFtu9dNt8eC3L1
 l1WK2rPIPnZofCCoKzCrVBTvbX78YJPDwI1b9rVApSMIOOYdPtf+BmBHO8KMFjv9
 czN69ASD9Mxih+0g6F1iBOKVRVEoLc96iDHfUSd0iXEVQjaNt5+Ss768GYHeUqSy
 /hzoMw9/N9bR1lKrYq+DfAACLPN8nVDC8LMaAfpvtzHW/8WabgLokxcsUIVIarPy
 Vm1xnkFtzMm4C6hd01BrwQ1jmX/k6wOpBSfilGOaBIiuHVXxjwwKq8WinMcttpEx
 8qoZEFqG0KB6ZaA00I/nFlCKJTtvHsk/1/ySpCkrgu/V7znCV3nYUcT0I/sUXeu7
 yYhx0w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y0m99-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 23:47:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30bcb065bfdso6698605eec.0
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 15:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795650420; x=1796255220;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=v4EPTRFRpp7XGFI+5X2K4uKoxAmcr26/1DpjMKxoo3k=;
 b=CjdJWl0iJlgDzFe2TELjPql8EMkbqSwM1gJZJlZV+OfVAkyWXSJXd18U8tf9UfzTpW
 sOKxS1kUsFNsSIr7Q6nsHB/+h4koLJk+v8o4RDd5dYHTdO2SD1U2vjyQicATIGpLqKpa
 /0vCUcX1n+aunr3wAgGnMy2bzjfKqn0MSYzKNX4Z96USBx9tEld7+JL7xEPc20NCT/RG
 GNpxkdsjHi0X76mWpxXxhO/YNfFWtlGwlARVZJIpMTVNhjggSCMlXBnfXgqOjsUrFva4
 AWizv+jFkfsbzYWBRmmS0XynD+r5bl9FsurrCR0MABCDUl/bTA3aaHGX1JtD05bmajua
 H1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795650420; x=1796255220;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v4EPTRFRpp7XGFI+5X2K4uKoxAmcr26/1DpjMKxoo3k=;
 b=rkycsZoDfnnsVtPIHrI3wSZiKQrN919APjUDvyskbC7pM9/yqe1fh+mBDN5Fn77Fos
 SS+0vJJk/PWgRPukbv4p2eG/7mI5JZRuTH0lcAzFPcRA5cAMKk81fBeo4RL0DjRylDle
 d1qbjgt+0ctpsInFjz6NnOyzHGBP2TZvZsmEpzG7FDTfMnT0hOGZY606FH95q18g0YD6
 IN8nvkEIVCciJM/AOMj4CWD95npZ5NswON9S4/kqiR0XCHr0PQLRxpKW/7ZLGpxHRFV4
 L+vdC91zkohsOEhxdZcfsyHKEC2PtDfgmLJIrOayGIotdjGIofQZhVTmRtsDTbdLJ3Ki
 Bflg==
X-Gm-Message-State: APuU4Z9FFhO5yJoGCFwh4Ka9sxmzHafHE0f/CYUL8lp/BEHDy35LOcRQ
 gt7chT+WC7dBayLqcZwMRSnN0kkuFEC9AOsQ1QcGpT95e8ytjPLKUOQzmLGVaAY/+84bcD3M18A
 M2FCI2tV4JqzfnkxECPUyN+m5kR9FXEzx4MfftzQZCUFWYlJiRLqZUajslOva2RaTS1SESQ==
X-Gm-Gg: AZFdTZfQlD4MfZ10P6IdKA23gk1UEU878jtmBjBTwgzplfMBpyoSKKK3bDXjo+jdxHk
 pwrVj+ch02gEClaSvs/jCLrf48FIOmAgd0N2Z8pS9yIINZI71tX7d3p4B4yQnqkh88BM44zYCbJ
 ngL0OetBheW+1igwDPNQgi0EwqCM/vOpugoRoRH89dHqwumZpJ/ywL9IBPYv8S02nVN98g4M366
 tu6UfneJoDpP2hJSCuOU+i7f4morL96la5BA2V2xBMkMvzg8EejVNO+LnEptn8i28Cuob6z1yEe
 hBvn/qkuqSI5zBXh7CCOTmpmFCtLW01LvIiXgnQm0eipM85uf7PjYpbIuYVlmotM9uP4Knsk80T
 jq9KF4SyE8evCpnE0BFtwILFcN+/sQIyfwu4ipYslyagKIvBU/zTS49MK17pgZe0DyYtDXMkhG8
 nr2rGdA0KY3dl5n/sb67Pl8ZZFofnUe0w=
X-Received: by 2002:a05:693c:39cc:b0:386:48c1:6c5e with SMTP id
 5a478bee46e88-38648c1719dmr17337597eec.37.1795650419994; 
 Wed, 25 Nov 2026 15:46:59 -0800 (PST)
X-Received: by 2002:a05:693c:39cc:b0:386:48c1:6c5e with SMTP id
 5a478bee46e88-38648c1719dmr17337564eec.37.1795650419323; 
 Wed, 25 Nov 2026 15:46:59 -0800 (PST)
Received: from [10.226.48.50] (Global_NAT1.qualcomm.com. [129.46.96.20])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385677c0c1dsm63351573eec.21.2026.11.25.15.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 15:46:58 -0800 (PST)
Message-ID: <1e813c76-fc91-4a2f-805b-65d49423af5c@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:46:55 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/ras: Add retired-pages node type
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Riana Tauro <riana.tauro@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20261125190249.156217-4-rodrigo.vivi@intel.com>
 <20261125190249.156217-5-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <20261125190249.156217-5-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA5NCBTYWx0ZWRfX5E1yyqmBj0Kz
 PMjqqqU52mJP1wpyr+X3spoI5Q1JcpnLOTocfsKq4k2jICQDW/f16yAiGH6IRXVyBQKgtBZ1di6
 rsiOZlwbUqIEavWijzMUvaSpaWdabM5eaE332EYoPT9RLZBgXvPivVMYDvv0ll+zdJNbYKNROiD
 AqEubRU8pat1pXHr7CX+ETyjIqLYpGTHv0hrQTCloQLyCCipvqFuZT9n4AtuwgFs213ycpXv7nm
 7JaCEFts8DrRU4NECX0sMKrp/yq4E30WkVCR42OLV1hHKD+xMG98UXvvbR+j8N7GutNM5tvTFOg
 y70Unf44QPuTDX0IErJIocFm8zikEpjGzd3rdRUtSLa7sG+0Oz1OakfTocwdZ7tr+tuMrFxPLNJ
 I9urO2K0rVZh7L0HJREBR/3CoBPj4XjoP2wjxghmV9P0i+5JxIbDArNsCuWH591nfgmMDqVD52O
 3EEy7jP9jIqMxcwZP8A==
X-Proofpoint-GUID: POXcLENfYPDZiClv5R3aNy2lWoyjdQe9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA5NCBTYWx0ZWRfX1TupotvlqXip
 cOINg5FpzSUaAbHIUO8UoVKJPmHbTuXFUgU9yDn+xSK2IYYYO/+XSQx+lDeh6KXdsDt8s5LNvlU
 ysgymK61JkYgfbcfyzU0XcKcrCKzZJ4=
X-Proofpoint-ORIG-GUID: POXcLENfYPDZiClv5R3aNy2lWoyjdQe9
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b077374 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WzBhym4ACXGa_cC0HbkA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250094
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/25/2026 12:02 PM, Rodrigo Vivi wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> 
> Add a retired-pages node type to drm-ras so drivers can report the
> memory pages they have taken out of service, with two operations:
> 
>   - get-retired-pages: dump one entry per page with its address, size
>     and status (retired, pending or failed). The dump is flagged with
>     NLM_F_DUMP_INTR if the list changes while it is read.
>   - get-retired-pages-info: return the maximum number of pages that can
>     be retired.
> 
> v3 (Rodrigo+LLM):
>   - Split the drm-ras core from the xe user.
>   - Flatten the page attributes and name the node type retired-pages
>     instead of retired-resources, avoiding the over-wrapping
>     anti-pattern pointed out by Jakub: the type-specific nest and the
>     resource-type enum are gone.
>   - Use uint for address, size and max-pages, no pad (Jakub).
>   - Start the status enum at 1.
>   - Move max-pages to its own do operation instead of a leading dump
>     entry.
>   - Set NLM_F_DUMP_INTR from a driver generation counter.
>   - Report unknown node IDs with NL_SET_BAD_ATTR.
>   - Removed deprecated Assisted-by tag.
> 
> v4 (Rodrigo+LLM):
>   - Check the dump consistency once a page message is filled (Sashiko),
>     and on the final NLMSG_DONE (local Sashiko), so NLM_F_DUMP_INTR is
>     not lost.
>   - Make the error-counter operations reject other node types (Sashiko).
>   - Hold a node reference in the new handlers (local Sashiko).
>   - Rebase on the telemetry node type, moving the type check of its
>     handlers into drm_ras_node_get().
> 
> v5 (Rodrigo+LLM):
>   - Split the node and callback checks in the clear-error-counter doit,
>     and write the new handlers like the error-counter ones, with
>     put_node labels and an inline dump loop, for consistency (Riana).
>   - Drop node-id from the dump entries (Riana).
> 
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

The type check in drm_ras_node_get() looks good to me.

Acked-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
