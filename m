Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D37F364D1
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 23:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D4110E87D;
	Thu,  9 Apr 2026 23:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSQ3PYrT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrGoKoQ3";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A625510E15F
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 23:01:31 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 639ILkHM3352573
 for <intel-xe@lists.freedesktop.org>; Thu, 9 Apr 2026 23:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 szDQZJpHeLYiXJmahVnEFVzdttSQHWcNOehxAJzYlsA=; b=kSQ3PYrToYXR4Elg
 ZgKAv0RWyY+mBwFhvaDERk6GTtrsOQ5hF8SYd2zS7wt9VG+crzh2ZJON4g1II51n
 PMJ0aWMdcZCg2GgX77f+0TK7vfq/JqcihWleXwH4z8hoT1iH0uD6OjkjDswZvLzk
 ePoBQJ2ZzsQejtbvfuAmKVWMN7WPE1PgXbkkq2EN5w5Sy+PIB+pi55V48z/DXRwb
 d5/YWesSX0aaSER5qjIn6jLrLrqrQp5inXctoaxiWwce5Raj2Od+o+YogqbMBWQg
 omlipNadM/nAngeZ0zv22FoQG/KlUaLdPT5GMbTPO/gm/mwTsLfTknCBr4ogsG9C
 AKJOuA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qt5ku-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Apr 2026 23:01:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2ba9a744f7dso1684634eec.0
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Apr 2026 16:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775775690; x=1776380490;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=szDQZJpHeLYiXJmahVnEFVzdttSQHWcNOehxAJzYlsA=;
 b=FrGoKoQ3VcLIBskqK7dd0E4S6FDdqPFG6WX66wMFq4Hhis6/AgC3as5whjfK4ZuyyE
 DE3wanfVlByhKYvlJKD5prQfEeUUuBk3Ng/Isx5VMP8lJniAs+MNpn2TokNhvCs7L41B
 O86ioHHBLHF5JgoRqFETi2eNiJIQRagI9UacdhIDVlUKYfhItlBSMckL+seFfkgHbI/p
 VriC6p+vavY1/7lY0/MMYcb8XOKL3CBv8xWVvHyhNRthXUSPbtFly3XWTIpjwF/qyqGZ
 ALvLxysfM3MuVOj79Q34Rq7DcAod43YWnApciPvb1r4Ilcs8nrAnVM25xZ920ypTfuVS
 qo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775775690; x=1776380490;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=szDQZJpHeLYiXJmahVnEFVzdttSQHWcNOehxAJzYlsA=;
 b=KUZIRUNFVhbLVL6KUZiBwz5ee0zTS6dX0lgq693hJn7J5mirkb+MxsVHKTUshjRO+J
 hTETKAdmnSrGyW/Z3RFNJtpaCkCT71rHA6VB4bx8pdKe96bHXPCM9KS5lKw3C7lps1ld
 VTo5xYDwFj7JfJoPJENNeTDa8DaQu6mdhEXv51CxwJQgqHfFifqFvoC62cQ6iAqtJ2ek
 +GT1CXr9iNL7OVqCsC1ciHQMhjg/dptmXomCoLveJrWuHgCY8kT3rCy+qg+q3fHh0BtW
 MsRDAlxJL+67dQBSIdgrKpma55OO60YXDoffjeUCAfYIPgxzMKJp2cTMweMJJx5vtt+o
 sCiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT4Dvsb3+fekdoRknhs88nYxMnjm6Ep7qH/EdtSdzQtTaKYyrb+hvFVGs50gHRXiFJdNdIphSIqQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoZn/+7Z8ov7WcSCxj73MZRrKuMZWNcgVuSklxN/L1pGhcpj9Y
 lc8upzewVv89GxlUR+1rfvMcJXId00AOmu7G8VMUVdBNQXoJx5ZhoEhJJszQcfxXWFE+e0wLxBz
 dfNzAUfxB4VuK+MccpA3QoVrEos6aU4EU5umnjCyeGAJ3Bq/wPK7Uk0DePgbgqIx//76Luw==
X-Gm-Gg: AeBDieve2B74b7vYBZl7HMHJGof9u3RWpCab1FuC1mZ9+LpLPiY9tunt1lQPR94wIR1
 W5pm5JBe1PM+dbwDX/HVdMEv9ifIR1xmDn8hAFjyk1J0YrB+wFmvsaijnaGyk5IgFoSM05C2jDB
 0hMIeHpgSv8tByEAEmV3zu0LJi36M7CsbmP4eZ7V0nvFwJDmZsVivRDoMVujfT5HAAoWTiIMA/K
 7FnkLgGjrlnotAtGMYARKyVQwn04jvUb2p8xqHelt/DMZGj5SpevdelqAkbYJPFPIjgIRXKUZg5
 z7jHDdJjbK4toNEu6HFn713zIo8bUc38VUDGtPE/cJXF8nVT3q0BXezmHG0uHAhIrwcad48zobB
 8sqFT5t92tUoYKMry63t5f6TsRFfmpBnjsvY+XRkjRifsBJzESKTo2prkFIAPUdPQ2z1wJ+t+cb
 YWNl1GVc4=
X-Received: by 2002:a05:7300:bc8a:b0:2c6:cdb3:bd67 with SMTP id
 5a478bee46e88-2d5897690bbmr529679eec.22.1775775689470; 
 Thu, 09 Apr 2026 16:01:29 -0700 (PDT)
X-Received: by 2002:a05:7300:bc8a:b0:2c6:cdb3:bd67 with SMTP id
 5a478bee46e88-2d5897690bbmr529629eec.22.1775775688659; 
 Thu, 09 Apr 2026 16:01:28 -0700 (PDT)
Received: from [10.226.48.50] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2d5632a2a06sm1668316eec.30.2026.04.09.16.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 16:01:28 -0700 (PDT)
Message-ID: <413e8508-5f29-4a5a-a583-8360f9e48712@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 17:01:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/drm_ras: Add clear-error-counter netlink
 command to drm_ras
To: "Tauro, Riana" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 aravind.iddamsetty@linux.intel.com
Cc: anshuman.gupta@intel.com, simona.vetter@ffwll.ch, airlied@gmail.com,
 pratik.bari@intel.com, joshua.santosh.ranjan@intel.com,
 ashwin.kumar.kulkarni@intel.com, shubham.kumar@intel.com,
 ravi.kishore.koppuravuri@intel.com, raag.jadav@intel.com,
 anvesh.bakwad@intel.com, maarten.lankhorst@linux.intel.com,
 Jakub Kicinski <kuba@kernel.org>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, "David S. Miller"
 <davem@davemloft.net>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>
References: <20260409073318.2909379-4-riana.tauro@intel.com>
 <20260409073318.2909379-5-riana.tauro@intel.com>
 <e7978696-eff6-4c1f-ab0f-047dccb18b59@intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <e7978696-eff6-4c1f-ab0f-047dccb18b59@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIxMyBTYWx0ZWRfXy0bTr848jZNj
 7iUgotuE3ACWfW5LnAHSWKz+zJ4qQCUo75B/O6CQOoFctldiYuTdiPaDHxV1l0Iukr7SU5XoYFV
 CKEJysMZN8icZ/YnFSSex/nTHfCfv1Ac6IsCkD8mOY0xDYRlGMbEjXw5Wuc5FvBNpfnfQW245Tz
 Gc1wB3IvL2pFhpOIkwnhkoBucVXek1mFTXqWtyp9JJIaoaYsmkNm/kb0TQEINH3ctq+3BYJ1cEl
 6vWBJ/ziGdpOWo1e/tGwjDnGcxgZ/GcDbpAWcf4zidyZfAoIOQmY7/lN53JWVzbYrCaRcRGDVoJ
 upn19XlBQLDb+wluEZX6L8R5YEk4qSO1l7BjeoF8War0jVJBLA81jmGnJZb28foWyVEgj3reFh4
 Z0eAfLDD4URu4u1vCIWNpcAmFofclt868aiVaZXpyQU/ADxnGrBgwPNKJEu0no3pWiLrAZDLhEu
 bCvyfvFirJT53oLLfFQ==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d82fca cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=J1Y8HTJGAAAA:8
 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=QyXUC8HyAAAA:8 a=af6eHWY9oS_2PyDk4DsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-GUID: z0X9csPUgYy-wF44Bx_43yYjYAqO_ilM
X-Proofpoint-ORIG-GUID: z0X9csPUgYy-wF44Bx_43yYjYAqO_ilM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090213
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


On 4/9/2026 1:21 AM, Tauro, Riana wrote:
> Hi Zack
> 
> Could you please take a look at this patch if applicable to your 
> usecase. Please let me know if any
> changes are required
> 

 From a quick glance, I think this looks good from our end.

Thanks,
Zack

> @Rodrigo This is already reviewed by Jakub and Raag.
> If there are no opens, can this be merged via drm_misc
> 
> Thanks
> Riana
> 
> On 4/9/2026 1:03 PM, Riana Tauro wrote:
>> Introduce a new 'clear-error-counter' drm_ras command to reset the 
>> counter
>> value for a specific error counter of a given node.
>>
>> The command is a 'do' netlink request with 'node-id' and 'error-id'
>> as parameters with no response payload.
>>
>> Usage:
>>
>> $ sudo ynl --family drm_ras  --do clear-error-counter --json \
>> '{"node-id":1, "error-id":1}'
>> None
>>
>> Cc: Jakub Kicinski <kuba@kernel.org>
>> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
>> Cc: Lijo Lazar <lijo.lazar@amd.com>
>> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
>> Cc: David S. Miller <davem@davemloft.net>
>> Cc: Paolo Abeni <pabeni@redhat.com>
>> Cc: Eric Dumazet <edumazet@google.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Jakub Kicinski <kuba@kernel.org>
>> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
>> ---
>>   Documentation/gpu/drm-ras.rst            |  8 +++++
>>   Documentation/netlink/specs/drm_ras.yaml | 13 ++++++-
>>   drivers/gpu/drm/drm_ras.c                | 43 +++++++++++++++++++++++-
>>   drivers/gpu/drm/drm_ras_nl.c             | 13 +++++++
>>   drivers/gpu/drm/drm_ras_nl.h             |  2 ++
>>   include/drm/drm_ras.h                    | 11 ++++++
>>   include/uapi/drm/drm_ras.h               |  1 +
>>   7 files changed, 89 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-ras.rst b/Documentation/gpu/drm- 
>> ras.rst
>> index 70b246a78fc8..4636e68f5678 100644
>> --- a/Documentation/gpu/drm-ras.rst
>> +++ b/Documentation/gpu/drm-ras.rst
>> @@ -52,6 +52,8 @@ User space tools can:
>>     as a parameter.
>>   * Query specific error counter values with the ``get-error-counter`` 
>> command, using both
>>     ``node-id`` and ``error-id`` as parameters.
>> +* Clear specific error counters with the ``clear-error-counter`` 
>> command, using both
>> +  ``node-id`` and ``error-id`` as parameters.
>>   YAML-based Interface
>>   --------------------
>> @@ -101,3 +103,9 @@ Example: Query an error counter for a given node
>>       sudo ynl --family drm_ras --do get-error-counter --json '{"node- 
>> id":0, "error-id":1}'
>>       {'error-id': 1, 'error-name': 'error_name1', 'error-value': 0}
>> +Example: Clear an error counter for a given node
>> +
>> +.. code-block:: bash
>> +
>> +    sudo ynl --family drm_ras --do clear-error-counter --json 
>> '{"node-id":0, "error-id":1}'
>> +    None
>> diff --git a/Documentation/netlink/specs/drm_ras.yaml b/Documentation/ 
>> netlink/specs/drm_ras.yaml
>> index 79af25dac3c5..e113056f8c01 100644
>> --- a/Documentation/netlink/specs/drm_ras.yaml
>> +++ b/Documentation/netlink/specs/drm_ras.yaml
>> @@ -99,7 +99,7 @@ operations:
>>         flags: [admin-perm]
>>         do:
>>           request:
>> -          attributes:
>> +          attributes: &id-attrs
>>               - node-id
>>               - error-id
>>           reply:
>> @@ -113,3 +113,14 @@ operations:
>>               - node-id
>>           reply:
>>             attributes: *errorinfo
>> +    -
>> +      name: clear-error-counter
>> +      doc: >-
>> +           Clear error counter for a given node.
>> +           The request includes the error-id and node-id of the
>> +           counter to be cleared.
>> +      attribute-set: error-counter-attrs
>> +      flags: [admin-perm]
>> +      do:
>> +        request:
>> +          attributes: *id-attrs
>> diff --git a/drivers/gpu/drm/drm_ras.c b/drivers/gpu/drm/drm_ras.c
>> index b2fa5ab86d87..d6eab29a1394 100644
>> --- a/drivers/gpu/drm/drm_ras.c
>> +++ b/drivers/gpu/drm/drm_ras.c
>> @@ -26,7 +26,7 @@
>>    * efficient lookup by ID. Nodes can be registered or unregistered
>>    * dynamically at runtime.
>>    *
>> - * A Generic Netlink family `drm_ras` exposes two main operations to
>> + * A Generic Netlink family `drm_ras` exposes the below operations to
>>    * userspace:
>>    *
>>    * 1. LIST_NODES: Dump all currently registered RAS nodes.
>> @@ -37,6 +37,10 @@
>>    *    Returns all counters of a node if only Node ID is provided or 
>> specific
>>    *    error counters.
>>    *
>> + * 3. CLEAR_ERROR_COUNTER: Clear error counter of a given node.
>> + *    Userspace must provide Node ID, Error ID.
>> + *    Clears specific error counter of a node if supported.
>> + *
>>    * Node registration:
>>    *
>>    * - drm_ras_node_register(): Registers a new node and assigns
>> @@ -66,6 +70,8 @@
>>    *   operation, fetching all counters from a specific node.
>>    * - drm_ras_nl_get_error_counter_doit(): Implements the 
>> GET_ERROR_COUNTER doit
>>    *   operation, fetching a counter value from a specific node.
>> + * - drm_ras_nl_clear_error_counter_doit(): Implements the 
>> CLEAR_ERROR_COUNTER doit
>> + *   operation, clearing a counter value from a specific node.
>>    */
>>   static DEFINE_XARRAY_ALLOC(drm_ras_xa);
>> @@ -314,6 +320,41 @@ int drm_ras_nl_get_error_counter_doit(struct 
>> sk_buff *skb,
>>       return doit_reply_value(info, node_id, error_id);
>>   }
>> +/**
>> + * drm_ras_nl_clear_error_counter_doit() - Clear an error counter of 
>> a node
>> + * @skb: Netlink message buffer
>> + * @info: Generic Netlink info containing attributes of the request
>> + *
>> + * Extracts the node ID and error ID from the netlink attributes and
>> + * clears the current value.
>> + *
>> + * Return: 0 on success, or negative errno on failure.
>> + */
>> +int drm_ras_nl_clear_error_counter_doit(struct sk_buff *skb,
>> +                    struct genl_info *info)
>> +{
>> +    struct drm_ras_node *node;
>> +    u32 node_id, error_id;
>> +
>> +    if (!info->attrs ||
>> +        GENL_REQ_ATTR_CHECK(info, 
>> DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID) ||
>> +        GENL_REQ_ATTR_CHECK(info, 
>> DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID))
>> +        return -EINVAL;
>> +
>> +    node_id = nla_get_u32(info- 
>> >attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
>> +    error_id = nla_get_u32(info- 
>> >attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID]);
>> +
>> +    node = xa_load(&drm_ras_xa, node_id);
>> +    if (!node || !node->clear_error_counter)
>> +        return -ENOENT;
>> +
>> +    if (error_id < node->error_counter_range.first ||
>> +        error_id > node->error_counter_range.last)
>> +        return -EINVAL;
>> +
>> +    return node->clear_error_counter(node, error_id);
>> +}
>> +
>>   /**
>>    * drm_ras_node_register() - Register a new RAS node
>>    * @node: Node structure to register
>> diff --git a/drivers/gpu/drm/drm_ras_nl.c b/drivers/gpu/drm/drm_ras_nl.c
>> index 16803d0c4a44..dea1c1b2494e 100644
>> --- a/drivers/gpu/drm/drm_ras_nl.c
>> +++ b/drivers/gpu/drm/drm_ras_nl.c
>> @@ -22,6 +22,12 @@ static const struct nla_policy 
>> drm_ras_get_error_counter_dump_nl_policy[DRM_RAS_
>>       [DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
>>   };
>> +/* DRM_RAS_CMD_CLEAR_ERROR_COUNTER - do */
>> +static const struct nla_policy 
>> drm_ras_clear_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {
>> +    [DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
>> +    [DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID] = { .type = NLA_U32, },
>> +};
>> +
>>   /* Ops table for drm_ras */
>>   static const struct genl_split_ops drm_ras_nl_ops[] = {
>>       {
>> @@ -43,6 +49,13 @@ static const struct genl_split_ops drm_ras_nl_ops[] 
>> = {
>>           .maxattr    = DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>>           .flags        = GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
>>       },
>> +    {
>> +        .cmd        = DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
>> +        .doit        = drm_ras_nl_clear_error_counter_doit,
>> +        .policy        = drm_ras_clear_error_counter_nl_policy,
>> +        .maxattr    = DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>> +        .flags        = GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
>> +    },
>>   };
>>   struct genl_family drm_ras_nl_family __ro_after_init = {
>> diff --git a/drivers/gpu/drm/drm_ras_nl.h b/drivers/gpu/drm/drm_ras_nl.h
>> index 06ccd9342773..a398643572a5 100644
>> --- a/drivers/gpu/drm/drm_ras_nl.h
>> +++ b/drivers/gpu/drm/drm_ras_nl.h
>> @@ -18,6 +18,8 @@ int drm_ras_nl_get_error_counter_doit(struct sk_buff 
>> *skb,
>>                         struct genl_info *info);
>>   int drm_ras_nl_get_error_counter_dumpit(struct sk_buff *skb,
>>                       struct netlink_callback *cb);
>> +int drm_ras_nl_clear_error_counter_doit(struct sk_buff *skb,
>> +                    struct genl_info *info);
>>   extern struct genl_family drm_ras_nl_family;
>> diff --git a/include/drm/drm_ras.h b/include/drm/drm_ras.h
>> index 5d50209e51db..f2a787bc4f64 100644
>> --- a/include/drm/drm_ras.h
>> +++ b/include/drm/drm_ras.h
>> @@ -58,6 +58,17 @@ struct drm_ras_node {
>>       int (*query_error_counter)(struct drm_ras_node *node, u32 error_id,
>>                      const char **name, u32 *val);
>> +    /**
>> +     * @clear_error_counter:
>> +     *
>> +     * This callback is used by drm_ras to clear a specific error 
>> counter.
>> +     * Driver should implement this callback to support clearing 
>> error counters
>> +     * of a node.
>> +     *
>> +     * Returns: 0 on success, negative error code on failure.
>> +     */
>> +    int (*clear_error_counter)(struct drm_ras_node *node, u32 error_id);
>> +
>>       /** @priv: Driver private data */
>>       void *priv;
>>   };
>> diff --git a/include/uapi/drm/drm_ras.h b/include/uapi/drm/drm_ras.h
>> index 5f40fa5b869d..218a3ee86805 100644
>> --- a/include/uapi/drm/drm_ras.h
>> +++ b/include/uapi/drm/drm_ras.h
>> @@ -41,6 +41,7 @@ enum {
>>   enum {
>>       DRM_RAS_CMD_LIST_NODES = 1,
>>       DRM_RAS_CMD_GET_ERROR_COUNTER,
>> +    DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
>>       __DRM_RAS_CMD_MAX,
>>       DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)

